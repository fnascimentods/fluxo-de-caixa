unit ufrmTitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, uTitulosControl, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxLookup, ufrmCadastroTitulos,
  System.ImageList, Vcl.ImgList, PngImageList, ufrmImprimir;

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
    btnImprimir: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
  private
    tituloControl: TTitulosControl;
    procedure editar;
  public
    dataSource: TDataSource;
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
  tituloControl.excluirTitulo(id);

  dbgTitulos.dataSource := tituloControl.getTitulos;
end;

procedure TfrmTitulos.btnEditarClick(Sender: TObject);
begin
  editar;

  dbgTitulos.dataSource := tituloControl.getTitulos;
end;

procedure TfrmTitulos.btnImprimirClick(Sender: TObject);
begin
  frmImprimir := TfrmImprimir.Create(frmImprimir);
  frmImprimir.RLReport.Preview();
end;

procedure TfrmTitulos.btnNovoClick(Sender: TObject);
begin
  frmCadastroTitulos := TfrmCadastroTitulos.Create(frmCadastroTitulos);
  frmCadastroTitulos.ShowModal;

  dbgTitulos.dataSource := tituloControl.getTitulos;
  lbltotalRegistro.Caption := IntToStr(dbgTitulos.DataSource.DataSet.RecordCount);
end;

procedure TfrmTitulos.btnPesquisarClick(Sender: TObject);
begin
  dataSource := tituloControl.getTitulosByParam(edtDescricao.Text, dblStatus.value);
  dbgTitulos.DataSource := dataSource;
end;

procedure TfrmTitulos.dbgTitulosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  texto: string;
  valor: currency;
begin
  with (Sender as TDBGrid).Canvas do
  begin
    texto := dbgTitulos.DataSource.DataSet.FieldByName(Column.Field.FieldName).AsString;

    if State = [] then
    begin
      if dbgTitulos.DataSource.DataSet.RecNo mod 2 = 1 then
         dbgTitulos.Canvas.Brush.Color := $00F3E2A9
      else
         dbgTitulos.Canvas.Brush.Color := clWhite;
    end;
    dbgTitulos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

    Font.Color := clBlack;
    Font.Size := 8;

    if (gdSelected in State) or (gdFocused in State) then
       TDBGrid(Sender).Canvas.Brush.Color := $0081F7F3;

    if dbgTitulos.DataSource.DataSet.FieldByName('status').AsString = 'Receita' then
       TDBGrid(Sender).Canvas.Font.Color := $00088A08;

    if dbgTitulos.DataSource.DataSet.FieldByName('status').AsString = 'Despesa' then
       TDBGrid(Sender).Canvas.Font.Color := $000101DF;

    dbgTitulos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

    FillRect(Rect);
    if not (State=[]) then
       DrawFocusRect(Rect);

    if Column.FieldName = 'valor' then
    begin
      valor := dbgTitulos.DataSource.DataSet.FieldByName(Column.Field.FieldName).AsCurrency;
      texto := FormatFloat('###,##0.00', valor);
      TextOut(Rect.Right - (TextWidth(texto)+6), Rect.Top+1, texto);
    end
    else
      TextOut(Rect.Left+2, Rect.Top+1, texto);

    lbltotalRegistro.Caption := IntToStr(dbgTitulos.DataSource.DataSet.RecordCount);
  end;
end;

procedure TfrmTitulos.editar;
begin
  frmCadastroTitulos := TfrmCadastroTitulos.Create(frmCadastroTitulos);

  with frmCadastroTitulos do
  begin
    editar := true;
    tituloID := dbgTitulos.DataSource.DataSet.FieldByName('id').AsInteger;
    edtDescricao.Text := dbgTitulos.DataSource.DataSet.FieldByName('descricao').AsString;
    cedValor.Text := dbgTitulos.DataSource.DataSet.FieldByName('valor').AsString;
    mmObservacoes.Lines.Add(dbgTitulos.DataSource.DataSet.FieldByName('observacoes').AsString);
  end;

  frmCadastroTitulos.ShowModal;
end;

procedure TfrmTitulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    tituloControl.Free;
  finally
    Action := caFree;
    frmTitulos := nil;
  end;
end;

procedure TfrmTitulos.FormCreate(Sender: TObject);
begin
  tituloControl := TTitulosControl.create;
  dataSource := TDataSource.Create(dataSource);

  dbgTitulos.dataSource := tituloControl.getTitulos;
  dataSource            := tituloControl.getTitulos;

  dblStatus.LookupField := 'id';
  dblStatus.LookupDisplay := 'descricao';
  dblStatus.LookupSource := tituloControl.getStatus;
  dblStatus.DisplayEmpty := ' ';
end;

end.
