unit Utils;

interface

uses Vcl.Forms, Winapi.Windows;

type
  TUtils = class
    private

    public
      constructor create;
      destructor destroy; override;

      procedure notificarUsuario(titulo, mensagem: string);
  end;
implementation

{ TUtils }

constructor TUtils.create;
begin

end;

destructor TUtils.destroy;
begin

  inherited;
end;

procedure TUtils.notificarUsuario(titulo, mensagem: string);
begin
  Application.MessageBox(PChar(mensagem), '', MB_ICONEXCLAMATION + MB_OK);
end;

end.
