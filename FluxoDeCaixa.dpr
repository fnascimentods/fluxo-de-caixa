program FluxoDeCaixa;

uses
  Vcl.Forms,
  ufrmTitulos in 'forms\ufrmTitulos.pas' {frmTitulos},
  uDM in 'forms\uDM.pas' {dm: TDataModule},
  uTitulosDAO in 'dao\uTitulosDAO.pas',
  uTitulos in 'classes\uTitulos.pas',
  uTitulosControl in 'controls\uTitulosControl.pas',
  Utils in 'classes\Utils.pas',
  ufrmCadastroTitulos in 'forms\ufrmCadastroTitulos.pas' {frmCadastroTitulos},
  ufrmImprimir in 'forms\ufrmImprimir.pas' {frmImprimir};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fluxo de Caixa';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmTitulos, frmTitulos);
  Application.Run;
end.
