object frmAdd: TfrmAdd
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Add New Book'
  ClientHeight = 308
  ClientWidth = 406
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    000001002000000000000004000000000000000000000000000000000000FFFF
    FF000000001A000000180000001500000013000000100000000C000000090000
    00060000000400000001066D0099056900CC066D0099077100000E8C0000FFFF
    FF00003000BB000F00410000002A000000250000001F00000018000000120000
    000C00000007000000020C8300CC2BDF1AFF0C8300CC0D8800000E8C0000FFFF
    FF000139017201390188011E011A012101000121010001210100012101000121
    01000B6A00990E8C00CC0E8C00CC3DE22CFF0E8C00CC0E8C00CC0E8D0099FFFF
    FF00013F010C014401C7014401C7014401C7014401C7014401C7014401C60144
    01B40E8C00E952E741FF52E741FF52E741FF52E741FF52E741FF109500CCFFFF
    FF0002500200025002C5277C27FF419843FF4BA34EFF4CA44FFF4DA651FF49A1
    4DF9279F1FFC149506F6109300EC66EB55FF129D00CC129D00CC129C0099FFFF
    FF0002560200025602C23C923DFF267C27FF4BA34EFF4DA550FF4DA550FF4DA5
    50FF4DA651FF54AF5AFF1CA20EFB75EE64FF13A200D313A10000129D0000FFFF
    FF00025B0200025B02B0429943F93B903BFF378F3AFF54AF5AFF54AF5AFF54AF
    5AFF54AF5AFF54AF5AFF2FAD26FF1EA80FFB0E8E01D8025C02090A7D0100FFFF
    FF00026002000260028D3C953EED4CA04CFF409540FF439D48FF5CB863FF5CB9
    64FF5CB964FF5CB964FF5CB964FF63C36EFF238227D20261024502610200FFFF
    FF0002640200026502451C7C1DD155AC57FF52A752FF4AA04BFF4AA752FF60C0
    6BFF63C36EFF63C36EFF63C36EFF64C36EFF53B65EED0265028C02650200FFFF
    FF000268020002680208036A039A409F43E55CB35EFF5AAF5AFF58AE59FF54AF
    5AFF62C36EFF6BCD78FF6BCD78FF6BCD78FF68CD76F9036A03AE036A0300FFFF
    FF00036D0300036D0300036E031F09740AAF45A649E564BD68FF61B661FF61B6
    61FF5FB762FF65C36EFF6ED17CFF71D580FF74D983FF036E03BD036E0300FFFF
    FF00036D0300036D0300036E03000371031F03710399238D26CF52B559EB64C3
    6BF86CC974FF6DCA75FF6FCF7AFF74D883FF77DD88FF037103BE03710300FFFF
    FF00036D0300036D0300036E0300037103000373030803750344037503890375
    03AB037503BC037503BD037503BD037503BD037503BD037503BD03750300FFFF
    FF00036D0300036D0300036E0300037103000373030003750300037503000375
    030003750300037503000375030003750300037503000376034703760300FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008003
    0000800300008F80000080000000C0000000C0030000C0010000C0010000C001
    0000C0010000E0010000F0010000F8010000FFFD0000FFFF0000FFFF0000}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBase: TPanel
    Left = 0
    Top = 261
    Width = 406
    Height = 47
    Align = alBottom
    TabOrder = 0
    object btnAdd: TButton
      Left = 208
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnCancel: TButton
      Left = 310
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object grpMain: TGroupBox
    Left = 0
    Top = 25
    Width = 406
    Height = 236
    Align = alClient
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object lblImage: TLabel
      Left = 208
      Top = 139
      Width = 61
      Height = 13
      Caption = 'JPEG Image:'
    end
    object lblCopyCount: TLabel
      Left = 16
      Top = 183
      Width = 89
      Height = 13
      Caption = 'Number of Copies:'
    end
    object lbledtAuthor: TLabeledEdit
      Left = 16
      Top = 69
      Width = 161
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Author'
      TabOrder = 1
    end
    object lbledtCat: TLabeledEdit
      Left = 208
      Top = 69
      Width = 177
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Category:'
      TabOrder = 5
    end
    object lbledtGenre: TLabeledEdit
      Left = 208
      Top = 112
      Width = 177
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Genre:'
      TabOrder = 6
    end
    object lbledtISBN: TLabeledEdit
      Left = 208
      Top = 26
      Width = 177
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'ISBN:'
      TabOrder = 4
    end
    object lbledtPubDate: TLabeledEdit
      Left = 16
      Top = 112
      Width = 161
      Height = 21
      EditLabel.Width = 94
      EditLabel.Height = 13
      EditLabel.Caption = 'Date of Publication:'
      TabOrder = 2
    end
    object lbledtTitle: TLabeledEdit
      Left = 16
      Top = 26
      Width = 161
      Height = 21
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'Title'
      TabOrder = 0
    end
    object lbledtPublisher: TLabeledEdit
      Left = 16
      Top = 156
      Width = 161
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'Publisher:'
      TabOrder = 3
    end
    object FileListBox1: TFileListBox
      Left = 208
      Top = 156
      Width = 177
      Height = 45
      Mask = '*.jpg*'
      ShowGlyphs = True
      TabOrder = 7
      OnClick = FileListBox1Click
    end
    object chkImage: TCheckBox
      Left = 208
      Top = 207
      Width = 97
      Height = 17
      BiDiMode = bdLeftToRight
      Caption = 'No Image'
      ParentBiDiMode = False
      TabOrder = 8
    end
    object spnCount: TSpinEdit
      Left = 16
      Top = 202
      Width = 161
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 9
      Value = 1
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 406
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '    Add New Book'
    Color = clScrollBar
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object chkClose: TCheckBox
      Left = 282
      Top = 5
      Width = 111
      Height = 17
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Add Multiple Books'
      Color = clNone
      Ctl3D = True
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentColor = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
  end
end
