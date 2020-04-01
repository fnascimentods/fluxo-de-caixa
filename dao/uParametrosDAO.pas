unit uParametrosDAO;

interface

uses Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uParametros, uDM;

type
  TParametrosDAO = class
    private
      zquery: TZQuery;
      dataSource: TDataSource;
      dm: Tdm;
    public
      constructor create;
      destructor destroy; override;

      function getParâmetros: TDataSource;
      function setParâmetros(Parametros: TParametros): boolean;
      function updateParametros(Parametros: TParametros): boolean;
      function deleteParametros(id: integer): boolean;
  end;
implementation

{ TParametrosDAO }

constructor TParametrosDAO.create;
begin
  dm := Tdm.Create(dm);
end;

function TParametrosDAO.deleteParametros(id: integer): boolean;
begin
  dm.Free;
end;

destructor TParametrosDAO.destroy;
begin

  inherited;
end;

function TParametrosDAO.getParâmetros: TDataSource;
var
  zqGet: TZquery;
  ds: TDataSource;
begin
  zqGet := TZquery.Create(zquery);
  zqGet.Connection := dm.conexao;

  ds := TDataSource.Create(dataSource);

  zqGet.Close;
  zqGet.SQL.Clear;
  zqGet.SQL.Add('select id, cast(nomeempresa as varchar(30)), usaccustorec, usaccustopag ');
  zqGet.SQL.Add('from Parametros                                                         ');
  zqGet.Open;

  ds.DataSet := zqGet;

  Result := ds;
end;

function TParametrosDAO.setParâmetros(Parametros: TParametros): boolean;
begin

end;

function TParametrosDAO.updateParametros(Parametros: TParametros): boolean;
begin

end;

end.
