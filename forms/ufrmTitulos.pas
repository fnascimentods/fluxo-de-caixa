unit ufrmTitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, uTitulosControl, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxLookup, ufrmCadastroTitulos;

type
  TfrmTitulos = class(TForm)
    ToolBar: TToolBar;
    btnNovo: TToolButton;
    btnEditar: TToolButton;
    btnDeletar: TToolButton;
    btnPesquisar: TToolButton;
    pnTop: TPanel;
    pnBottom: TPanel;
    dbgTitulos: TDBGrid;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    gbxFiltros: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    dblStatus: TRxDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    tituloControl: TTitulosControl;
  public
    { Public declarations }
  end;

var
  frmTitulos: TfrmTitulos;

implementation

{$R *.dfm}

procedure TfrmTitulos.btnNovoClick(Sender: TObject);
begin
  frmCadastroTitulos := TfrmCadastroTitulos.Create(frmCadastroTitulos);
  frmCadastroTitulos.ShowModal;
end;

procedure TfrmTitulos.btnPesquisarClick(Sender: TObject);
begin
  dbgTitulos.DataSource := tituloControl.getTitulosByParam(edtDescricao.Text, dblStatus.value);
end;

procedure TfrmTitulos.FormCreate(Sender: TObject);
begin
  tituloControl := TTitulosControl.create;

  dbgTitulos.dataSource := tituloControl.getTitulos;

  dblStatus.LookupField := 'id';
  dblStatus.LookupDisplay := 'descricao';
  dblStatus.LookupSource := tituloControl.getStatus;
  dblStatus.DisplayEmpty := ' ';
end;

end.
