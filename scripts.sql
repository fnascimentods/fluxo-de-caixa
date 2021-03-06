create table RegistroBaixa(
	id serial primary KEY,
	databaixa date not null,
  tituloid integer not null,
  statusid integer not NULL
);

create table Titulo (
	id serial primary KEY,
	descricao varchar (30) not null,
  valor decimal(10, 2) not NULL,
  datalancamento date not NULL,
  datavencimento date not null,
  statusid integer not null,
  observacoes varchar (100)
);

create table Status(
	id serial primary KEY,
  descricao varchar (20)
);


alter table Titulo add constraint fk_Titulos_Status foreign key (statusid)
	references Status (id);

 alter table RegistroBaixa add constraint fk_RegistroBaixa_Titulo foreign key (tituloid)
	references Titulo (id);

 alter table RegistroBaixa add constraint fk_RegistroBaixa_Status foreign key (statusid)
	references Status (id);

select * from Titulo;

select * from RegistroBaixa;

select * from Status;

insert into Status (
	descricao
) values (
	'Finalizado'
);

insert into Titulo (
	descricao,
  valor,
  statusid,
  datalancamento,
  datavencimento,
  observacoes
) values (
	'Boleto bancário do ITAÚ',
  319.90,
  2,
  '2020-04-01',
  '2020-05-15',
  'Observação'
);


select id, cast(descricao as varchar(30)), valor,
datalancamento, datavencimento, statusid,
cast(observacoes as varchar(100))
from Titulo where descricao like '%felipe%' or statusid = null;                                      