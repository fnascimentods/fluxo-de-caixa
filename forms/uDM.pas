unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, System.IniFiles,
  Vcl.Forms, Dialogs, Winapi.Windows, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tdm = class(TDataModule)
    conexao: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure configuraConexao;
    procedure conectaDB;
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Tdm }

procedure Tdm.conectaDB;
var
  configDB: TIniFile;
begin
  configDB := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');

  try
    conexao.Database := configDB.ReadString('CONEXAO', 'database', EmptyStr);
    conexao.HostName := configDB.ReadString('CONEXAO', 'hostname', EmptyStr);
    conexao.Password := configDB.ReadString('CONEXAO', 'password', EmptyStr);
    conexao.Port     := configDB.ReadInteger('CONEXAO', 'port', 0);
    conexao.User     := 'postgres';
    conexao.Protocol := 'postgresql';

    conexao.Connect;
  except
    on e: Exception do
      Application.MessageBox(PChar('Falha na conexão! Por favor contacte o suporte.'), 'Atenção', MB_ICONERROR + MB_OK);
  end;
  FreeAndNil(configDB);
end;

procedure Tdm.configuraConexao;
var
  configDB: TIniFile;
begin
  configDB := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');

  try
    configDB.WriteString('CONEXAO', 'database', 'db_fluxo');
    configDB.WriteString('CONEXAO', 'hostname', 'localhost');
    configDB.WriteString('CONEXAO', 'password', 'acessog10');
    configDB.WriteInteger('CONEXAO', 'port', 5432);
  finally
    FreeAndNil(configDB);
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  configuraConexao;
  conectaDB;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  conexao.Disconnect;
end;

end.
