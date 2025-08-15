Bem-vindo! Este repositório contém as regras de detecção avançada em CrowdStrike Query Language (CQL) que foram criadas e demonstradas durante a apresentação ao vivo sobre NG-SIEM

O objetivo aqui não é apenas compartilhar queries, mas demonstrar uma filosofia de detecção que equilibra performance, precisão e operacionalidade. 

Nossa Filosofia de Detecção:

As regras neste repositório foram construídas sobre três pilares fundamentais:

Princípios da Detecção Eficiente: O objetivo de uma boa query não é apenas encontrar ameaças, mas fazê-lo de forma rápida, precisa (sem falsos positivos) e com resultados que permitam uma ação imediata. Cada linha de código deve servir a um propósito operacional.

O Funil de Dados: Toda query é estruturada como um funil, descartando o máximo de dados irrelevantes no início (#event_simpleName) antes de aplicar lógicas complexas. Filtrar primeiro garante que as operações caras (agregações, joins) trabalhem sobre o menor conjunto de dados possível.

Agregação e Enriquecimento Inteligentes: Usamos as ferramentas certas para cada tarefa: groupBy com consciência da cardinalidade, collect(limit=...) para evitar sobrecarga, e a função de enriquecimento correta (lookup local vs. ioc:lookup externo) apenas após filtrar o ruído. O foco é o balanço crítico entre contexto e custo.


As Regras:

Este repositório apresenta três arquétipos de detecção, cada um com uma estratégia distinta:

1. Detecção Acesso VPN de um IP Suspeito:

Objetivo: Detectar tentativas de login na VPN (Checkpoint) originadas de IPs com reputação maliciosa conhecida, gerando um alerta de altíssima fidelidade.

2. Comportamento Suspeito Entra ID:

Objetivo: Analisar cada evento de login do Microsoft Entra ID através de múltiplos vetores (MFA, geolocalização, reputação do User-Agent, Políticas de Acesso Condicional) para construir um perfil de risco completo.

Estratégia: Classificação Contextual.

3. ClickFix RunMRU LummaStealer:

Objetivo: Detectar uma TTP (Tática, Técnica e Procedimento) de evasão e persistência altamente específica, usada por malware como o Lumma Stealer.

Estratégia: Precisão Cirúrgica.


Pré-requisitos:

Para que estas regras funcionem corretamente em seu ambiente, você precisará de:

Fontes de Dados:

Logs de VPN Checkpoint Connectra (#Vendor="checkpoint").

Logs de autenticação do Microsoft Entra ID (#type="microsoft-entra-id").

Logs de EDR do CrowdStrike Falcon, especificamente RegSystemConfigValueUpdate.

Arquivos de Lookup:

UserAgent-Blacklist.csv: Um arquivo CSV com colunas userAgent, Category e Severity para enriquecer eventos do Entra ID com reputação de User-Agent.


Como Usar:

Faça o Upload dos Arquivos de Lookup: Adicione o arquivo UserAgent-Blacklist.csv

Adapte os Nomes: Verifique se os nomes dos arquivos nas queries correspondem exatamente aos nomes dos arquivos que você subiu.

Copie e Cole: Copie o código CQL da regra desejada para a interface de busca ou para a criação de um alerta agendado.

Teste em Homologação: SEMPRE execute e valide as regras em um ambiente de não produção ou com um lookback de tempo limitado para entender o impacto e o volume de alertas.

Ajuste os Thresholds: Algumas regras podem conter thresholds (ex: totalEvents > 50) que podem precisar de ajuste fino para o seu ambiente específico.
