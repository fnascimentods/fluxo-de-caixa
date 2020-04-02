object frmCadastroTitulos: TfrmCadastroTitulos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de T'#237'tulos'
  ClientHeight = 383
  ClientWidth = 431
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 431
    Height = 75
    ButtonHeight = 75
    ButtonWidth = 75
    Caption = 'ToolBar'
    GradientEndColor = clWindow
    GradientStartColor = 15676814
    ParentColor = False
    TabOrder = 0
    ExplicitLeft = -270
    ExplicitWidth = 794
    object btnSalvar: TToolButton
      Left = 0
      Top = 0
      Caption = 'btnSalvar'
      ImageIndex = 3
    end
    object ToolButton4: TToolButton
      Left = 75
      Top = 0
      Width = 15
      Caption = 'ToolButton4'
      ImageIndex = 5
      Style = tbsSeparator
      Visible = False
    end
    object btnCancelar: TToolButton
      Left = 90
      Top = 0
      Caption = 'btnCancelar'
      ImageIndex = 4
    end
  end
  object gbxCadastro: TGroupBox
    Left = 0
    Top = 75
    Width = 431
    Height = 233
    Align = alClient
    BiDiMode = bdRightToLeft
    Caption = 'Informa'#231#245'es do T'#237'tulo'
    ParentBiDiMode = False
    TabOrder = 1
    ExplicitWidth = 524
    ExplicitHeight = 183
    object Label1: TLabel
      Left = 20
      Top = 20
      Width = 90
      Height = 13
      Caption = 'Descri'#231#227'o do T'#237'tulo'
    end
    object Label2: TLabel
      Left = 20
      Top = 75
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel
      Left = 307
      Top = 20
      Width = 96
      Height = 13
      Caption = 'Data de Vencimento'
    end
    object Label4: TLabel
      Left = 125
      Top = 75
      Width = 31
      Height = 13
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Status'
      ParentBiDiMode = False
    end
    object Label5: TLabel
      Left = 20
      Top = 130
      Width = 63
      Height = 13
      Caption = 'Observa'#231#245'es'
    end
    object edtDescricao: TEdit
      Left = 20
      Top = 35
      Width = 250
      Height = 21
      TabOrder = 0
    end
    object cedValor: TCurrencyEdit
      Left = 20
      Top = 90
      Width = 80
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 1
    end
    object dtpDataVencimento: TDateTimePicker
      Left = 307
      Top = 35
      Width = 100
      Height = 21
      Date = 43923.000000000000000000
      MaxDate = 401404.999988425900000000
      MinDate = 18264.000000000000000000
      TabOrder = 2
    end
    object dblStatus: TRxDBLookupCombo
      Left = 125
      Top = 90
      Width = 145
      Height = 21
      DropDownCount = 8
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 3
    end
    object mmObservacoes: TMemo
      Left = 20
      Top = 145
      Width = 250
      Height = 65
      Lines.Strings = (
        '')
      TabOrder = 4
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 308
    Width = 431
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 333
    ExplicitWidth = 524
  end
end
