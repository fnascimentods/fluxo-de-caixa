object frmTitulos: TfrmTitulos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'T'#237'tulos'
  ClientHeight = 512
  ClientWidth = 794
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 794
    Height = 75
    ButtonHeight = 75
    ButtonWidth = 75
    Caption = 'ToolBar'
    GradientEndColor = clWindow
    GradientStartColor = 15676814
    ParentColor = False
    TabOrder = 0
    object btnNovo: TToolButton
      Left = 0
      Top = 0
      Caption = 'btnNovo'
      ImageIndex = 0
      OnClick = btnNovoClick
    end
    object ToolButton1: TToolButton
      Left = 75
      Top = 0
      Width = 15
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsSeparator
      Visible = False
    end
    object btnEditar: TToolButton
      Left = 90
      Top = 0
      Caption = 'btnEditar'
      ImageIndex = 1
    end
    object ToolButton2: TToolButton
      Left = 165
      Top = 0
      Width = 15
      Caption = 'ToolButton2'
      ImageIndex = 5
      Style = tbsSeparator
      Visible = False
    end
    object btnDeletar: TToolButton
      Left = 180
      Top = 0
      Caption = 'btnDeletar'
      ImageIndex = 3
    end
    object ToolButton4: TToolButton
      Left = 255
      Top = 0
      Width = 15
      Caption = 'ToolButton4'
      ImageIndex = 5
      Style = tbsSeparator
      Visible = False
    end
    object btnPesquisar: TToolButton
      Left = 270
      Top = 0
      Caption = 'btnPesquisar'
      ImageIndex = 4
      OnClick = btnPesquisarClick
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 75
    Width = 794
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object gbxFiltros: TGroupBox
      Left = 0
      Top = 0
      Width = 794
      Height = 75
      Align = alClient
      BiDiMode = bdRightToLeft
      Caption = 'Filtros de Busca'
      ParentBiDiMode = False
      TabOrder = 0
      object Label1: TLabel
        Left = 20
        Top = 20
        Width = 46
        Height = 13
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Descri'#231#227'o'
        ParentBiDiMode = False
      end
      object Label2: TLabel
        Left = 313
        Top = 20
        Width = 31
        Height = 13
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Status'
        ParentBiDiMode = False
      end
      object edtDescricao: TEdit
        Left = 20
        Top = 35
        Width = 250
        Height = 21
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 0
      end
      object dblStatus: TRxDBLookupCombo
        Left = 313
        Top = 35
        Width = 145
        Height = 21
        DropDownCount = 8
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 1
      end
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 437
    Width = 794
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 2
  end
  object dbgTitulos: TDBGrid
    Left = 0
    Top = 150
    Width = 794
    Height = 287
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'T'#237'tulo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor (R$)'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datalancamento'
        Title.Caption = 'Lan'#231'amento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datavencimento'
        Title.Caption = 'Vencimento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 85
        Visible = True
      end>
  end
end
