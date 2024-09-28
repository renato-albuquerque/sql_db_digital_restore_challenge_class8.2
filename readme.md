# Projeto de Banco de Dados - SQL/PostgreSQL

Desenvolvimento de Projeto de Banco de Dados com SQL/PostgreSQL.<br> 
`Desafios Aula 8.2, Questões 01-10, Módulo 01 (SQL).` 

Instituição: [Digital College Brasil](https://digitalcollege.com.br/) (Fortaleza/CE) <br>
Curso: Data Analytics (Turma 18) <br>
Instrutora: [Nayara Wakweski](https://github.com/NayaraWakewski) <br>

<br>

## Etapas de Desenvolvimento

### Enunciado das Questões:
![screenshot](/images/all_questions.png) <br>
    
<br>

## Restore do Banco de Dados
- Criar banco de dados: digital_restore (Interface gráfica). <br>
![screenshot](/images/create_database.png) <br>

- Fazer "Restore" do banco de dados (Interface gráfica). <br>
![screenshot](/images/restore.png) <br>

<br>

## Exercício 1
- Qual a menor pretensão salarial? <br>

- Comandos SQL: <br>
```
select * from corporativo.funcionario
order by funcionario.pretensao_salarial asc
limit 1;
```
<br>

- Visualização: <br>

![screenshot](/images/ex1.png) <br>

<br>

## Exercício 2
- Qual o nome do funcionário que registrou a menor pretensão salarial? <br>

- Comandos SQL: <br>
```
select funcionario.nome, funcionario.pretensao_salarial 
from corporativo.funcionario
order by funcionario.pretensao_salarial desc
limit 1;
```
<br>

- Visualização: <br>

![screenshot](/images/ex2.png) <br>

<br>

## Exercício 3
- Quais os funcionários tem pretensão salarial menor e igual que R$3.500 e não é PCD? <br>

- Comandos SQL: <br>
```
select * from corporativo.funcionario
where funcionario.pretensao_salarial <= 3500 and funcionario.pcd = false
order by funcionario.pretensao_salarial desc;
```
<br>

- Visualização: <br>

![screenshot](/images/ex3.png) <br>

<br>

## Exercício 4
- Liste o nome dos funcionários, que tem cargo de Programador ou Analista de Infra. <br>

- Comandos SQL: <br>
```
select f.nome as funcionario, c.nome as cargo
from corporativo.lotacao l
inner join corporativo.funcionario f
on f.id = l.id_funcionario
inner join corporativo.cargo c
on c.id = l.id_cargo
where c.nome = 'Programador' or c.nome = 'Analista de Infra'
order by c.nome;
```
<br>

- Visualização: <br>

![screenshot](/images/ex4.png) <br>

<br>

## Exercício 5
- Liste nome (funcionário e cargo) por departamento que tem pretensão salarial maior que o salário. <br>

- Comandos SQL: <br>
```
select f.nome as funcionario, c.nome as cargo, d.nome as departamento
from corporativo.lotacao l
inner join corporativo.funcionario f
on f.id = l.id_funcionario
inner join corporativo.cargo c
on c.id = l.id_cargo
inner join corporativo.departamento d
on d.id = l.id_departamento
where f.pretensao_salarial > l.salario
order by d.nome;
```
<br>

- Visualização: <br>

![screenshot](/images/ex5.png) <br>

<br>

<br>

## Exercício 6
- Liste nome (cargo e funcionário) do departamento Administrativo com pretensão salarial e salários. <br>

- Comandos SQL: <br>
```
select f.nome as funcionario, 
		c.nome as cargo, 
		d.nome as departamento,
		f.pretensao_salarial,
		l.salario
from corporativo.lotacao l
inner join corporativo.funcionario f
on f.id = l.id_funcionario
inner join corporativo.cargo c
on c.id = l.id_cargo
inner join corporativo.departamento d
on d.id = l.id_departamento
where d.nome = 'Administrativo'
order by l.salario desc;
```
<br>

- Visualização: <br>

![screenshot](/images/ex6.png) <br>

<br>

## Exercício 7
- Qual a soma dos salários por departamento, listando em ordem decrescente? <br>

- Comandos SQL: <br>
```
select d.nome as departamento, 
		sum(l.salario) as soma_salarios  
from corporativo.lotacao l
inner join corporativo.departamento d
on d.id = l.id_departamento
group by d.nome
order by sum(l.salario) desc;
```
<br>

- Visualização: <br>

![screenshot](/images/ex7.png) <br>

<br>

## Exercício 8
- Qual a soma dos salários por cargo maiores que R$1.000,00 e listados em ordem decrescente? <br>

- Comandos SQL: <br>
```
select c.nome as cargo, 
		sum(l.salario) as soma_salarios
from corporativo.lotacao l
inner join corporativo.cargo c
on c.id = l.id_cargo
group by c.nome
having sum(l.salario) > 1000
order by sum(l.salario) desc;
```
<br>

- Visualização: <br>

![screenshot](/images/ex8.png) <br>

<br>

## Exercício 9
- Liste por departamento a soma e a média dos salários por ordem decrescente da soma dos salários. <br>

- Comandos SQL: <br>
```
select d.nome as departamento, 
		sum(l.salario) as soma_salarios,
		avg(l.salario)::numeric(18,2) as media_salarios
from corporativo.lotacao l
inner join corporativo.departamento d
on d.id = l.id_departamento
group by d.nome
order by sum(l.salario) desc;
```
<br>

- Visualização: <br>

![screenshot](/images/ex9.png) <br>

<br>

## Exercício 10
- Qual o total de registros, a soma, média, máximo e mínimos salários por departamento
(nome) dos funcionários ativos e com PCD? <br>

- Comandos SQL: <br>
```
select d.nome as departamento, 
		count(*) as total_registros,
		sum(l.salario) as soma_salarios, 
		avg(l.salario)::numeric(18,2) as media_salarios,
		max(l.salario) as maximo_salarios,
		min(l.salario) as minimo_salarios
from corporativo.lotacao l
inner join corporativo.departamento d
on d.id = l.id_departamento
inner join corporativo.funcionario f
on f.id = l.id_funcionario
where l.ativo = true and f.pcd = true
group by d.nome;
```
<br>

- Visualização: <br>

![screenshot](/images/ex10.png) <br>

<br>

## Meus Contatos

- Business Card - [Renato Albuquerque](https://rma-contacts.vercel.app/)
- Linkedin - [renato-malbuquerque](https://www.linkedin.com/in/renato-malbuquerque/)
- Discord - [Renato Albuquerque#0025](https://discordapp.com/users/992621595547938837)