-- Todas as tabelas do banco de dados digital_restore:
select * from corporativo.cargo;
select * from corporativo.departamento;
select * from corporativo.funcionario;
select * from corporativo.lotacao;

-- Challenge Questions:

-- 01
select * from corporativo.funcionario
order by funcionario.pretensao_salarial asc
limit 1;

-- 02
select funcionario.nome, funcionario.pretensao_salarial 
from corporativo.funcionario
order by funcionario.pretensao_salarial desc
limit 1;

-- 03
select * from corporativo.funcionario
where funcionario.pretensao_salarial <= 3500 and funcionario.pcd = false
order by funcionario.pretensao_salarial desc;

-- 04
select f.nome as funcionario, c.nome as cargo
from corporativo.lotacao l
inner join corporativo.funcionario f
on f.id = l.id_funcionario
inner join corporativo.cargo c
on c.id = l.id_cargo
where c.nome = 'Programador' or c.nome = 'Analista de Infra'
order by c.nome;

-- 05
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

-- 06
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

-- 07
select d.nome as departamento, 
		sum(l.salario) as soma_salarios  
from corporativo.lotacao l
inner join corporativo.departamento d
on d.id = l.id_departamento
group by d.nome
order by sum(l.salario) desc;

-- 08
select c.nome as cargo, 
		sum(l.salario) as soma_salarios
from corporativo.lotacao l
inner join corporativo.cargo c
on c.id = l.id_cargo
group by c.nome
having sum(l.salario) > 1000
order by sum(l.salario) desc;

-- 09
select d.nome as departamento, 
		sum(l.salario) as soma_salarios,
		avg(l.salario)::numeric(18,2) as media_salarios
from corporativo.lotacao l
inner join corporativo.departamento d
on d.id = l.id_departamento
group by d.nome
order by sum(l.salario) desc;

-- 10
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








