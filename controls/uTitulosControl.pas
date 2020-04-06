unit uTitulosControl;

interface

uses uTitulosDAO, Data.DB, Utils, uTitulos, System.SysUtils, System.Variants;

type
  TTitulosControl = class
    private
      tituloDAO: TitulosDAO;
      funcoes: TUtils;
    public
      constructor create;
      destructor destroy; override;

      procedure setNovoTitulo(editar: boolean);
      procedure excluirTitulo(id: integer);

      function getTitulos: TDataSource;
      function getTitulosByParam(descricao, statusid: string): TDataSource;
      function getStatus: TDataSource;
  end;
implementation

{ TTitulosControl }

uses ufrmCadastroTitulos, ufrmTitulos;

constructor TTitulosControl.create;
begin
  tituloDAO := TitulosDAO.Create;
end;

destructor TTitulosControl.destroy;
begin
  tituloDAO.Free;
  inherited;
end;

procedure TTitulosControl.excluirTitulo(id: integer);
begin
  if funcoes.perguntarUsuario('Deseja realmente excluir?') then
  begin
    tituloDAO.excluirTitulo(id);
    frmTitulos.dbgTitulos.DataSource.DataSet.Refresh;
    funcoes.confirmacaoUsuario('Título excluído com sucesso!');
  end;
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
  if (Trim(descricao) = '') and (statusid = '') then
    Result := tituloDAO.getTitulos
  else
    Result := tituloDAO.getTitulosByParam(descricao, statusid);
end;

procedure TTitulosControl.setNovoTitulo(editar: boolean);
var
  titulo: TTitulos;
begin
  try
    titulo := TTitulos.create;

    with frmCadastroTitulos do
    begin
      if Trim(edtDescricao.Text) = '' then
        raise Exception.Create('O campo ''Descriçao do Título'' é obrigatório!');

      if cedValor.Value <= 0 then
        raise Exception.Create('O campo ''Valor'' é obrigatório!');

      if DateToStr(dtpDataVencimento.Date) < DateToStr(Date) then
        raise Exception.Create('A data de vencimento não pode ser inferior à data atual!');

      if Trim(dblStatus.Text) = '' then
        raise Exception.Create('O campo ''Status'' é obrigatório!');

      titulo.ID             := tituloID;
      titulo.descricao      := edtDescricao.Text;
      titulo.valor          := cedValor.Value;
      titulo.datalancamento := StrToDate(FormatDateTime('dd/mm/yyyy', Date));
      titulo.datavencimento := dtpDataVencimento.Date;
      titulo.statusid       := StrToInt(dblStatus.Value);
      titulo.observacoes    := mmObservacoes.Lines.Text;

      Clear;
    end;

    if editar then
    begin
      tituloDAO.editarTitulo(titulo);

      funcoes.confirmacaoUsuario('Título alterado com sucesso!');
    end
    else
    begin
      tituloDAO.setNovoTitulo(titulo);

      funcoes.confirmacaoUsuario('Título cadastrado com sucesso!');
    end;

    titulo.Free;
  except
    on e: Exception do
      funcoes.alertarUsuario(e.Message);
  end;
end;

end.
