# Lookup Files

Arquivos de lookup são utilizados para **enriquecimento de eventos** no CrowdStrike NG-SIEM, permitindo adicionar contexto e classificação aos dados de segurança.

## Arquivos Disponíveis

### user-agent-blacklist.csv

| Atributo | Valor |
|----------|-------|
| **Formato** | CSV |
| **Colunas** | `Vendor.properties.userAgent`, `Category`, `Severity` |
| **Uso** | Detecção de Entra ID |

**Descrição:**
Lista de User-Agents associados a ferramentas ofensivas, automação maliciosa e técnicas de ataque.

**Categorias:**

| Categoria | Descrição | Severidade |
|-----------|-----------|------------|
| Password Spraying Attack | Ferramentas de spray de senha | Red |
| Offensive Tool | Ferramentas de pentest/ataque | Red/Yellow |
| AiTM | Adversary-in-the-Middle | Red |
| Cryptojacking Attack | Mineração maliciosa | Yellow/Red |
| Traitorware | Software usado para exfiltração | Red |
| TeamFiltration | Ferramenta específica de ataque | Red |

**User-Agents Incluídos:**

```
AADInternals, axios, BAV2ROPC, bloodhound, curl,
fasthttp, Go-http-client, node-fetch, PowerShell,
python-requests, sharphound, e outros...
```

---

## Como Fazer Upload

1. Acesse o console do CrowdStrike NG-SIEM
2. Navegue para: `Settings → Lookup Files`
3. Clique em `Upload`
4. Selecione o arquivo CSV
5. Confirme o upload

## Uso nas Regras

```cql
| match(file="user-agent-blacklist.csv", field=Vendor.properties.userAgent, include=[Category, Severity])
```

## Manutenção

Recomenda-se atualizar periodicamente a lista com novos User-Agents identificados em:

- Relatórios de threat intelligence
- Análises de incidentes internos
- Publicações da comunidade de segurança

## Contribuindo

Para adicionar novos User-Agents:

1. Identifique o User-Agent malicioso
2. Classifique a categoria de ataque
3. Defina a severidade (Red, Yellow, Gray)
4. Adicione ao CSV seguindo o formato existente
