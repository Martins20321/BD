create database RestauranteFinal;

use restauranteFinal;

create table RestauranteDesnormalizadoFN(
pedido_codigo int,
pedido_data timestamp,
pedido_status varchar(30),
forma_pagamento varchar(50),
valor_total decimal(10,2),
cliente_cpf char(11),
cliente_nome varchar(100),
produto_id int,
produto_nome varchar(100),
quantidade int,
preco_unitario decimal(10,2),
subtotal decimal(10,2),
pagamento_status varchar(30),
tipo_pagamento varchar(50),
valor_pago decimal(10,2),
codigo_transacao varchar(100)
);

insert into RestauranteDesnormalizadoFN values
(1, '2025-07-10', 'CONCLUIDO','Cartão de crédito',64.00,'12234568932','Pedro Lima',10, 'Cachorro quente', 1, 15.00,15.00,'PAGO','Cartão de crédito', 64.00,'ABC10203040'),
(1, '2025-07-10', 'CONCLUIDO','Cartão de crédito',64.00,'12234568932','Pedro Lima',11, 'Pizza de Calabresa', 1, 49.00,49.00,'PAGO','Cartão de crédito',64.00,'ABC10203040'),
(2, '2025-07-10', 'CONCLUIDO','PIX',40.00,'78943584920','Marcos Romario',09, 'Coca Cola 2L', 1, 20.00,20.00,'PAGO','PIX',40.00,'ABC39212335'),
(2, '2025-07-10', 'CONCLUIDO','PIX',40.00,'78943584920','Marcos Romario',14, 'Hamburguer', 1, 20.00,20.00,'PAGO','PIX',40.00,'ABC39212335'),
(3, '2025-07-10', 'CONCLUIDO', 'DINHEIRO',45.00,'89348549310','Kleber Genuario', 03,'Jantinha', 2, 22.50, 45.00,'PAGO','DINHEIRO', 45.00,'ABC90345673'),
(4, '2025-07-10', 'EM PROCESSO','DINHEIRO',34.00,'62991234567', 'Lucas Ferreira', 07, 'X-tudo',1,34.00,34.00,'PENDENTE','DINHEIRO',34.00,'ABC92342319'),
(5, '2025-07-10', 'CONCLUIDO', 'PIX', 58.00, '78945612378', 'Rafael Torres', 19, 'Guaraná 1L', 1, 8.00, 8.00, 'PAGO', 'PIX', 58.00, 'ABC13349390'),
(5, '2025-07-10', 'CONCLUIDO', 'PIX', 58.00, '78945612378', 'Rafael Torres', 22, 'Torta de abacaxi', 1, 15.00, 15.00, 'PAGO', 'PIX', 58.00, 'ABC13349390'),
(6, '2025-07-10', 'CANCELADO', 'Cartão de crédito', 23.00, '32165498700', 'Luciana Pereira', 10, 'Cachorro quente', 1, 15.00, 15.00, 'CANCELADO', 'Cartão de crédito', 23.00, 'ABC30123454'),
(6, '2025-07-07', 'CANCELADO', 'Cartão de crédito', 23.00, '32165498700', 'Luciana Pereira', 18, 'Água com gás', 1, 8.00, 8.00, 'CANCELADO', 'Cartão de crédito', 23.00, 'ABC30123454'),
(7, '2025-07-10', 'CONCLUIDO', 'Vale Alimentação', 50.00, '11223344556', 'Fernanda Dias', 02, 'Picanha', 1, 50.00, 50.00, 'PAGO', 'Vale Alimentação', 50.00, 'ABC90378945'),
(8, '2025-07-10', 'EM PROCESSO', 'PIX', 18.00, '99887766554', 'João Carlos', 06, 'Tapioca', 2, 9.00, 18.00, 'PENDENTE', 'PIX', 18.00, 'ABC90126783'),
(9, '2025-07-10', 'CONCLUIDO', 'Dinheiro', 40.00, '66554433221', 'Isabela Neves', 16, 'Lasanha de Frango', 1, 40.00, 40.00, 'PAGO', 'Dinheiro', 40.00, 'ABC38732954'),
(10, '2025-07-10', 'CONCLUIDO', 'Cartão de crédito', 29.00, '44556677889', 'Carlos Eduardo', 04, 'Batata frita', 1, 14.00, 14.00, 'PAGO', 'Cartão de crédito', 29.00, 'ABC76381938'),
(10, '2025-07-10', 'CONCLUIDO', 'Cartão de crédito', 29.00, '44556677889', 'Carlos Eduardo', 13, 'Refrigerante Lata', 1, 15.00, 15.00, 'PAGO', 'Cartão de crédito', 29.00, 'ABC76381938');

select *  from RestauranteDesnormalizadoFN;

create table cliente(
cpf char(11) primary key,
nomme varchar(100),
data_nasc varchar(100),
rua varchar(100),
numero varchar(10),
cep char(8)
);

create table restaurante (
cnpj char(14) primary key,
nome varchar(100),
rua varchar(100),
numero varchar(10),
cep char(8)
);

create table produto(
id_produto int primary key auto_increment,
nome varchar(100),
preco decimal(10,2),
restaurante_cnpj char(14),
foreign key (restaurante_cnpj) references restaurante(cnpj)
);

create table pedido(
id_pedido int primary key auto_increment,
status varchar(30),
valor decimal(10,2),
forma_pagamento varchar(50),
data_pedido datetime,
cliente_cpf char(11),
restaurante_cnpj char(14),
foreign key (cliente_cpf) references cliente(cpf),
foreign key (restaurante_cnpj) references restaurante(cnpj)
);

create table item_pedido(
id_item int primary key auto_increment,
id_pedido int,
id_produto int,
quantidade int,
preco_unitario decimal(10,2),
subtotal decimal(10,2),
observacao text,
foreign key (id_pedido) references pedido(id_pedido),
foreign key (id_produto) references produto(id_produto)
);

create table gateway_pagamento(
id_pagamento int primary key auto_increment,
pedido_id int unique,
tipo_pagamento varchar(50),
status_pagamento varchar(30),
valor_pago decimal (10,2),
codigo_transacao varchar(100),
foreign key (pedido_id) references pedido(id_pedido)
);

insert into cliente values
('12234568932', 'Pedro Lima', '1990-05-10', 'Rua Pedra', '123', '12345678'),
('78943584920', 'Marcos Romario', '1985-03-22', 'Rua Doce', '024', '23456789'),
('89348549310', 'Kleber Genuario', '1978-11-05', 'Rua Tatu', '901', '34567890'),
('62991234567', 'Lucas Ferreira', '1992-01-19', 'Rua Riacho', '084', '45678901'),
('78945612378', 'Rafael Torres', '1988-07-12', 'Rua das Rosas', '222', '56789012'),
('32165498700', 'Luciana Pereira', '1975-06-25', 'Av. Brasil', '303', '67890123'),
('11223344556', 'Fernanda Dias', '1991-02-08', 'Rua Aguas', '404', '78901234'),
('99887766554', 'João Carlos', '1983-09-30', 'Rua Arniqueiras', '701', '89012345'),
('66554433221', 'Isabela Neves', '1993-12-14', 'Rua das Oliveiras', '011', '90123456'),
('44556677889', 'Carlos Eduardo', '1987-08-18', 'Rua dos Coqueiros', '707', '01234567');

select * from cliente;

insert into restaurante values
('12345678000199', 'Restaurante Central', 'Av. Principal', '1000', '11223344');

select * from restaurante;

insert into produto values
(3, 'Jantinha', 22.50, '12345678000199'),
(4, 'Batata frita', 14.00, '12345678000199'),
(6, 'Tapioca', 9.00, '12345678000199'),
(7, 'X-tudo', 34.00, '12345678000199'),
(9, 'Coca Cola 2L', 20.00, '12345678000199'),
(10, 'Cachorro quente', 15.00, '12345678000199'),
(11, 'Pizza de Calabresa', 49.00, '12345678000199'),
(13, 'Refrigerante Lata', 15.00, '12345678000199'),
(14, 'Hamburguer', 20.00, '12345678000199'),
(16, 'Lasanha de Frango', 40.00, '12345678000199'),
(18, 'Água com gás', 8.00, '12345678000199'),
(19, 'Guaraná 1L', 8.00, '12345678000199'),
(22, 'Torta de abacaxi', 15.00, '12345678000199'),
(2, 'Picanha', 50.00, '12345678000199');

select * from produto;

insert into pedido values
(1, 'CONCLUIDO', 64.00, 'Cartão de crédito', '2025-07-10 00:00:00', '12234568932', '12345678000199'),
(2, 'CONCLUIDO', 40.00, 'PIX', '2025-07-10 00:00:00', '78943584920', '12345678000199'),
(3, 'CONCLUIDO', 45.00, 'DINHEIRO', '2025-07-10 00:00:00', '89348549310', '12345678000199'),
(4, 'EM PROCESSO', 34.00, 'DINHEIRO', '2025-07-10 00:00:00', '62991234567', '12345678000199'),
(5, 'CONCLUIDO', 58.00, 'PIX', '2025-07-10 00:00:00', '78945612378', '12345678000199'),
(6, 'CANCELADO', 23.00, 'Cartão de crédito', '2025-07-10 00:00:00', '32165498700', '12345678000199'),
(7, 'CONCLUIDO', 50.00, 'Vale Alimentação', '2025-07-10 00:00:00', '11223344556', '12345678000199'),
(8, 'EM PROCESSO', 18.00, 'PIX', '2025-07-10 00:00:00', '99887766554', '12345678000199'),
(9, 'CONCLUIDO', 40.00, 'Dinheiro', '2025-07-10 00:00:00', '66554433221', '12345678000199'),
(10, 'CONCLUIDO', 29.00, 'Cartão de crédito', '2025-07-10 00:00:00', '44556677889', '12345678000199');

select * from pedido;

insert into item_pedido values
(1, 1, 10, 1, 15.00, 15.00, 'Todos os molhos'),
(2, 1, 11, 1, 49.00, 49.00, 'Sem queijo'),
(3, 2, 9, 1, 20.00, 20.00, NULL),
(4, 2, 14, 1, 20.00, 20.00, NULL),
(5, 3, 3, 2, 22.50, 45.00, NULL),
(6, 4, 7, 1, 34.00, 34.00, 'Sem alface'),
(7, 5, 19, 1, 8.00, 8.00, NULL),
(8, 5, 22, 1, 15.00, 15.00, NULL),
(9, 6, 10, 1, 15.00, 15.00, NULL),
(10, 6, 18, 1, 8.00, 8.00, NULL),
(11, 7, 2, 1, 50.00, 50.00, 'Ao ponto'),
(12, 8, 6, 2, 9.00, 18.00, NULL),
(13, 9, 16, 1, 40.00, 40.00, NULL),
(14, 10, 4, 1, 14.00, 14.00, NULL),
(15, 10, 13, 1, 15.00, 15.00, NULL);

select * from item_pedido;

insert into gateway_pagamento values
(1, 1, 'Cartão de crédito', 'PAGO', 64.00, 'ABC10203040'),
(2, 2, 'PIX', 'PAGO', 40.00, 'ABC39212335'),
(3, 3, 'DINHEIRO', 'PAGO', 45.00, 'ABC90345673'),
(4, 4, 'DINHEIRO', 'PENDENTE', 34.00, 'ABC92342319'),
(5, 5, 'PIX', 'PAGO', 58.00, 'ABC13349390'),
(6, 6, 'Cartão de crédito', 'CANCELADO', 23.00, 'ABC30123454'),
(7, 7, 'Vale Alimentação', 'PAGO', 50.00, 'ABC90378945'),
(8, 8, 'PIX', 'PENDENTE', 18.00, 'ABC90126783'),
(9, 9, 'Dinheiro', 'PAGO', 40.00, 'ABC38732954'),
(10, 10, 'Cartão de crédito', 'PAGO', 29.00, 'ABC76381938');

select * from gateway_pagamento;

-- Retorna todos os pedidos feito por Pedro Lima
select 
c.nomme as cliente,
p.id_pedido,
pr.nome as produto,
ip.quantidade,
ip.subtotal
from pedido p
join cliente c on p.cliente_cpf = c.cpf
join item_pedido ip on p.id_pedido = ip.id_pedido
join produto pr on ip.id_produto = pr.id_produto
where c.nomme = 'Pedro Lima'
order by ip.subtotal desc;

-- Retorna pedidos feitos via PIX
select 
p.id_pedido,
p.valor,
g.status_pagamento,
g.codigo_transacao
from pedido p
join gateway_pagamento g on p.id_pedido = g.pedido_id
where g.tipo_pagamento = 'PIX'
order by p.valor;

-- Retorna pedidos feitos por Kleber Genuario
select 
c.nomme as cliente,
p.id_pedido,
pr.nome as produto,
ip.quantidade,
ip.subtotal
from pedido p
join cliente c on p.cliente_cpf = c.cpf
join item_pedido ip on p.id_pedido = ip.id_pedido
join produto pr on ip.id_produto = pr.id_produto
where c.nomme = 'Kleber Genuario'
order by ip.subtotal desc;

-- Conta quantos pedidos foram concluidos e ordena por mais usado para menos usado
select forma_pagamento, count(*) as total
from pedido
where status = 'CONCLUIDO'
group by forma_pagamento
order by total desc;

-- Retorna somando os subtotais dos itens, somente valores maiores que 25
select pr.nome as produto, sum(ip.subtotal) as valor_vendido
from item_pedido ip
join produto pr on ip.id_produto = pr.id_produto
where ip.subtotal >25
group by pr.nome
order by valor_vendido desc;

-- Retorna a media dos pedidos, na ordem do maior para o menor
select forma_pagamento, avg(valor) as media_valores
from pedido
group by forma_pagamento
order by media_valores desc;

-- Retorna o maior valor da media de todos os pedidos
select id_pedido, valor, cliente_cpf
from pedido
where valor > (select avg(valor) from pedido);

-- atualiza o id 2, para EM PROCESSO
update pedido
set status = 'EM PROCESSO'
where id_pedido = 2;

select * from pedido;

-- Exclui na tabela item_pedido valores com 3
delete from item_pedido
where id_item = 3;

select * from item_pedido;
