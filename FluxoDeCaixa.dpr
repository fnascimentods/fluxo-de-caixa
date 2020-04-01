program FluxoDeCaixa;

uses
  Vcl.Forms,
  ufrmMenu in 'forms\ufrmMenu.pas' {frmMenu},
  ufrmParametros in 'forms\ufrmParametros.pas' {frmParametros},
  ufrmPessoas in 'forms\ufrmPessoas.pas' {frmPessoas},
  ufrmTitulos in 'forms\ufrmTitulos.pas' {frmTitulos},
  uDM in 'forms\uDM.pas' {dm: TDataModule},
  uParametrosDAO in 'dao\uParametrosDAO.pas',
  uParametros in 'classes\uParametros.pas',
  uParametrosControl in 'controls\uParametrosControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fluxo de Caixa';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
