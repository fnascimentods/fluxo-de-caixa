object frmImprimir: TfrmImprimir
  Left = 0
  Top = 0
  Caption = 'Imprimir'
  ClientHeight = 483
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Header: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 115
      BandType = btHeader
      object drawHeader: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 115
        Align = faClient
      end
      object lblTitulo: TRLLabel
        Left = 20
        Top = 20
        Width = 201
        Height = 24
        Caption = 'Relat'#243'rio de T'#237'tulos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 641
        Top = 20
        Width = 33
        Height = 16
        Caption = 'P'#225'g:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 676
        Top = 21
        Width = 33
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 20
        Top = 50
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 641
        Top = 50
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 153
      Width = 718
      Height = 48
      BandType = btColumnHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object Label1: TLabel
        Left = 20
        Top = 20
        Width = 45
        Height = 16
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 99
        Top = 20
        Width = 36
        Height = 16
        Caption = 'T'#237'tulo'
      end
      object Label3: TLabel
        Left = 374
        Top = 20
        Width = 33
        Height = 16
        Caption = 'Valor'
      end
      object Label4: TLabel
        Left = 483
        Top = 20
        Width = 39
        Height = 16
        Caption = 'Status'
      end
      object Label6: TLabel
        Left = 605
        Top = 20
        Width = 75
        Height = 16
        Caption = 'Vencimento'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 56
      object dbtID: TRLDBText
        Left = 20
        Top = 20
        Width = 14
        Height = 16
        DataField = 'id'
        Text = ''
        Transparent = False
      end
      object dbtDescricao: TRLDBText
        Left = 99
        Top = 20
        Width = 60
        Height = 16
        DataField = 'descricao'
        Text = ''
        Transparent = False
      end
      object dbtValor: TRLDBText
        Left = 374
        Top = 20
        Width = 30
        Height = 16
        DataField = 'valor'
        Text = ''
        Transparent = False
      end
      object dbtStatus: TRLDBText
        Left = 483
        Top = 20
        Width = 40
        Height = 16
        DataField = 'status'
        Text = ''
        Transparent = False
      end
      object dbtVencimento: TRLDBText
        Left = 605
        Top = 20
        Width = 94
        Height = 16
        DataField = 'datavencimento'
        Text = ''
        Transparent = False
      end
    end
  end
end
