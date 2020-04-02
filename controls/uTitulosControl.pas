unit uTitulosControl;

interface

uses uTitulosDAO, Data.DB, Utils;

type
  TTitulosControl = class
    private
      tituloDAO: TitulosDAO;
    public
      constructor create;
      destructor destroy; override;

      function getTitulos: TDataSource;
      function getTitulosByParam(descricao, statusid: string): TDataSource;
      function getStatus: TDataSource;
  end;
implementation

{ TTitulosControl }

constructor TTitulosControl.create;
begin
  tituloDAO := TitulosDAO.Create;
end;

destructor TTitulosControl.destroy;
begin
  tituloDAO.Free;
  inherited;
end;

function TTitulosControl.getStatus: TDataSource;
begin
  Result := tituloDAO.getStatus;
end;

function TTitulosControl.getTitulos: TDataSource;
begin
  Result := tituloDAO.getTitulos;
end;

function TTitulosControl.getTitulosByParam(descricao, statusid: string): TDataSource;
begin
  Result := tituloDAO.getTitulosByParam(descricao, statusid);
end;

end.
