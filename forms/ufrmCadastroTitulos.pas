unit ufrmCadastroTitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RxToolEdit, RxCurrEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, RxLookup, uTitulos,
  uTitulosControl;

type
  TfrmCadastroTitulos = class(TForm)
    ToolBar: TToolBar;
    btnSalvar: TToolButton;
    ToolButton4: TToolButton;
    btnCancelar: TToolButton;
    gbxCadastro: TGroupBox;
    pnBottom: TPanel;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    cedValor: TCurrencyEdit;
    Label3: TLabel;
    dtpDataVencimento: TDateTimePicker;
    dblStatus: TRxDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    mmObservacoes: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    tituloControl: TTitulosControl;
  public
    { Public declarations }
  end;

var
  frmCadastroTitulos: TfrmCadastroTitulos;

implementation

{$R *.dfm}

procedure TfrmCadastroTitulos.FormCreate(Sender: TObject);
begin
  tituloControl := TTitulosControl.create;

  dblStatus.LookupField := 'id';
  dblStatus.LookupDisplay := 'descricao';
  dblStatus.LookupSource := tituloControl.getStatus;
  dblStatus.DisplayEmpty := ' ';
end;

end.
