unit Utils;

interface

uses Vcl.Forms, Winapi.Windows;

type
  TUtils = class
    private

    public
      constructor create;
      destructor destroy; override;

      procedure alertarUsuario(mensagem: string);
      procedure confirmacaoUsuario(mensagem: string);

      function perguntarUsuario(mensagem: string): boolean;
  end;
implementation

{ TUtils }

procedure TUtils.confirmacaoUsuario(mensagem: string);
begin
  Application.MessageBox(PChar(mensagem), 'Sucesso', MB_ICONINFORMATION + MB_OK);
end;

constructor TUtils.create;
begin

end;

destructor TUtils.destroy;
begin

  inherited;
end;

function TUtils.perguntarUsuario(mensagem: string): boolean;
begin
  Result := Application.MessageBox(PChar(mensagem), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
end;

procedure TUtils.alertarUsuario(mensagem: string);
begin
  Application.MessageBox(PChar(mensagem), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
end;

end.
