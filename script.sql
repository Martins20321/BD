create database restauranteBD; 
use restauranteBD; 
create table restauranteDesnormalizadoBD( 
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
