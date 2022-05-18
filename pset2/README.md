# *Problem Set 2*
## O que é um *Problem Set* (Pset)?
Um *Problem Set*, abreviado como PSet, é uma ferramenta de ensino onde se é fornecido um conjunto de problemas ou exercícios que variam em dificuldade, com a finalidade de fazer com que o aluno realizando o PSet compreenda e ponha em prática a matéria estudada em sala de aula.
## Objetivos do PSet 2
* Aprender *Structured Query Language* (SQL) em nível básico e intermediário;
* Gerar diversos relatórios SQL a partir dos dados no banco de dados criado no primeiro PSet.
---
# Respostas:
* [Questão 01](#questão-01)
* [Questão 02](#questão-02)
* [Questão 03](#questão-03)
* [Questão 04](#questão-04)
   * Correção do erro no código da Questão 04
* [Questão 05](#questão-05)
* [Questão 06](#questão-06)
   * Correção do erro no código da Questão 06
* [Questão 07](#questão-07)
   * `A QUESTÃO 07 NÃO FOI FEITA`
* [Questão 08](#questão-08)
* [Questão 09](#questão-09)
* [Questão 10](#questão-10)
* [Questão 11](#questão-11)
* [Questão 12](#questão-12)
* [Questão 13](#questão-13)
   * Correção do erro no código da Questão 13
* [Questão 14](#questão-14)
* [Questão 15](#questão-15)

## Questão 01
Prepare um relatório que mostre a média salarial dos funcionáriosde cada departamento.
> Código utilizado e tabela resultado:
```sql
-- Questão 01
SELECT numero_departamento as Departamento,
       AVG(salario)        as Média_Salarial
FROM funcionario
GROUP BY numero_departamento;
```
|Departamento|Média_Salarial|
|------------|--------------|
|           1|        55,000|
|           4|        31,000|
|           5|        33,250|

## Questão 02
Prepare um relatório que mostre a média salarial dos homens e das mulheres.
> Código utilizado e tabela resultado:
```sql
-- Questão 02
SELECT sexo         as Sexo,
       AVG(salario) as Média_Salarial
FROM funcionario
GROUP BY sexo;
```
|Sexo|Média_Salarial|
|----|--------------|
|F   |        31,000|
|M   |        37,600|

## Questão 03
Prepare um relatório que liste o nome dos departamentos e, para cada departamento, inclua as seguintes informações de seus funcionários: o nome completo, a data de nascimento, a idade em anos completos e o salário.
> Código utilizado e tabela resultado:
```sql
-- Questão 03
SELECT nome_departamento                                        as Departamento,
       CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) as Funcionário,
       data_nascimento                                          as Data_de_Nascimento,
       YEAR(CURRENT_DATE()) - YEAR(data_nascimento)             as Idade,
       salario                                                  as Salário 
FROM departamento
INNER JOIN funcionario on funcionario.numero_departamento = departamento.numero_departamento;
```
|Departamento |Funcionário      |Data_de_Nascimento|Idade|Salário|
|-------------|-----------------|------------------|-----|-------|
|Pesquisa     |João B. Silva    |        1965-01-09|   57| 30,000|
|Pesquisa     |Fernando T. Wong |        1955-12-08|   67| 40,000|
|Pesquisa     |Joice A. Leite   |        1972-07-31|   50| 25,000|
|Pesquisa     |Ronaldo K. Lima  |        1962-09-15|   60| 38,000|
|Matriz       |Jorge E. Brito   |        1937-11-10|   85| 55,000|
|Administração|Jennifer S. Souza|        1941-06-20|   81| 43,000|
|Administração|André V. Pereira |        1969-03-29|   53| 25,000|
|Administração|Alice J. Zelaya  |        1968-01-19|   54| 25,000|

## Questão 04
Prepare um relatório que mostre o nome completo dos funcionários, a idade em anos completos, o salário atual e o salário com um reajuste que obedece ao seguinte critério: se o salário atual do funcionário é inferior a 35.000 o reajuste deve ser de 20%, e se o salário atual do funcionário for igual ou superior a 35.000 o reajuste deve ser de 15%.
> Código utilizado e tabela resultado:
```sql
-- Questão 04
SELECT CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) as Funcionário,
       YEAR(CURRENT_DATE()) - YEAR(data_nascimento)             as Idade,
       salario                                                  as Salário_Atual,
       CASE
           WHEN salario < 35.000 THEN salario * 1.2
           ELSE salario * 1.15
           END                                                  as Salário_com_Reajuste
FROM funcionario
```
|Funcionário      |Idade|Salário_Atual|Salário_com_Reajuste|
|-----------------|-----|-------------|--------------------|
|João B. Silva    |   57|       30,000|              34,500|
|Fernando T. Wong |   67|       40,000|              46,000|
|Joice A. Leite   |   50|       25,000|              28,750|
|Ronaldo K. Lima  |   60|       38,000|              43,700|
|Jorge E. Brito   |   85|       55,000|              63,250|
|Jennifer S. Souza|   81|       43,000|              49,450|
|André V. Pereira |   53|       25,000|              28,750|
|Alice J. Zelaya  |   54|       25,000|              28,750|

`EXISTE UM ERRO NO CÓDIGO UTILIZADO`
> Motivo: EXPLICAÇÃO DO ERRO AQUI <br>
> O código sem o erro e a sua tabela resultado seriam assim:
```sql
-- Questão 04
SELECT CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) as Funcionário,
       YEAR(CURRENT_DATE()) - YEAR(data_nascimento)             as Idade,
       salario                                                  as Salário_Atual,
       CASE
           WHEN salario < 35000 THEN salario * 1.2
           ELSE salario * 1.15
           END                                                  as Salário_com_Reajuste
FROM funcionario
```
|Funcionário      |Idade|Salário_Atual|Salário_com_Reajuste|
|-----------------|-----|-------------|--------------------|
|João B. Silva    |   57|       30,000|              36,000|
|Fernando T. Wong |   67|       40,000|              46,000|
|Joice A. Leite   |   50|       25,000|              30,000|
|Ronaldo K. Lima  |   60|       38,000|              43,700|
|Jorge E. Brito   |   85|       55,000|              63,250|
|Jennifer S. Souza|   81|       43,000|              49,450|
|André V. Pereira |   53|       25,000|              30,000|
|Alice J. Zelaya  |   54|       25,000|              30,000|

## Questão 05
Prepare um relatório que liste, para cada departamento, o nome do gerente e o nome dos funcionários. Ordene esse relatório por nome do departamento (em ordem crescente) e por salário dos funcionários (em ordem decrescente).
> Código utilizado e tabela resultado:
```sql
-- Questão 05
SELECT nome_departamento as Departamento, 
CASE
    WHEN cpf_gerente = funcionario.cpf THEN CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome)
END                      as Gerente,
CASE
    WHEN cpf_gerente <> funcionario.cpf THEN CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome)
END                      as Funcionário
FROM departamento
INNER JOIN funcionario on funcionario.numero_departamento = departamento.numero_departamento
ORDER BY nome_departamento ASC,
         salario DESC;
```
|Departamento |Gerente          |Funcionário     |
|-------------|-----------------|----------------|
|Administração|Jennifer S. Souza|                |
|Administração|                 |André V. Pereira|
|Administração|                 |Alice J. Zelaya |
|Matriz       |Jorge E. Brito   |                |
|Pesquisa     |Fernando T. Wong |                |
|Pesquisa     |                 |Ronaldo K. Lima |
|Pesquisa     |                 |João B. Silva   |
|Pesquisa     |                 |Joice A. Leite  |

## Questão 06
Prepare um relatório que mostre o nome completo dos funcionários que têm dependentes, o departamento onde eles trabalham e, para cada funcionário, também liste o nome completo dos dependentes, a idade em anos de cada dependente e o sexo (o sexo NÃO DEVE aparecer como M ou F, deve aparecer como “Masculino” ou “Feminino”).
> Código utilizado e tabela resultado:
```sql
-- Questão 06
SELECT nome_departamento                                          as Departamento,
       CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome)   as Funcionário,
       CONCAT(nome_dependente, " ", nome_meio, ". ", ultimo_nome) as Dependente,
       YEAR(CURRENT_DATE()) - YEAR(dependente.data_nascimento)    as Idade_Dependente,
       CASE dependente.sexo
           WHEN 'M' THEN 'Masculino'
           ELSE 'Feminino'
       END                                                        as Sexo_Dependente
FROM funcionario
INNER JOIN dependente   on dependente.cpf_funcionario       = funcionario.cpf
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento;
```
|Departamento |Funcionário      |Dependente        |Idade_Dependente|Sexo_Dependente|
|-------------|-----------------|------------------|----------------|---------------|
|Pesquisa     |João B. Silva    |Alicia B. Silva   |              34|Feminino       |
|Pesquisa     |João B. Silva    |Elizabeth B. Silva|              55|Feminino       |
|Pesquisa     |João B. Silva    |Michael B. Silva  |              34|Masculino      |
|Pesquisa     |Fernando T. Wong |Alicia T. Wong    |              36|Feminino       |
|Pesquisa     |Fernando T. Wong |Janaina T. Wong   |              64|Feminino       |
|Pesquisa     |Fernando T. Wong |Tiago T. Wong     |              39|Masculino      |
|Administração|Jennifer S. Souza|Antonio S. Souza  |              80|Masculino      |

`EXISTE UM ERRO NO CÓDIGO UTILIZADO`
> Motivo: O nome do meio do dependente muito dificilmente será igual ao do funcionário. <br>
> O código sem o erro e a sua tabela resultado seriam assim:
```sql
-- Questão 06
SELECT nome_departamento                                        as Departamento,
       CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) as Funcionário,
       CONCAT(nome_dependente, " ", ultimo_nome)                as Dependente,
       YEAR(CURRENT_DATE()) - YEAR(dependente.data_nascimento)  as Idade_Dependente,
       CASE dependente.sexo
           WHEN 'M' THEN 'Masculino'
           ELSE 'Feminino'
       END                                                      as Sexo_Dependente
FROM funcionario
INNER JOIN dependente   on dependente.cpf_funcionario       = funcionario.cpf
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento;
```
|Departamento |Funcionário      |Dependente     |Idade_Dependente|Sexo_Dependente|
|-------------|-----------------|---------------|----------------|---------------|
|Pesquisa     |João B. Silva    |Alicia Silva   |              34|Feminino       |
|Pesquisa     |João B. Silva    |Elizabeth Silva|              55|Feminino       |
|Pesquisa     |João B. Silva    |Michael Silva  |              34|Masculino      |
|Pesquisa     |Fernando T. Wong |Alicia Wong    |              36|Feminino       |
|Pesquisa     |Fernando T. Wong |Janaina Wong   |              64|Feminino       |
|Pesquisa     |Fernando T. Wong |Tiago Wong     |              39|Masculino      |
|Administração|Jennifer S. Souza|Antonio Souza  |              80|Masculino      |

## Questão 07
Prepare um relatório que mostre, para cada funcionário que NÃO TEM dependente, seu nome completo, departamento e salário.
> Código utilizado e tabela resultado:
```sql
-- Questão 07
```
|   |   |
|---|---|
|   |   |

`A QUESTÃO 07 NÃO FOI FEITA`
> O código que deveria ter sido feito e a sua tabela resultado seriam assim:


## Questão 08
Prepare um relatório que mostre, para cada departamento, os projetos desse departamento e o nome completo dos funcionários que estão alocados em cada projeto. Além disso inclua o número de horas trabalhadas por cada funcionário, em cada projeto.
> Código utilizado e tabela resultado:
```sql
-- Questão 08
SELECT nome_departamento                                        as Departamento, 
       CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) as Funcionário,
       trabalha_em.numero_projeto                               as Projeto,
       nome_projeto                                             as Nome_do_Projeto,
       horas                                                    as Horas_Trabalhadas
FROM funcionario
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento
INNER JOIN projeto      on projeto.numero_departamento      = funcionario.numero_departamento
INNER JOIN trabalha_em  on trabalha_em.numero_projeto       = projeto.numero_projeto
WHERE funcionario.cpf = trabalha_em.cpf_funcionario
```
|Departamento |Funcionário      |Projeto|Nome_do_Projeto|Horas_Trabalhadas|
|-------------|-----------------|-------|---------------|-----------------|
|Pesquisa     |João B. Silva    |      1|ProdutoX       |             32.5|
|Pesquisa     |Joice A. Leite   |      1|ProdutoX       |             20.0|
|Pesquisa     |João B. Silva    |      2|ProdutoY       |              7.5|
|Pesquisa     |Fernando T. Wong |      2|ProdutoY       |             10.0|
|Pesquisa     |Joice A. Leite   |      2|ProdutoY       |             20.0|
|Pesquisa     |Fernando T. Wong |      3|ProdutoZ       |             10.0|
|Pesquisa     |Ronaldo K. Lima  |      3|ProdutoZ       |             40.0|
|Administração|André V. Pereira |     10|Informatização |             35.0|
|Administração|Alice J. Zelaya  |     10|Informatização |             10.0|
|Matriz       |Jorge E. Brito   |     20|Reorganização  |              0.0|
|Administração|Jennifer S. Souza|     30|NovosBeneficios|             20.0|
|Administração|André V. Pereira |     30|NovosBeneficios|              5.0|
|Administração|Alice J. Zelaya  |     30|NovosBeneficios|             30.0|

## Questão 09
Prepare um relatório que mostre a soma total das horas de cada projeto em cada departamento. Obs.: o relatório deve exibir o nome do departamento, o nome do projeto e a soma total das horas.
> Código utilizado e tabela resultado:
```sql
-- Questão 09
SELECT nome_departamento as Departamento,
       nome_projeto      as Projeto,
       SUM (horas)       as Total_das_Horas
FROM departamento 
INNER JOIN projeto     on projeto.numero_departamento = departamento.numero_departamento
INNER JOIN trabalha_em on trabalha_em.numero_projeto  = projeto.numero_projeto
GROUP BY nome_projeto;
```
|Departamento |Projeto        |Total_das_Horas|
|-------------|---------------|---------------|
|Administração|Informatização |           55.0|
|Administração|NovosBeneficios|           55.0|
|Pesquisa     |ProdutoX       |           52.5|
|Pesquisa     |ProdutoY       |           37.5|
|Pesquisa     |ProdutoZ       |           50.0|
|Matriz       |Reorganização  |           25.0|

## Questão 10
Prepare um relatório que mostre a média salarial dos funcionários de cada departamento.
> Código utilizado e tabela resultado:
```sql
-- Questão 10
SELECT numero_departamento as Departamento,
       AVG(salario)        as Média_Salarial
FROM funcionario
GROUP BY numero_departamento;
```
|Departamento|Média_Salarial|
|------------|--------------|
|           1|        55,000|
|           4|        31,000|
|           5|        33,250|

`A QUESTÃO 10 É IGUAL A QUESTÃO 01` <br>
[Questão 01](#questão-01)

## Questão 11
Considerando que o valor pago por hora trabalhada em um projeto é de 50 reais, prepare um relatório que mostre o nome completo do funcionário, o nome do projeto e o valor total que o funcionário receberá referente às horas trabalhadas naquele projeto.
> Código utilizado e tabela resultado:
```sql
-- Questão 11
SELECT CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) as Funcionário,
       nome_projeto                                             as Projeto,
       horas                                                    as Horas_Trabalhadas,
       (horas * 50)                                             as Valor_Total
from funcionario
INNER JOIN trabalha_em on trabalha_em.cpf_funcionario = funcionario.cpf
INNER JOIN projeto     on projeto.numero_projeto = trabalha_em.numero_projeto;
```
|Funcionário      |Projeto        |Horas_Trabalhadas|Valor_Total|
|-----------------|---------------|-----------------|-----------|
|João B. Silva    |ProdutoX       |             32.5|     1625.0|
|João B. Silva    |ProdutoY       |              7.5|      375.0|
|Fernando T. Wong |ProdutoY       |             10.0|      500.0|
|Fernando T. Wong |ProdutoZ       |             10.0|      500.0|
|Fernando T. Wong |Informatização |             10.0|      500.0|
|Fernando T. Wong |Reorganização  |             10.0|      500.0|
|Joice A. Leite   |ProdutoX       |             20.0|     1000.0|
|Joice A. Leite   |ProdutoY       |             20.0|     1000.0|
|Ronaldo K. Lima  |ProdutoZ       |             40.0|     2000.0|
|Jorge E. Brito   |Reorganização  |              0.0|        0.0|
|Jennifer S. Souza|Reorganização  |             15.0|      750.0|
|Jennifer S. Souza|NovosBeneficios|             20.0|     1000.0|
|André V. Pereira |Informatização |             35.0|     1750.0|
|André V. Pereira |NovosBeneficios|              5.0|      250.0|
|Alice J. Zelaya  |Informatização |             10.0|      500.0|
|Alice J. Zelaya  |NovosBeneficios|             30.0|     1500.0|

## Questão 12
Seu chefe está verificando as horas trabalhadas pelos funcionários nos projetos e percebeu que alguns funcionários, mesmo estando alocadas à algum projeto, não registraram nenhuma hora trabalhada. Sua tarefa é preparar um relatório que liste o nome do departamento, o nome do projeto e o nome dos funcionários que, mesmo estando alocados a algum projeto, não registraram nenhuma hora trabalhada.
> Código utilizado e tabela resultado:
```sql
-- Questão 12
SELECT nome_departamento                                        as Departamento,
       nome_projeto                                             as Projeto,
       CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) as Funcionário,
       horas                                                    as Horas_Trabalhadas
FROM funcionario
INNER JOIN departamento on funcionario.numero_departamento  = departamento.numero_departamento
INNER JOIN projeto      on departamento.numero_departamento = projeto.numero_departamento
INNER JOIN trabalha_em  on projeto.numero_projeto           = trabalha_em.numero_projeto
WHERE horas = 0;
```
|Departamento|Projeto      |Funcionário   |Horas_Trabalhadas|
|------------|-------------|--------------|-----------------|
|Matriz      |Reorganização|Jorge E. Brito|              0.0|

## Questão 13
Durante o natal deste ano a empresa irá presentear todos os funcionários e todos os dependentes (sim, a empresa vai dar um presente para cada funcionário e um presente para cada dependente de cada funcionário) e pediu para que você preparasse um relatório que listasse o nome completo das pessoas a serem presenteadas (funcionários e dependentes), o sexo e a idade em anos completos (para poder comprar um presente adequado). Esse relatório deve estar ordenado pela idade em anos completos, de forma decrescente.
> Código utilizado e tabela resultado:
```sql
-- Questão 13
SELECT CONCAT(primeiro_nome, " ", nome_meio, ". ",ultimo_nome)      as Nome_Completo,
       YEAR(CURRENT_DATE()) - YEAR(data_nascimento)                 as Idade,
       CASE sexo
           WHEN 'M' THEN 'Masculino'
           ELSE 'Feminino'
       END                                                          as Sexo
FROM funcionario
UNION
SELECT CONCAT(nome_dependente, " ", nome_meio, ". ", ultimo_nome)   as Nome_Completo,
       YEAR(CURRENT_DATE()) - YEAR(dependente.data_nascimento)      as Idade,
       CASE dependente.sexo
           WHEN 'M' THEN 'Masculino'
           ELSE 'Feminino'
           END                                                      as Sexo
FROM funcionario
INNER JOIN dependente on dependente.cpf_funcionario = funcionario.cpf
ORDER BY Idade DESC;
```
|Nome_Completo     |Idade|Sexo     |
|------------------|-----|---------|
|Jorge E. Brito    |   85|Masculino|
|Jennifer S. Souza |   81|Feminino |
|Antonio S. Souza  |   80|Masculino|
|Fernando T. Wong  |   67|Masculino|
|Janaina T. Wong   |   64|Feminino |
|Ronaldo K. Lima   |   60|Masculino|
|João B. Silva     |   57|Masculino|
|Elizabeth B. Silva|   55|Feminino |
|Alice J. Zelaya   |   54|Feminino |
|André V. Pereira  |   53|Masculino|
|Joice A. Leite    |   50|Feminino |
|Tiago T. Wong     |   39|Masculino|
|Alicia T. Wong    |   36|Feminino |
|Alicia B. Silva   |   34|Feminino |
|Michael B. Silva  |   34|Masculino|

`EXISTE UM ERRO NO CÓDIGO UTILIZADO`
> Motivo: O nome do meio do dependente muito dificilmente será igual ao do funcionário. <br>
> O código sem o erro e a sua tabela resultado seriam assim:
```sql
-- Questão 13
SELECT CONCAT(primeiro_nome, " ", nome_meio, ". ",ultimo_nome) as Nome_Completo,
       YEAR(CURRENT_DATE()) - YEAR(data_nascimento)            as Idade,
       CASE sexo
           WHEN 'M' THEN 'Masculino'
           ELSE 'Feminino'
       END                                                     as Sexo
FROM funcionario
UNION
SELECT CONCAT(nome_dependente, " ", ultimo_nome)               as Nome_Completo,
       YEAR(CURRENT_DATE()) - YEAR(dependente.data_nascimento) as Idade,
       CASE dependente.sexo
           WHEN 'M' THEN 'Masculino'
           ELSE 'Feminino'
           END                                                 as Sexo
FROM funcionario
INNER JOIN dependente on dependente.cpf_funcionario = funcionario.cpf
ORDER BY Idade DESC;
```
|Nome_Completo    |Idade|Sexo     |
|-----------------|-----|---------|
|Jorge E. Brito   |   85|Masculino|
|Jennifer S. Souza|   81|Feminino |
|Antonio Souza    |   80|Masculino|
|Fernando T. Wong |   67|Masculino|
|Janaina Wong     |   64|Feminino |
|Ronaldo K. Lima  |   60|Masculino|
|João B. Silva    |   57|Masculino|
|Elizabeth Silva  |   55|Feminino |
|Alice J. Zelaya  |   54|Feminino |
|André V. Pereira |   53|Masculino|
|Joice A. Leite   |   50|Feminino |
|Tiago Wong       |   39|Masculino|
|Alicia Wong      |   36|Feminino |
|Alicia Silva     |   34|Feminino |
|Michael Silva    |   34|Masculino|

## Questão 14
Prepare um relatório que exiba quantos funcionários cada departamento tem.
> Código utilizado e tabela resultado:
```sql
-- Questão 14
SELECT nome_departamento                       as Departamento,
       COUNT(departamento.numero_departamento) as Total_de_Funcionários
FROM funcionario
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento
GROUP BY nome_departamento;
```
|Departamento |Total_de_Funcionários|
|-------------|---------------------|
|Administração|                    3|
|Matriz       |                    1|
|Pesquisa     |                    4|

## Questão 15
Como um funcionário pode estar alocado em mais de um projeto, prepare um relatório que exiba o nome completo do funcionário, o departamento desse funcionário e o nome dos projetos em que cada funcionário está alocado. Atenção: se houver algum funcionário que não está alocado em nenhum projeto, o nome completo e o departamento também devem aparecer no relatório.
> Código utilizado e tabela resultado:
```sql
-- Questão 15
SELECT CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) as Funcionário,
       nome_departamento                                        as Departamento,
       nome_projeto                                             as Projeto
FROM departamento
INNER JOIN funcionario on funcionario.numero_departamento = departamento.numero_departamento
INNER JOIN projeto     on projeto.numero_departamento     = departamento.numero_departamento
ORDER by Funcionário;
```
|Funcionário      |Departamento |Projeto        |
|-----------------|-------------|---------------|
|Alice J. Zelaya  |Administração|Informatização |
|Alice J. Zelaya  |Administração|NovosBeneficios|
|André V. Pereira |Administração|NovosBeneficios|
|André V. Pereira |Administração|Informatização |
|Fernando T. Wong |Pesquisa     |ProdutoX       |
|Fernando T. Wong |Pesquisa     |ProdutoY       |
|Fernando T. Wong |Pesquisa     |ProdutoZ       |
|Jennifer S. Souza|Administração|Informatização |
|Jennifer S. Souza|Administração|NovosBeneficios|
|João B. Silva    |Pesquisa     |ProdutoZ       |
|João B. Silva    |Pesquisa     |ProdutoX       |
|João B. Silva    |Pesquisa     |ProdutoY       |
|Joice A. Leite   |Pesquisa     |ProdutoX       |
|Joice A. Leite   |Pesquisa     |ProdutoY       |
|Joice A. Leite   |Pesquisa     |ProdutoZ       |
|Jorge E. Brito   |Matriz       |Reorganização  |
|Ronaldo K. Lima  |Pesquisa     |ProdutoX       |
|Ronaldo K. Lima  |Pesquisa     |ProdutoY       |
|Ronaldo K. Lima  |Pesquisa     |ProdutoZ       |
