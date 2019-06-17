object Dcxh_Form: TDcxh_Form
  Left = 350
  Top = 216
  Width = 790
  Height = 488
  Caption = #35746#33329#31665#21495#28165#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 67
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label3: TLabel
      Left = 7
      Top = 14
      Width = 60
      Height = 12
      Caption = #24320#33322#26085#26399#65306
    end
    object Label4: TLabel
      Left = 189
      Top = 11
      Width = 24
      Height = 12
      Caption = #33267#65306
    end
    object Label1: TLabel
      Left = 9
      Top = 44
      Width = 48
      Height = 12
      Caption = #33337#21517#33322#27425
    end
    object Mksrq: TDateEdit
      Left = 64
      Top = 7
      Width = 121
      Height = 21
      ClickKey = 116
      NumGlyphs = 2
      TabOrder = 0
    end
    object Mjsrq: TDateEdit
      Left = 215
      Top = 7
      Width = 124
      Height = 21
      ClickKey = 116
      NumGlyphs = 2
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 344
      Top = 6
      Width = 65
      Height = 24
      Caption = #25191#34892
      Default = True
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 416
      Top = 5
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 527
      Top = 5
      Width = 66
      Height = 25
      Caption = #25171#21360
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object RadioGroup1: TRadioGroup
      Left = 248
      Top = 33
      Width = 332
      Height = 29
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #20840#37096
        #19981#21253#25324#26032#37492#30495#33487#24030#21495
        #26032#37492#30495#33487#24030#21495)
      TabOrder = 5
      Visible = False
    end
    object MVessel: TComboEdit
      Left = 65
      Top = 40
      Width = 122
      Height = 21
      CharCase = ecUpperCase
      ClickKey = 116
      Ctl3D = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      OnButtonClick = MVesselButtonClick
    end
    object MVoy: TEdit
      Left = 188
      Top = 39
      Width = 55
      Height = 20
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 7
    end
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 67
    Width = 782
    Height = 394
    Align = alClient
    DataSource = dxqdd
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 3
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    RowSizingAllowed = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleBtnClick = DBGrid1TitleBtnClick
    Columns = <
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'kvessel'
        Footers = <>
        Title.Caption = #33337#21517#33322#27425
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'klx'
        Footers = <>
        Title.Caption = #31867#22411
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'kxh'
        Footers = <>
        Title.Caption = #31665#21495
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'kmbl'
        Footers = <>
        Title.Caption = #25552#21333#21495
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'kxl'
        Footers = <>
        Title.Caption = #31665#37327
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'kywuser'
        Footers = <>
        Title.Caption = #19994#21153#21592
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'kfw_bg'
        Footers = <>
        Title.Caption = #25253#20851
        Width = 24
      end
      item
        EditButtons = <>
        FieldName = 'kfw_ck'
        Footers = <>
        Title.Caption = #20179#24211
        Width = 26
      end
      item
        EditButtons = <>
        FieldName = 'kfw_ys'
        Footers = <>
        Title.Caption = #36710#38431
        Width = 23
      end
      item
        EditButtons = <>
        FieldName = 'kmdg'
        Footers = <>
        Title.Caption = #30446#30340#28207
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'kwtr'
        Footers = <>
        Title.Caption = #22996#25176#20154
        Width = 70
      end>
  end
  object mxh: TMemo
    Left = 312
    Top = 312
    Width = 185
    Height = 89
    TabOrder = 2
    Visible = False
    WordWrap = False
  end
  object dxqdd: TDataSource
    Left = 96
    Top = 104
  end
  object dxqd: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'klx'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'kjobno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'kwtr'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kmbl'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'khbl'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'kwtno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'khwmc'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'kzzg'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'kmdg'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'keta'
        DataType = ftDateTime
      end
      item
        Name = 'kxx1'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ksl1'
        DataType = ftInteger
      end
      item
        Name = 'kxx2'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ksl2'
        DataType = ftInteger
      end
      item
        Name = 'kxx3'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ksl3'
        DataType = ftInteger
      end
      item
        Name = 'kdlr'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kyyr'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kjs'
        DataType = ftInteger
      end
      item
        Name = 'kbzdw'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'klf'
        DataType = ftFloat
      end
      item
        Name = 'kzl'
        DataType = ftFloat
      end
      item
        Name = 'ktg'
        DataType = ftBoolean
      end
      item
        Name = 'kzp'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '3.07'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 32
    Top = 120
    object dxqdklx: TStringField
      FieldName = 'klx'
      Size = 6
    end
    object dxqdkjobno: TStringField
      FieldName = 'kjobno'
    end
    object dxqdkwtr: TStringField
      FieldName = 'kwtr'
      Size = 100
    end
    object dxqdkmbl: TStringField
      FieldName = 'kmbl'
      Size = 400
    end
    object dxqdkmdg: TStringField
      FieldName = 'kmdg'
      Size = 40
    end
    object dxqdketa: TDateTimeField
      FieldName = 'keta'
    end
    object dxqdkyyr: TStringField
      FieldName = 'kyyr'
      Size = 100
    end
    object dxqdkxh: TStringField
      FieldName = 'kxh'
      Size = 500
    end
    object dxqdkvessel: TStringField
      FieldName = 'kvessel'
      Size = 50
    end
    object dxqdkvoy: TStringField
      FieldName = 'kvoy'
    end
    object dxqdkywuser: TStringField
      FieldName = 'kywuser'
    end
    object dxqdkxx: TStringField
      FieldName = 'kxx'
      Size = 4
    end
    object dxqdkfw_ck: TBooleanField
      FieldName = 'kfw_ck'
    end
    object dxqdkdlr: TStringField
      FieldName = 'kdlr'
      Size = 100
    end
    object dxqdkfw_ys: TBooleanField
      FieldName = 'kfw_ys'
    end
    object dxqdkfw_bg: TBooleanField
      FieldName = 'kfw_bg'
    end
    object dxqdkxl: TStringField
      FieldName = 'kxl'
      Size = 100
    end
  end
  object t: TADODataSet
    Connection = Modal.Connection
    Parameters = <>
    Left = 288
    Top = 96
  end
end
