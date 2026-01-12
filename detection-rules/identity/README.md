# Identity Protection Rules

Regras de detecção focadas em **comportamento de identidade** e autenticação.

## Fontes de Dados

- Microsoft Entra ID (Azure AD)
- Okta
- Active Directory
- LDAP logs

## Exemplos de Casos de Uso

| Técnica | Descrição | MITRE ATT&CK |
|---------|-----------|--------------|
| Password Spraying | Tentativas de login distribuídas | T1110.003 |
| MFA Bypass | Tentativas de evasão de MFA | T1111 |
| Impossible Travel | Login de locais geograficamente impossíveis | T1078 |
| Service Account Abuse | Uso indevido de contas de serviço | T1078.002 |

## Integração com Lookups

Regras de identidade frequentemente utilizam lookups para:

- Lista de User-Agents maliciosos
- IPs de redes corporativas
- Países autorizados
- Contas de serviço conhecidas

## Referências

- [Microsoft Entra ID Sign-in Logs](https://docs.microsoft.com/en-us/azure/active-directory/reports-monitoring/concept-sign-ins)
- [MITRE ATT&CK - Valid Accounts](https://attack.mitre.org/techniques/T1078/)

---

> **Exemplo prático:** Veja o case [Entra ID Suspicious Behavior](../../live-sessions/ng-siem-presentation-2025/case-02-entra-id-suspicious.cql)
