unit uTitulos;

interface

type
  TTitulos = class
    private
    Fstatusid: integer;
    Fvalor: double;
    Fdescricao: string;
    Fdatavencimento: Tdate;
    FID: integer;
    Fdatalancamento: Tdate;
    Fobservacoes: string;

    procedure setDatalancamento(const Value: Tdate);
    procedure setDatavencimento(const Value: Tdate);
    procedure setDescricao(const Value: string);
    procedure setID(const Value: integer);
    procedure SetObservacoes(const Value: string);
    procedure setStatusid(const Value: integer);
    procedure setValor(const Value: double);

    public
      property ID : integer read FID write setID;
      property descricao : string read Fdescricao write setDescricao;
      property valor : double read Fvalor write setValor;
      property statusid : integer read Fstatusid write setStatusid;
      property datalancamento : Tdate read Fdatalancamento write setDatalancamento;
      property datavencimento : Tdate read Fdatavencimento write setDatavencimento;
      property observacoes : string read Fobservacoes write SetObservacoes;
  end;
implementation

{ TTitulos }

procedure TTitulos.setDatalancamento(const Value: Tdate);
begin
  Fdatalancamento := Value;
end;

procedure TTitulos.setDatavencimento(const Value: Tdate);
begin
  Fdatavencimento := Value;
end;

procedure TTitulos.setDescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TTitulos.setID(const Value: integer);
begin
  FID := Value;
end;

procedure TTitulos.SetObservacoes(const Value: string);
begin
  Fobservacoes := Value;
end;

procedure TTitulos.setStatusid(const Value: integer);
begin
  Fstatusid := Value;
end;

procedure TTitulos.setValor(const Value: double);
begin
  Fvalor := Value;
end;

end.
