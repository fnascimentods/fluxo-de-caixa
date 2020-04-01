unit ufrmMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  ufrmParametros, ufrmPessoas, ufrmTitulos, uDM, Vcl.StdCtrls;

type
  TfrmMenu = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

procedure TfrmMenu.Button1Click(Sender: TObject);
begin
  frmParametros := TfrmParametros.Create(frmParametros);
  frmParametros.Show;
end;

end.
