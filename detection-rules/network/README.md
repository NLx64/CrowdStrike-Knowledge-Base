# Network Security Rules

Regras de detecção focadas em **segurança de rede e perímetro**.

## Fontes de Dados

| Vendor | Tipo | Exemplos |
|--------|------|----------|
| Checkpoint | VPN, Firewall | Connectra, NGFW |
| Palo Alto | Firewall, VPN | GlobalProtect, PA Series |
| Cisco | VPN, Firewall | AnyConnect, ASA |
| Fortinet | VPN, Firewall | FortiGate, FortiClient |
| Zscaler | Proxy, ZTNA | ZIA, ZPA |

## Exemplos de Casos de Uso

| Técnica | Descrição | MITRE ATT&CK |
|---------|-----------|--------------|
| VPN de IP Malicioso | Login VPN de IP com má reputação | T1133 |
| C2 Beaconing | Padrões de comunicação com C2 | T1071 |
| Data Exfiltration | Transferência anômala de dados | T1048 |
| Tor Exit Nodes | Acesso via rede Tor | T1090.003 |

## Integração com Threat Intelligence

Regras de rede frequentemente correlacionam com:

- CrowdStrike IOC Feed
- Tor Exit Node Lists
- Known Bad IP Lists
- Malware C2 Indicators

## Referências

- [CrowdStrike Threat Intelligence](https://www.crowdstrike.com/products/threat-intelligence/)
- [MITRE ATT&CK - External Remote Services](https://attack.mitre.org/techniques/T1133/)

---

> **Exemplo prático:** Veja o case [VPN Malicious IP](../../live-sessions/ng-siem-presentation-2025/case-01-vpn-malicious-ip.cql)
