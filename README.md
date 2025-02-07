# Analise de Dados em um Banco de Dados de Modelos de Carros com MySQL Workbench

O meu processo de análise para o projeto do Coursera "Analyze Data in a Model Car Database with MySQL Workbench".

Neste projeto, o meu objetivo é auxiliar na análise de dados numa base de dados relacional como analista de dados júnior na Mint Classics Company, com o intuito de apoiar decisões estratégicas relacionadas com a gestão de inventário, tendo em vista o encerramento de um armazém.

Trabalhar neste projeto permitiu-me demonstrar a minha proficiência em SQL e a sua aplicação para uma gestão eficiente de inventário. O meu objetivo foi mostrar como analisar os dados dos armazéns, compreender a distribuição do inventário de produtos e fornecer recomendações úteis para melhorar o controlo de stock.

Através desta análise, procurei demonstrar a minha capacidade de tomada de decisões baseadas em dados, contribuindo assim para o aumento da eficiência estratégica e operacional da gestão de inventário.

Objetivos do Projeto

1. Explorar os produtos atualmente em stock.
2. Determinar fatores importantes que possam influenciar a reorganização/redução do inventário.
3. Fornecer insights analíticos e recomendações baseadas em dados.
Tarefa 1 - Importar a Base de Dados Classic Car Model

Descarregar o ficheiro mintclassicsDB.sql, que contém o script para criar e povoar a base de dados relacional Mint Classics.
Utilizar a opção "Import from Self-Contained File" na ferramenta de Importação de Dados do MySQL Workbench para criar a base de dados.
O script inclui comandos para criar o schema (mintclassics), bem como as tabelas, chaves primárias e estrangeiras, e os dados.
Após a execução bem-sucedida do script, teremos uma base de dados funcional contendo nove tabelas preenchidas com informações da Mint Classics.

Tarefa 2 - Compreender a Base de Dados Mint Classics e os seus Processos de Negócio

1. Identificar o número total de armazéns e a sua capacidade.
   
✅ Existem quatro armazéns, cada um com um código único, nome e capacidade atual em percentagem.

➡️ O armazém C destaca-se por ter maior disponibilidade de espaço, estando apenas 50% cheio.

2. Identificar o total de produtos oferecidos pela empresa.

✅ A empresa detém atualmente um inventário diversificado de 110 produtos distintos.

3. Verificar se algum produto está armazenado em múltiplos armazéns.
   
✅ Nenhum produto está armazenado em mais de um armazém.

➡️ Isto demonstra que cada armazém armazena exclusivamente linhas de produtos específicas.

4. Identificar a quantidade única de produtos e o stock total em cada armazém.
   
✅ O armazém B possui o maior volume de produtos, armazenando 38 tipos diferentes e totalizando 219.183 unidades, tornando-se o armazém com maior capacidade de armazenamento.

5. Identificar quais linhas de produtos são armazenadas em cada armazém.
   
🏭 Distribuição de produtos pelos armazéns:

Armazém A (Norte): Aviões + Motociclos
12 aviões, 13 motociclos = 25 produtos no total

Armazém B (Este): Carros Clássicos
38 produtos no total de carros clássicos

Armazém C (Oeste): Carros Vintage
24 produtos no total de carros vintage

Armazém D (Sul): Camionetas + Autocarros, Navios, Comboios
11 camionetas + autocarros, 9 navios, 3 comboios = 23 produtos no total

6. Determinar as linhas de produtos com o maior e o menor número de vendas.
✅ Foi executada uma consulta SQL para identificar as linhas de produtos com maior e menor número de vendas.


Tarefa 3 - Investigação de Problemas Empresariais e Identificação das Tabelas Afetadas

A Mint Classics enfrenta o problema de ter de encerrar um dos seus armazéns.
Para tomar uma decisão informada, foi necessário determinar quais tabelas eram relevantes e utilizar consultas SQL para obter informações críticas.

1. Criar uma tabela temporária para avaliar a diferença entre o stock de produtos e os pedidos já expedidos (encomendas enviadas e resolvidas).
   
✅ Foi criada uma tabela temporária para identificar produtos superlotados, bem abastecidos e subabastecidos.

2. Determinar a quantidade de produtos superlotados, bem abastecidos e subabastecidos em cada armazém.
   
✅ O armazém B apresenta o maior número de produtos superlotados, totalizando 29 itens.
✅ Os armazéns A e C apresentam o mesmo número de produtos superlotados, 19 cada.

3. Analisar as linhas de produtos, identificando as que possuem os maiores percentuais de vendas.
   
✅ O objetivo foi obter insights sobre o desempenho do inventário e das vendas de cada linha de produtos.

Tarefa 4 - Recomendação para Consolidação de Armazéns

Após uma análise detalhada, verificou-se que:

O armazém B armazena carros clássicos, que apresentam o menor desempenho de vendas e o maior número de produtos superlotados.
Apesar disso, o armazém B tem a maior capacidade de armazenamento, acomodando 38 produtos diferentes, com um stock total de 219.183 unidades.
O armazém C, por outro lado, tem a menor capacidade de armazenamento entre os quatro armazéns e está a operar apenas a 50% da sua capacidade, o que indica desperdício significativo de espaço.
📌 Recomendação:
➡️ Encerrar o armazém C e realocar o seu inventário para o armazém B.
💡 Esta consolidação maximiza a utilização do espaço disponível no armazém B e torna a gestão de inventário mais eficiente, ao centralizar categorias de produtos semelhantes num único local.

🔹 Benefícios da Consolidação:

✅ Otimização do Espaço: Ao transferir o stock do armazém C para o B, aproveitamos melhor a capacidade de armazenamento, reduzindo ineficiências operacionais.
✅ Operações Mais Eficientes: A consolidação simplifica a gestão do inventário, reduzindo a complexidade e melhorando a eficiência logística e o controlo de stock.
✅ Redução de Custos: A eliminação dos custos operacionais de um armazém redundante reduz as despesas de manutenção e operação.

🔎 Conclusão
➡️ A consolidação do armazém C no armazém B é uma estratégia eficaz para aumentar a eficiência operacional, reduzir custos e otimizar a gestão de inventário.
➡️ Esta recomendação alinha-se com o objetivo da empresa de maximizar a eficácia operacional e otimizar os seus recursos para um crescimento sustentável. 🚀
