# Endpoint Detection Rules

Regras de detecção focadas em telemetria de **Endpoint Detection and Response (EDR)** do CrowdStrike Falcon.

## Fontes de Dados

- CrowdStrike Falcon Sensor
- Eventos de processo (`ProcessRollup2`)
- Eventos de registro (`RegSystemConfigValueUpdate`)
- Eventos de rede (`NetworkConnect`)
- Eventos de arquivo (`FileWritten`, `FileDeleted`)

## Exemplos de Casos de Uso

| Técnica | Descrição | MITRE ATT&CK |
|---------|-----------|--------------|
| Persistência via Registro | Modificações suspeitas em Run Keys | T1547.001 |
| LOLBins | Uso malicioso de binários nativos | T1218 |
| Process Injection | Injeção de código em processos | T1055 |
| Credential Dumping | Acesso a credenciais em memória | T1003 |

## Referências

- [CrowdStrike Event Dictionary](https://falcon.crowdstrike.com/documentation/page/d88d9ed6/streaming-api-event-dictionary)
- [MITRE ATT&CK - Execution](https://attack.mitre.org/tactics/TA0002/)

---

> **Exemplo prático:** Veja o case [ClickFix LummaStealer](../../live-sessions/ng-siem-presentation-2025/case-03-clickfix-lummastealer.cql)
