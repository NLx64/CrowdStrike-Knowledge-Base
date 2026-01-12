# Live Session: CrowdStrike NG-SIEM

## Sobre a Apresentação

Este conteúdo foi desenvolvido e demonstrado durante uma **participação especial em live sobre CrowdStrike NG-SIEM**, focando em casos de uso práticos de **Detection Engineering**.

---

## Casos Demonstrados

### Case 01: Detecção de Acesso VPN de IP Suspeito
**Estratégia:** Correlação com IOCs

- Detecta logins VPN de IPs com reputação maliciosa
- Integração com threat intelligence do CrowdStrike
- Alertas de alta fidelidade

**Arquivo:** [`case-01-vpn-malicious-ip.cql`](case-01-vpn-malicious-ip.cql)

---

### Case 02: Comportamento Suspeito Entra ID
**Estratégia:** Classificação Contextual

- Análise multi-vetor de logins (MFA, geo, user-agent)
- Perfil de risco completo para cada evento
- Detecção de password spraying e ferramentas ofensivas

**Arquivo:** [`case-02-entra-id-suspicious.cql`](case-02-entra-id-suspicious.cql)

---

### Case 03: ClickFix RunMRU LummaStealer
**Estratégia:** Precisão Cirúrgica

- Detecção de TTP específica de evasão
- Foco no malware Lumma Stealer
- Manipulação de registro RunMRU
- MITRE ATT&CK: T1547.001

**Arquivo:** [`case-03-clickfix-lummastealer.cql`](case-03-clickfix-lummastealer.cql)

---

## Estratégias de Detecção

| Estratégia | Descrição | Case |
|------------|-----------|------|
| **Correlação com IOCs** | Enriquecimento de eventos com threat intelligence | Case 01 |
| **Classificação Contextual** | Análise multi-dimensional para scoring de risco | Case 02 |
| **Precisão Cirúrgica** | Detecção de TTPs específicas de malware | Case 03 |

## Conceitos Abordados

- **CQL** - CrowdStrike Query Language para busca e correlação
- **Lookup Files** - Enriquecimento de eventos com dados externos
- **IOC Correlation** - Integração com threat intelligence
- **Multi-vector Analysis** - Análise combinada de múltiplos indicadores
- **Risk Scoring** - Classificação de eventos por criticidade
