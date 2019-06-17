object Bgzltj_form: TBgzltj_form
  Left = 336
  Top = 156
  BorderStyle = bsSingle
  Caption = #21333#35777#36164#26009#32479#35745'('#26410#36864')'
  ClientHeight = 430
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel4: TPanel
    Left = 0
    Top = 88
    Width = 759
    Height = 342
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object MainSBar: TStatusBar
      Left = 1
      Top = 319
      Width = 757
      Height = 22
      Panels = <
        item
          Width = 92
        end
        item
          Width = 50
        end
        item
          Width = 200
        end
        item
          Width = 50
        end>
      SimplePanel = False
    end
    object PBar: TProgressBar
      Left = 376
      Top = 304
      Width = 97
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
    end
    object DBGrid1: TDBGridEh
      Left = 1
      Top = 1
      Width = 757
      Height = 318
      Align = alClient
      DataSource = tjd
      FooterColor = clLime
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      RowHeight = 16
      RowSizingAllowed = True
      TabOrder = 2
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      UseMultiTitle = True
      OnGetFooterParams = DBGrid1GetFooterParams
      OnTitleBtnClick = DBGrid1TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ktype'
          Footers = <>
          Title.Caption = #20986#36816#26041#24335
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'kwtr'
          Footers = <>
          Title.Caption = #22996#25176#20154
          Title.TitleButton = True
          Width = 210
        end
        item
          EditButtons = <>
          FieldName = 'kwjlx'
          Footers = <>
          Title.Caption = #25991#20214#31867#22411
          Title.TitleButton = True
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'kzps'
          Footers = <>
          Title.Caption = #24635#31080#25968
          Title.TitleButton = True
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'kwt'
          Footers = <>
          Title.Caption = #26410
          Title.TitleButton = True
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'kyt'
          Footers = <>
          Title.Caption = #24050
          Title.TitleButton = True
          Width = 68
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 88
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 15
      Width = 48
      Height = 12
      Caption = #24320#22987#26085#26399
    end
    object Label2: TLabel
      Left = 185
      Top = 15
      Width = 12
      Height = 12
      Caption = #21040
    end
    object Label4: TLabel
      Left = 11
      Top = 39
      Width = 54
      Height = 12
      Caption = #33337#21517'/'#33322#27425
    end
    object Label5: TLabel
      Left = 308
      Top = 38
      Width = 48
      Height = 12
      Caption = #25991#20214#31867#22411
    end
    object Label3: TLabel
      Left = 24
      Top = 66
      Width = 36
      Height = 12
      Caption = #22996#25176#20154
    end
    object Label6: TLabel
      Left = 492
      Top = 38
      Width = 48
      Height = 12
      Caption = #20986#36816#26041#24335
    end
    object Mksrq: TDateEdit
      Left = 73
      Top = 11
      Width = 104
      Height = 18
      NumGlyphs = 2
      TabOrder = 0
      OnKeyDown = MksrqKeyDown
    end
    object MJsrq: TDateEdit
      Left = 204
      Top = 11
      Width = 101
      Height = 18
      NumGlyphs = 2
      TabOrder = 1
      OnKeyDown = MJsrqKeyDown
    end
    object Mvoy: TEdit
      Left = 239
      Top = 34
      Width = 66
      Height = 20
      TabOrder = 3
      OnKeyDown = MvoyKeyDown
    end
    object Mwjlx: TComboBox
      Left = 363
      Top = 35
      Width = 123
      Height = 20
      ItemHeight = 12
      TabOrder = 4
      Items.Strings = (
        #28023#36816#21333#35777
        #31354#36816#21333#35777
        #36130#21153#24080#21333
        #36890#30693#21333
        #27491#26412#25552#21333
        #26680#38144#21333
        #22686#20540#31246#21457#31080
        #36864#31246#32852
        #21830#26816#21333
        #25163#20876
        #25253#20851#21333
        #20184#27719#32852
        #31246#21333
        #26680#38144#32852)
    end
    object Nwj: TRadioGroup
      Left = 307
      Top = 54
      Width = 334
      Height = 31
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        #21462#21040
        #36865#20986
        #24402#36824
        #36864#23458)
      TabOrder = 6
    end
    object Mwtr: TComboEdit
      Left = 74
      Top = 61
      Width = 231
      Height = 21
      CharCase = ecUpperCase
      GlyphKind = gkEllipsis
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = MwtrButtonClick
      OnKeyDown = MwtrKeyDown
    end
    object MVessel: TComboEdit
      Left = 74
      Top = 34
      Width = 167
      Height = 21
      CharCase = ecUpperCase
      GlyphKind = gkEllipsis
      NumGlyphs = 1
      TabOrder = 2
      OnKeyDown = MVesselKeyDown
    end
    object MType: TComboBox
      Left = 547
      Top = 35
      Width = 95
      Height = 20
      ItemHeight = 12
      TabOrder = 7
      Items.Strings = (
        #28023#36816#20986#21475
        #28023#36816#36827#21475
        #31354#36816#20986#21475
        #31354#36816#36827#21475)
    end
    object Nrq: TRadioGroup
      Left = 307
      Top = 1
      Width = 334
      Height = 31
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #24320#33322#26085#26399
        #21040#28207#26085#26399
        #25805#20316#26085#26399)
      TabOrder = 8
    end
    object BitBtn1: TBitBtn
      Left = 656
      Top = 60
      Width = 72
      Height = 23
      Caption = #25171#21360
      TabOrder = 9
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777700000000000777707777777770707700000000000007070777777BBB77
        0007077777788877070700000000000007700777777777707070700000000007
        0700770FFFFFFFF070707770F00000F000077770FFFFFFFF077777770F00000F
        077777770FFFFFFFF07777777000000000777777777777777777}
    end
    object BitBtn2: TBitBtn
      Left = 656
      Top = 34
      Width = 71
      Height = 23
      Caption = #20851#38381
      TabOrder = 10
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770777777
        7777777700877777777777703088777777777703308887777777003330000000
        0777703330AA07777777703330AA07777777703300FA07777477703330FA0777
        4477703330FA07744444703330FF07444444703330FF0774444470330FFF0777
        44777030FFFF07777477700FFFFF077777777000000007777777}
    end
    object BitBtn3: TBitBtn
      Left = 656
      Top = 8
      Width = 71
      Height = 22
      Caption = #26597#35810
      TabOrder = 11
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
        00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
        70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
        70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
        70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
        70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
        70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
        00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
      NumGlyphs = 2
    end
  end
  object tjd: TDataSource
    Left = 154
    Top = 170
  end
  object Tj: TADODataSet
    Connection = Modal.Connection
    CommandTimeout = 60
    Parameters = <>
    Left = 48
    Top = 166
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 480
    Top = 198
    object N1: TMenuItem
      Caption = #26410#36864
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #24050#36864
      OnClick = N3Click
    end
  end
end
