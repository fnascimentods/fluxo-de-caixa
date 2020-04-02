unit uTitulosDAO;

interface

uses uDM, ZAbstractConnection, ZConnection, Data.DB, ZAbstractRODataset,
     ZAbstractDataset, ZDataset, System.SysUtils;

type
  TitulosDAO = class
    private
      zquery: TZQuery;
      ds: TDataSource;
    public
      function getTitulos: TDataSource;
      function getTitulosByParam(descricao, statusid: string): TDataSource;
      function getStatus: TDataSource;
  end;

implementation

{ TitulosDAO }

function TitulosDAO.getStatus: TDataSource;
var
  zqGet: TZQuery;
  data: TDataSource;
begin
  zqGet := TZQuery.Create(zquery);
  zqGet.Connection := dm.conexao;

  data := TDataSource.Create(ds);

  zqGet.Close;
  zqGet.SQL.Clear;
  zqGet.SQL.Add(' select id, descricao from Status where id in (1, 2, 5)');
  zqGet.Open;

  data.DataSet := zqGet;

  Result := data;
end;

function TitulosDAO.getTitulos: TDataSource;
var
  zqGet: TZQuery;
  data: TDataSource;
begin
  zqGet := TZQuery.Create(zquery);
  zqGet.Connection := dm.conexao;

  data := TDataSource.Create(ds);

  zqGet.Close;
  zqGet.SQL.Clear;
  zqGet.SQL.Add(' select Titulo.id as id, cast(Titulo.descricao as varchar(30)) as descricao, valor,   ');
  zqGet.SQL.Add(' datalancamento, datavencimento, statusid,                  ');
  zqGet.SQL.Add(' cast(observacoes as varchar(100)),                         ');
  zqGet.SQL.Add(' Status.descricao as status                                 ');
  zqGet.SQL.Add(' from Titulo                                                ');
  zqGet.SQL.Add(' join Status on Status.id = Titulo.statusid                 ');
  zqGet.Open;

  data.DataSet := zqGet;

  Result := data;
end;

function TitulosDAO.getTitulosByParam(descricao, statusid: string): TDataSource;
var
  zqGet: TZQuery;
  data: TDataSource;
begin
  zqGet := TZQuery.Create(zquery);
  zqGet.Connection := dm.conexao;

  data := TDataSource.Create(ds);

  zqGet.Close;
  zqGet.SQL.Clear;
  zqGet.SQL.Add(' select Titulo.id as id, cast(Titulo.descricao as varchar(30)) as descricao, valor,   ');
  zqGet.SQL.Add(' datalancamento, datavencimento, statusid,                  ');
  zqGet.SQL.Add(' cast(observacoes as varchar(100)),                         ');
  zqGet.SQL.Add(' Status.descricao as status                                 ');
  zqGet.SQL.Add(' from Titulo                                                ');
  zqGet.SQL.Add(' join Status on Status.id = Titulo.statusid                 ');
  zqGet.SQL.Add(' where Titulo.descricao like :descricao or statusid = :statusid ');

  if Trim(descricao) <> '' then
    zqGet.ParamByName('descricao').AsString := '%'+descricao+'%';

  if Trim(statusid) <> '' then
    zqGet.ParamByName('statusid').AsString := statusid;

  zqGet.Open;

  data.DataSet := zqGet;

  Result := data;
end;

end.
