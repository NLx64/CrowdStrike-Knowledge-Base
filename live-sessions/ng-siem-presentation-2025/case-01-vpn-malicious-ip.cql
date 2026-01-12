// ============================================================================
// DETECÇÃO: Acesso VPN de IP com Reputação Maliciosa
// ============================================================================
// Objetivo: Detectar tentativas de login na VPN (Checkpoint) originadas de IPs
//           com reputação maliciosa conhecida, gerando alertas de alta fidelidade.
//
// Fonte de Dados: Logs de VPN Checkpoint Connectra
// Estratégia: Correlação com IOCs de Threat Intelligence
// ============================================================================

// Filtrar eventos de VPN Checkpoint
#Vendor="checkpoint" #event.dataset="ngfw.connectra"
| user.name = *
| Vendor.client_name = *
| Vendor.login_option = *
| Vendor.status = "Failure" // A busca está filtrando apenas por eventos de falha, mas vc pode alterar para success ou usar o * para considerar todas as possibilidades, eu preferi separar as regras por criticidade.

// Verificar IPs contra IOCs
| ioc:lookup(field=source.ip, type="ip_address", confidenceThreshold="unverified", strict="true")

// FILTRAR APENAS IPs MALICIOSOS DETECTADOS
| ioc.detected = true

// Extrair informações do IOC
| ioc_confidence := ioc[0].malicious_confidence
| ioc_type := ioc[0].type
| ioc_labels := ioc[0].labels
| ioc_indicator := ioc[0].indicator

// Parse detalhado dos labels
| regex("Actor/(?<actor>[^,]+)", field=ioc_labels, strict=false)
| regex("Malware/(?<malware>[^,]+)", field=ioc_labels, strict=false)
| regex("ThreatType/(?<threat_type>[^,]+)", field=ioc_labels, strict=false)
| regex("Campaign/(?<campaign>[^,]+)", field=ioc_labels, strict=false)
| default(field=[actor, malware, threat_type, campaign], value="Unknown")

// case para identificar se foi success ou não
| case {
   Vendor.status = "Success" | isSuccess := 1 ;
   * | isSuccess := 0 ;
}

// Agregação por IP malicioso e período
| TimeBucket := formatTime("%Y-%m-%d %H:00", field=@timestamp, locale=pt_BR, timezone="America/Sao_Paulo")
| groupBy([source.ip, ioc_labels], function=stats([
    min(@timestamp, as=FirstSeen),
    max(@timestamp, as=LastSeen),
    count(as=totalAttempts),
    count(user.name, distinct=true, as=uniqueUsers),
    sum(isSuccess, as=successfulAttempts),
    collect([user.name, Vendor.status, Vendor.client_name, Vendor.office_mode_ip, event.action], limit=50),
    selectFromMax(field="@timestamp", include=[ioc_confidence, ioc_type, ioc_indicator, actor, malware, threat_type, campaign])
]))

// Calcular tentativas falhas após o groupBy
| failedAttempts := totalAttempts - successfulAttempts

// Formatação de timestamps
| FirstSeen:=formatTime(format="%d/%m/%Y %H:%M:%S", field=FirstSeen, locale=pt_BR, timezone="America/Sao_Paulo")
| LastSeen:=formatTime(format="%d/%m/%Y %H:%M:%S", field=LastSeen, locale=pt_BR, timezone="America/Sao_Paulo")

// Avaliação de risco baseada em IOC
| case {
    ioc_confidence = "high"   | riskLevel := "CRÍTICO" ;
    ioc_confidence = "medium" | riskLevel := "ALTO" ;
    ioc_confidence = "low"    | riskLevel := "MÉDIO" ;
    * | riskLevel := "SUSPEITO" ;
}

// Formatar alerta detalhado
| format(format="ALERTA %s: IP malicioso %s detectado. Confiança: %s, Actor: %s, Malware: %s, Tipo: %s, Campaign: %s. Labels completos: [%s]. Ação: %s. Período: %s a %s. Total de %s tentativas de login VPN (%s sucessos, %s falhas) com %s usuários únicos, usuários: %s",
  field=[riskLevel, source.ip, ioc_confidence, actor, malware, threat_type, campaign, ioc_labels, event.action, FirstSeen, LastSeen, totalAttempts, successfulAttempts, failedAttempts, uniqueUsers, user.name],
  as="detailed_description")
