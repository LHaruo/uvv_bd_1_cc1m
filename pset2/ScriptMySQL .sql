-- Questão 01
SELECT numero_departamento as Departamento,
       AVG(salario)        as Média_Salarial
FROM funcionario
GROUP BY numero_departamento;

-- Questão 02
SELECT sexo as Sexo,
       AVG(salario) as Média_Salarial
FROM funcionario
GROUP BY sexo;

-- Questão 03
SELECT nome_departamento                                    as Departamento,
       CONCAT(primeiro_nome," ", nome_meio," ",ultimo_nome) as Funcionário,
       data_nascimento                                      as Data_de_Nascimento,
       YEAR(CURRENT_DATE()) - YEAR(data_nascimento)         as Idade,
       salario                                              as Salário 
FROM departamento
INNER JOIN funcionario on funcionario.numero_departamento = departamento.numero_departamento;

-- Questão 04
SELECT CONCAT(primeiro_nome," ", nome_meio," ",ultimo_nome) as Funcionário,
       YEAR(CURRENT_DATE()) - YEAR(data_nascimento)         as Idade,
       salario                                              as Salário_Atual,
       CASE
           WHEN salario < 35.000 THEN salario*1.2
           ELSE salario*1.15
           END                                              as Salário_com_Reajuste
FROM funcionario

-- Questão 05
SELECT nome_departamento as Departamento, 
CASE
    WHEN cpf_gerente=funcionario.cpf THEN CONCAT(primeiro_nome," ", nome_meio," ",ultimo_nome)
END                      as Gerente,
CASE
    WHEN cpf_gerente<>funcionario.cpf THEN CONCAT(primeiro_nome," ", nome_meio," ",ultimo_nome)
END                      as Funcionário
FROM departamento
INNER JOIN funcionario on funcionario.numero_departamento = departamento.numero_departamento
ORDER BY
        nome_departamento ASC,
        salario DESC;

-- Questão 06
SELECT nome_departamento                                       as Departamento,
       CONCAT(primeiro_nome," ", nome_meio," ",ultimo_nome)    as Funcionário,
       CONCAT(nome_dependente," ", nome_meio," ",ultimo_nome)  as Dependente,
       YEAR(CURRENT_DATE()) - YEAR(dependente.data_nascimento) as Idade_Dependente,
CASE dependente.sexo
    WHEN 'M' THEN 'Masculino'
    ELSE 'Feminino'
END                                                            as Sexo_Dependente
FROM funcionario
INNER JOIN dependente   on dependente.cpf_funcionario       = funcionario.cpf
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento;

-- Questão 07


-- Questão 08
SELECT nome_departamento                                    as Departamento, 
       CONCAT(primeiro_nome," ", nome_meio," ",ultimo_nome) as Funcionário,
       trabalha_em.numero_projeto                           as Projeto,
       nome_projeto                                         as Nome_do_Projeto,
       horas                                                as Horas_Trabalhadas
FROM funcionario
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento
INNER JOIN projeto      on projeto.numero_departamento      = funcionario.numero_departamento
INNER JOIN trabalha_em  on trabalha_em.numero_projeto       = projeto.numero_projeto
WHERE funcionario.cpf = trabalha_em.cpf_funcionario

-- Questão 09
SELECT nome_departamento as Departamento,
       nome_projeto      as Projeto,
       SUM (horas)       as Total_das_Horas
FROM departamento 
INNER JOIN projeto     on projeto.numero_departamento = departamento.numero_departamento
INNER JOIN trabalha_em on trabalha_em.numero_projeto  = projeto.numero_projeto
GROUP BY nome_projeto;

-- Questão 10
SELECT numero_departamento as Departamento,
       AVG(salario)        as Média_Salarial
FROM funcionario
GROUP BY numero_departamento;

-- Questão 11
SELECT CONCAT(primeiro_nome," ", nome_meio," ",ultimo_nome) as Funcionário,
       nome_projeto                                         as Projeto,
       horas                                                as Horas_Trabalhadas,
       (horas * 50)                                         as Valor_Total
from funcionario
INNER JOIN trabalha_em on trabalha_em.cpf_funcionario = funcionario.cpf
INNER JOIN projeto     on projeto.numero_projeto = trabalha_em.numero_projeto;

-- Questão 12
SELECT nome_departamento                                    as Departamento,
       nome_projeto                                         as Projeto,
       CONCAT(primeiro_nome," ", nome_meio," ",ultimo_nome) as Funcionário,
       horas                                                as Horas_Trabalhadas
FROM funcionario
INNER JOIN departamento on funcionario.numero_departamento  = departamento.numero_departamento
INNER JOIN projeto      on departamento.numero_departamento = projeto.numero_departamento
INNER JOIN trabalha_em  on projeto.numero_projeto           = trabalha_em.numero_projeto
WHERE      horas = 0;

-- Questão 13
SELECT CONCAT(primeiro_nome," ",nome_meio," ",ultimo_nome) as Nome_Completo,
       YEAR(CURRENT_DATE()) - YEAR(data_nascimento)        as Idade,
       CASE sexo
           WHEN 'M' THEN 'Masculino'
           ELSE 'Feminino'
       END                                                 as Sexo
FROM funcionario
UNION
SELECT CONCAT(nome_dependente," ",nome_meio,".",ultimo_nome)   as Nome_Completo,
       YEAR(CURRENT_DATE()) - YEAR(dependente.data_nascimento) as Idade,
       CASE dependente.sexo
           WHEN 'M' THEN 'Masculino'
           ELSE 'Feminino'
           END                                                 as Sexo
FROM funcionario
INNER JOIN dependente on dependente.cpf_funcionario = funcionario.cpf
ORDER BY Idade DESC;

-- Questão 14
SELECT nome_departamento as Departamento,
       COUNT(departamento.numero_departamento) as Total_de_Funcionários
FROM funcionario
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento
GROUP BY nome_departamento;

-- Questão 15
SELECT CONCAT(primeiro_nome," ", nome_meio," ", ultimo_nome) as Funcionário,
       nome_departamento                                     as Departamento,
       nome_projeto                                          as Projeto
FROM departamento
INNER JOIN funcionario on funcionario.numero_departamento = departamento.numero_departamento
INNER JOIN projeto     on projeto.numero_departamento     = departamento.numero_departamento
ORDER by Funcionário;




















