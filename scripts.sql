create table Parametros (
	id serial primary KEY,
  nomeempresa varchar(30),
  usaccustorec BOOLEAN,
  usaccustopag boolean
);

create table Pessoa (
	id serial primary KEY,
  razaosocial varchar(30),
  nomefantasia varchar(30),
  tipopessoa char(1),
  cliente char(1),
  fornecedor char(1),
  telefone varchar(15),
  email varchar(30),
  inativa boolean
);

create table CentroCustos(
	id serial primary KEY,
  descricao varchar(60),
  receita BOOLEAN,
  despesa boolean,
  inativo boolean
);

create table Titulos (
	id serial primary KEY,
  tipo char(1),
  datacriacao tIMESTAMP,
  pessoaid integer not null,
  centrocustoid integer,
  referencia varchar(60),
  valor money,
  vencimento date,
  valorrecpag money,
  datarecpag date,
  observacao varchar(100)
);

alter table Titulos add constraint fk_Titulos_Pessoa foreign key (pessoaid)
	references Pessoa (id) on delete no action;

  alter table Titulos add constraint fk_Titulos_CentroCustos foreign key (centrocustoid)
	references CentroCustos (id) on delete no action;

  select * from Parametros;

  insert into Parametros (nomeempresa, usaccustorec, usaccustopag) values ('Sistema', TRUE, false);