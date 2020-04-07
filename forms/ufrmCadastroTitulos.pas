unit ufrmCadastroTitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RxToolEdit, RxCurrEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, RxLookup, uTitulos,
  uTitulosControl, System.ImageList, Vcl.ImgList, PngImageList;

type
  TfrmCadastroTitulos = class(TForm)
    ToolBar: TToolBar;
    btnSalvar: TToolButton;
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
    icones: TPngImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    tituloControl: TTitulosControl;
  public
    tituloID: integer;
    editar: boolean;

    procedure clear;
  end;

var
  frmCadastroTitulos: TfrmCadastroTitulos;

implementation

{$R *.dfm}

procedure TfrmCadastroTitulos.btnCancelarClick(Sender: TObject);
begin
  frmCadastroTitulos.Close;
end;

procedure TfrmCadastroTitulos.btnSalvarClick(Sender: TObject);
begin
  tituloControl.setNovoTitulo(editar);
end;

procedure TfrmCadastroTitulos.clear;
begin
  edtDescricao.Clear;
  dtpDataVencimento.Date := Date;
  cedValor.Clear;
  dblStatus.ResetField;
  mmObservacoes.Clear;
end;

procedure TfrmCadastroTitulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    tituloControl.Free;
  finally
    Action := caFree;
    frmCadastroTitulos := nil;
  end;
end;

procedure TfrmCadastroTitulos.FormCreate(Sender: TObject);
begin
  tituloControl := TTitulosControl.create;

  dblStatus.LookupField   := 'id';
  dblStatus.LookupDisplay := 'descricao';
  dblStatus.LookupSource  := tituloControl.getStatus;
  dblStatus.DisplayEmpty  := ' ';

  dtpDataVencimento.MinDate := Date;
  dtpDataVencimento.Date    := Date;

  editar := false;

  cedValor.MaxLength := 9;
end;

end.
