program FluxoDeCaixa;

uses
  Vcl.Forms,
  ufrmMenu in 'forms\ufrmMenu.pas' {frmMenu},
  ufrmTitulos in 'forms\ufrmTitulos.pas' {frmTitulos},
  uDM in 'forms\uDM.pas' {dm: TDataModule},
  uTitulosDAO in 'dao\uTitulosDAO.pas',
  uTitulos in 'classes\uTitulos.pas',
  uTitulosControl in 'controls\uTitulosControl.pas',
  Utils in 'classes\Utils.pas',
  ufrmCadastroTitulos in 'forms\ufrmCadastroTitulos.pas' {frmCadastroTitulos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fluxo de Caixa';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmCadastroTitulos, frmCadastroTitulos);
  Application.Run;
end.
