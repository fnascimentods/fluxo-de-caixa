unit ufrmImprimir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.StdCtrls;

type
  TfrmImprimir = class(TForm)
    RLReport: TRLReport;
    Header: TRLBand;
    drawHeader: TRLDraw;
    lblTitulo: TRLLabel;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLBand1: TRLBand;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    RLBand2: TRLBand;
    dbtID: TRLDBText;
    dbtDescricao: TRLDBText;
    dbtValor: TRLDBText;
    dbtStatus: TRLDBText;
    dbtVencimento: TRLDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimir: TfrmImprimir;

implementation

{$R *.dfm}

uses ufrmTitulos;

procedure TfrmImprimir.FormCreate(Sender: TObject);
begin
  with frmTitulos do
  begin
    RLReport.DataSource      := dataSource;
    dbtID.DataSource         := dataSource;
    dbtDescricao.DataSource  := dataSource;
    dbtValor.DataSource      := dataSource;
    dbtStatus.DataSource     := dataSource;
    dbtVencimento.DataSource := dataSource;
  end;
end;

end.
