<div align="center">

# CrowdStrike NG-SIEM Knowledge Base

![CrowdStrike](https://img.shields.io/badge/CrowdStrike-NG--SIEM-red?style=for-the-badge&logo=crowdstrike&logoColor=white)
![CQL](https://img.shields.io/badge/Language-CQL-blue?style=for-the-badge)
![Security](https://img.shields.io/badge/Focus-Threat%20Detection-orange?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Regras de detecção avançadas e recursos para CrowdStrike Falcon NG-SIEM**

[Live Session](#-live-session) •
[Regras de Detecção](#-regras-de-detecção) •
[Lookups](#-arquivos-de-lookup) •
[Como Usar](#-como-usar)

---

</div>

## Sobre este Repositório

Este repositório é uma **central de conhecimento** dedicada ao CrowdStrike Falcon NG-SIEM, contendo regras de detecção avançadas escritas em **CrowdStrike Query Language (CQL)**. O conteúdo foi desenvolvido com foco em cenários reais de **threat hunting** e **detection engineering**.

### Destaques

- **Regras de Alta Fidelidade** - Desenvolvidas para minimizar falsos positivos
- **Multi-vetor** - Cobertura de endpoint, identidade e rede
- **Produção-Ready** - Testadas e prontas para implementação
- **Documentação Rica** - Cada regra inclui explicações detalhadas

---

## Estrutura do Repositório

```
📁 CrowdStrike-Knowledge-Base/
├── 📁 live-sessions/              # Consultas de apresentações e lives
│   └── 📁 ng-siem-presentation-2025/
├── 📁 detection-rules/            # Templates para novas regras
│   ├── 📁 endpoint/               # Detecções de endpoint (EDR)
│   ├── 📁 identity/               # Detecções de identidade
│   └── 📁 network/                # Detecções de rede
├── 📁 lookups/                    # Arquivos de lookup (CSVs)
└── 📄 README.md
```

---

## Live Session

Consultas desenvolvidas e apresentadas durante **participação especial em live sobre CrowdStrike NG-SIEM**, demonstrando casos de uso práticos de detection engineering.

### Casos Demonstrados

| Case | Regra | Estratégia | MITRE ATT&CK |
|------|-------|------------|--------------|
| 01 | [VPN Malicious IP](live-sessions/ng-siem-presentation-2025/case-01-vpn-malicious-ip.cql) | Correlação com IOCs | T1133 |
| 02 | [Entra ID Suspicious Behavior](live-sessions/ng-siem-presentation-2025/case-02-entra-id-suspicious.cql) | Classificação Contextual | T1078 |
| 03 | [ClickFix LummaStealer](live-sessions/ng-siem-presentation-2025/case-03-clickfix-lummastealer.cql) | Precisão Cirúrgica | T1547.001 |

### Estratégias de Detecção

| Estratégia | Descrição | Aplicação |
|------------|-----------|-----------|
| **Correlação com IOCs** | Enriquecimento de eventos com threat intelligence | VPN + IP Malicioso |
| **Classificação Contextual** | Análise multi-dimensional para scoring de risco | Login Entra ID |
| **Precisão Cirúrgica** | Detecção de TTPs específicas de malware | ClickFix/Lumma |

---

## Regras de Detecção

Estrutura organizada para contribuição de novas regras:

| Categoria | Descrição | Fontes de Dados |
|-----------|-----------|-----------------|
| [Endpoint](detection-rules/endpoint/) | Detecções baseadas em telemetria EDR | CrowdStrike Falcon Sensor |
| [Identity](detection-rules/identity/) | Detecções de comportamento de identidade | Microsoft Entra ID, Okta |
| [Network](detection-rules/network/) | Detecções de rede e perímetro | VPN, Firewall, Proxy |

---

## Arquivos de Lookup

Os arquivos de lookup são utilizados para enriquecer eventos:

| Arquivo | Descrição | Uso |
|---------|-----------|-----|
| [user-agent-blacklist.csv](lookups/user-agent-blacklist.csv) | Lista de User-Agents maliciosos | Detecção de ferramentas ofensivas, password spraying, AiTM |

---

## Como Usar

### Pré-requisitos

- Acesso ao CrowdStrike Falcon NG-SIEM
- Fontes de dados configuradas conforme necessidade

### Implementação

1. **Upload dos Lookups**
   ```
   Console NG-SIEM → Settings → Lookup Files → Upload
   ```

2. **Teste das Regras**
   - Copie o código CQL da regra desejada
   - Execute na interface de busca com período limitado
   - Valide os resultados antes de criar alertas

3. **Criação de Correlation Rules**
   - Após validação, crie uma Correlation Rule
   - Configure thresholds apropriados
   - Defina ações de resposta

> **Importante:** Sempre execute as regras em ambiente de homologação antes de produção.

---

## Roadmap

- [ ] Adicionar mais regras de detecção de endpoint
- [ ] Criar seção de threat hunting queries
- [ ] Adicionar dashboards e visualizações
- [ ] Documentar playbooks de resposta
- [ ] Expandir cobertura MITRE ATT&CK

---

## Contribuindo

Contribuições são bem-vindas!

1. Fork este repositório
2. Crie uma branch para sua feature
3. Envie um Pull Request com descrição detalhada

---

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

<div align="center">

**Desenvolvido com dedicação à comunidade de segurança**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat-square&logo=linkedin)](https://linkedin.com)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?style=flat-square&logo=github)](https://github.com)

</div>
