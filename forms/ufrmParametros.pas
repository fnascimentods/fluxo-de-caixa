unit ufrmParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uParametrosControl, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmParametros = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    ParametrosControl: TParametrosControl;
  public
    { Public declarations }
  end;

var
  frmParametros: TfrmParametros;

implementation

{$R *.dfm}

procedure TfrmParametros.FormCreate(Sender: TObject);
begin
  ParametrosControl := TParametrosControl.create;

  DBGrid1.DataSource := ParametrosControl.getParametros;
end;

end.
