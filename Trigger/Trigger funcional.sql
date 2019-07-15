
create database mercado;

use mercado;

create table tb_clientes 
(

 id int IDENTITY(1,1) primary key,
 nome varchar(100),
 endereco varchar (100),
 fone varchar (100),
 email varchar (100)



)

create table tb_client_auditoria
(
id int identity (1,1) primary key,
nome varchar (50),
endereco varchar(50),
fone varchar (20),
email varchar(40),
acao_de_auditoria varchar(130),
data_de_auditoria varchar(30)
)

go

create trigger trgAfterIsertCliente on tb_clientes for insert 
as 
declare @clinome varchar(100);
declare @cliend varchar (100);
declare @clifone varchar (100);
declare @cliemail varchar (100);

declare @audit_action varchar(100);

select @clinome=i.nome from inserted i;
select @cliend=i.endereco from inserted i;
select @clifone=i.fone from inserted i;
select @cliemail=i.email from inserted i;

set @audit_action='Registro Inserido --[Trigger do tipo Afet Insert na tb_clientes].';

insert into tb_client_auditoria (nome,endereco,fone,email,acao_de_auditoria,data_de_auditoria)
values(@clinome,@cliend,@clifone,@cliemail,@audit_action,getdate());
select* from tb_clientes;
select * from tb_client_auditoria

PRINT 'FIM DA EXECUCAO DA TRIGGER after insert cliente'
go

insert into tb_clientes (nome, endereco, fone,email) values ( 'gui','meu deus','ah muleke','gui@gui.com' );