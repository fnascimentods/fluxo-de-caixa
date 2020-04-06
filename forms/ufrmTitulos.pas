unit ufrmTitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, uTitulosControl, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxLookup, ufrmCadastroTitulos,
  System.ImageList, Vcl.ImgList, PngImageList;

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
    gbxFiltros: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    dblStatus: TRxDBLookupCombo;
    icones: TPngImageList;
    Label3: TLabel;
    lbltotalRegistro: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnDeletarClick(Sender: TObject);
  private
    tituloControl: TTitulosControl;
  public
    { Public declarations }
  end;

var
  frmTitulos: TfrmTitulos;

implementation

{$R *.dfm}

procedure TfrmTitulos.btnDeletarClick(Sender: TObject);
var
  id: integer;
begin
  id := dbgTitulos.DataSource.DataSet.FieldByName('id').AsInteger;
  tituloControl.excluir(id);
end;

procedure TfrmTitulos.btnNovoClick(Sender: TObject);
begin
  frmCadastroTitulos := TfrmCadastroTitulos.Create(frmCadastroTitulos);
  frmCadastroTitulos.ShowModal;

  dbgTitulos.DataSource.DataSet.Refresh;
  lbltotalRegistro.Caption := IntToStr(dbgTitulos.DataSource.DataSet.RecordCount);
end;

procedure TfrmTitulos.btnPesquisarClick(Sender: TObject);
begin
  dbgTitulos.DataSource := tituloControl.getTitulosByParam(edtDescricao.Text, dblStatus.value);
end;

procedure TfrmTitulos.dbgTitulosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  texto: string;
begin
  with (Sender as TDBGrid).Canvas do
  begin
    texto := dbgTitulos.DataSource.DataSet.FieldByName(Column.Field.FieldName).AsString;

    if State = [] then
    begin
      if dbgTitulos.DataSource.DataSet.RecNo mod 2 = 1 then
         dbgTitulos.Canvas.Brush.Color := $00EBCE87
      else
         dbgTitulos.Canvas.Brush.Color := clWhite;
    end;
    dbgTitulos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

    Font.Color := clBlack;
    Font.Size := 8;

    if (gdSelected in State) or (gdFocused in State) then
       TDBGrid(Sender).Canvas.Brush.Color := $00CBC0FF;

    dbgTitulos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

    FillRect(Rect);
    if not (State=[]) then
       DrawFocusRect(Rect);

    TextOut(Rect.Left+2, Rect.Top+1, texto);

    lbltotalRegistro.Caption := IntToStr(dbgTitulos.DataSource.DataSet.RecordCount);
  end;
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
