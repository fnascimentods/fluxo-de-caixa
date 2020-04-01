unit uParametros;

interface

type
  TParametros = class
    private
      FnomeEmpresa: string;
      FusaCCustoRec: boolean;
      FusaCCustoPag: boolean;

      procedure SetnomeEmpresa(const Value: string);
      procedure SetusaCCustoPag(const Value: boolean);
      procedure SetusaCCustoRec(const Value: boolean);

    public
      property nomeEmpresa : string read FnomeEmpresa write SetnomeEmpresa;
      property usaCCustoRec: boolean read FusaCCustoRec write SetusaCCustoRec;
      property usaCCustoPag: boolean read FusaCCustoPag write SetusaCCustoPag;
  end;
implementation

{ TParametros }



{ TParametros }

procedure TParametros.SetnomeEmpresa(const Value: string);
begin
  FnomeEmpresa := Value;
end;

procedure TParametros.SetusaCCustoPag(const Value: boolean);
begin
  FusaCCustoPag := Value;
end;

procedure TParametros.SetusaCCustoRec(const Value: boolean);
begin
  FusaCCustoRec := Value;
end;

end.
