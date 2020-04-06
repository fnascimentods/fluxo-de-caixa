unit uTitulosDAO;

interface

uses uDM, ZAbstractConnection, ZConnection, Data.DB, ZAbstractRODataset,
     ZAbstractDataset, ZDataset, System.SysUtils, uTitulos;

type
  TitulosDAO = class
    private
      zquery: TZQuery;
      ds: TDataSource;
    public
      procedure setNovoTitulo(titulo: TTitulos);
      procedure editarTitulo(titulo: TTitulos);
      procedure excluirTitulo(id: integer);

      function getTitulos: TDataSource;
      function getTitulosByParam(descricao, statusid: string): TDataSource;
      function getStatus: TDataSource;
  end;

implementation

{ TitulosDAO }

procedure TitulosDAO.editarTitulo(titulo: TTitulos);
var
  zqSet: TZQuery;
begin
  zqSet := TZQuery.Create(zquery);
  zqSet.Connection := dm.conexao;

  try
    zqSet.Close;
    zqSet.SQL.Clear;
    zqSet.SQL.Add(' update Titulo set                   ');
    zqSet.SQL.Add('   descricao = :descricao,           ');
    zqSet.SQL.Add('   valor = :valor,                   ');
    zqSet.SQL.Add('   datavencimento = :datavencimento, ');
    zqSet.SQL.Add('   statusid = :statusid,             ');
    zqSet.SQL.Add('   observacoes = :observacoes        ');
    zqSet.SQL.Add(' where id = :id                      ');

    zqSet.ParamByName('descricao').AsString    := titulo.descricao;
    zqSet.ParamByName('valor').AsFloat         := titulo.valor;
    zqSet.ParamByName('datavencimento').AsDate := titulo.datavencimento;
    zqSet.ParamByName('statusid').AsInteger    := titulo.statusid;
    zqSet.ParamByName('observacoes').AsString  := titulo.observacoes;
    zqSet.ParamByName('id').AsInteger          := titulo.ID;

    zqSet.ExecSQL;

    try
      dm.conexao.StartTransaction;
    except
      on e: Exception do
        dm.conexao.Rollback;
    end;
  finally
    zqSet.Close;
    zqSet.Free;
  end;
end;

procedure TitulosDAO.excluirTitulo(id: integer);
var
  zqSet: TZQuery;
begin
  zqSet := TZQuery.Create(zquery);
  zqSet.Connection := dm.conexao;

  try
    zqSet.Close;
    zqSet.SQL.Clear;
    zqSet.SQL.Add(' delete from Titulo where id = :id ');

    zqSet.ParamByName('id').AsInteger := id;

    zqSet.ExecSQL;
  finally
    zqSet.Close;
    zqSet.Free;
  end;
end;

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
  zqGet.SQL.Add(' order by Titulo.id                                         ');
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
  zqGet.SQL.Add(' order by Titulo.id                                         ');

  if Trim(descricao) <> '' then
    zqGet.ParamByName('descricao').AsString := '%'+descricao+'%';

  if Trim(statusid) <> '' then
    zqGet.ParamByName('statusid').AsString := statusid;

  zqGet.Open;

  data.DataSet := zqGet;

  Result := data;
end;

procedure TitulosDAO.setNovoTitulo(titulo: TTitulos);
var
  zqSet: TZQuery;
  sql: string;
begin
  zqSet := TZQuery.Create(zquery);
  zqSet.Connection := dm.conexao;

  sql :=
  ' insert into Titulo (               '+
  '   descricao,                       '+
  '   valor,                           '+
  '   datalancamento,                  '+
  '   datavencimento,                  '+
  '   statusid,                        '+
  '   observacoes                      '+
  ' ) values (                         '+
  '   :descricao,                      '+
  '   :valor,                          '+
  '   :datalancamento,                 '+
  '   :datavencimento,                 '+
  '   :statusid,                       '+
  '   :observacoes                     '+
  ' )                                  ';

  try
    zqSet.Close;
    zqSet.SQL.Clear;
    zqSet.SQL.Add(sql);

    zqSet.ParamByName('descricao').AsString    := titulo.descricao;
    zqSet.ParamByName('valor').AsFloat         := titulo.valor;
    zqSet.ParamByName('datalancamento').AsDate := titulo.datalancamento;
    zqSet.ParamByName('datavencimento').AsDate := titulo.datavencimento;
    zqSet.ParamByName('statusid').AsInteger    := titulo.statusid;
    zqSet.ParamByName('observacoes').AsString  := titulo.observacoes;

    zqSet.ExecSQL;

    try
      dm.conexao.StartTransaction;
    except
      on e: Exception do
        dm.conexao.Rollback;
    end;
  finally
    zqSet.Close;
    zqSet.Free;
  end;
end;

end.
