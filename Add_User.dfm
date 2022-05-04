object frmAddUser: TfrmAddUser
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Add New User'
  ClientHeight = 308
  ClientWidth = 406
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 406
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '    Add New User'
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
    TabOrder = 0
    object chkClose: TCheckBox
      Left = 282
      Top = 5
      Width = 111
      Height = 17
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Add Multipe Users'
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
  object pnlBase: TPanel
    Left = 0
    Top = 261
    Width = 406
    Height = 47
    Align = alBottom
    TabOrder = 1
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
    TabOrder = 2
    object lbledtGrade: TLabeledEdit
      Left = 16
      Top = 69
      Width = 161
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Grade:'
      TabOrder = 2
    end
    object lbledtClass: TLabeledEdit
      Left = 208
      Top = 69
      Width = 177
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Class:'
      TabOrder = 3
    end
    object lbledtSurname: TLabeledEdit
      Left = 208
      Top = 26
      Width = 177
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Surname:'
      TabOrder = 1
    end
    object lbledtName: TLabeledEdit
      Left = 16
      Top = 26
      Width = 161
      Height = 21
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'Name:'
      TabOrder = 0
    end
    object lbledtUserID: TLabeledEdit
      Left = 16
      Top = 114
      Width = 161
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'UserID:'
      NumbersOnly = True
      TabOrder = 4
    end
  end
end
