# Detection Rules

Esta pasta contém regras de detecção escritas em **CrowdStrike Query Language (CQL)** para o NG-SIEM.

## Categorias

| Categoria | Descrição | Fontes de Dados |
|-----------|-----------|-----------------|
| [Endpoint](endpoint/) | Detecções baseadas em telemetria EDR | CrowdStrike Falcon Sensor |
| [Identity](identity/) | Detecções de comportamento suspeito em identidade | Microsoft Entra ID, Okta |
| [Network](network/) | Detecções de rede e perímetro | VPN, Firewall, Proxy |

## Estrutura de uma Regra

Cada arquivo `.cql` deve seguir uma estrutura padronizada:

```cql
// ============================================================================
// DETECÇÃO: [Nome da Regra]
// ============================================================================
// Objetivo: [Descrição do objetivo]
// Fonte de Dados: [Requisitos de dados]
// MITRE ATT&CK: [Técnica relacionada]
// ============================================================================

[Código CQL]
```

## Níveis de Criticidade

| Nível | Descrição | Ação Recomendada |
|-------|-----------|------------------|
| EMERGÊNCIA | Comprometimento confirmado | Resposta imediata |
| CRÍTICO | Alta probabilidade de ataque | Investigação prioritária |
| ALTO | Comportamento suspeito significativo | Investigação em 24h |
| MÉDIO | Anomalia detectada | Triagem padrão |
| BAIXO | Evento informativo | Monitoramento |

## Como Contribuir

1. Siga a estrutura de arquivos existente
2. Documente o objetivo e estratégia da regra
3. Inclua comentários explicativos no código
4. Teste em ambiente de homologação antes de submeter

---

> **Exemplos:** Veja regras de exemplo em [`/live-sessions/ng-siem-presentation-2025/`](../live-sessions/ng-siem-presentation-2025/)
