unit uParametrosControl;

interface

uses uParametros, uParametrosDAO, Data.DB;

type
  TParametrosControl = class
    private
      ParametrosDAO: TParametrosDAO;
    public
      constructor create;
      destructor destroy; override;

      function getParametros: TDataSource;
  end;
implementation

{ TParametrosControl }

constructor TParametrosControl.create;
begin
  ParametrosDAO := TParametrosDAO.create;
end;

destructor TParametrosControl.destroy;
begin
  ParametrosDAO.Free;
  inherited;
end;

function TParametrosControl.getParametros: TDataSource;
begin
  Result := ParametrosDAO.getParâmetros;
end;

end.
