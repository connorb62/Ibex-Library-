unit Help_Docs;
{                         **** HELP DOCUMENTATION ****
  This application is part of a suite of LLMS applications
  (C) 2022 Connor Bell - ALL RIGHTS RESERVED

  Development Date: 16 April 2022
  Development Location: Beukes Ave, Highway Gardens

  Contact:
    email: cbell@jeppeboys.co.za
    mobile: +27 66 202 1724
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Grids, Vcl.Outline, Vcl.JumpList, System.Sensors,
  System.Sensors.Components, Vcl.StdCtrls, Vcl.TabNotBk, Vcl.Imaging.pngimage;

type
  TfrmHelp = class(TForm)
    Panel1: TPanel;
    Outline1: TOutline;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    pgcHelp: TPageControl;
    tbsOverview: TTabSheet;
    tbsLibrary: TTabSheet;
    tbsUserManagement: TTabSheet;
    tbsDetailedAnalysis: TTabSheet;
    tbsSettings: TTabSheet;
    tlbtnClose: TToolButton;
    tlbtnSep1: TToolButton;
    tlbtnBack: TToolButton;
    tlbtnNext: TToolButton;
    tlbtnSep2: TToolButton;
    tlbtnPrint: TToolButton;
    tlbtnExport: TToolButton;
    tlbtnSep3: TToolButton;
    tlbtnSupport: TToolButton;
    scrlbx1: TScrollBox;
    imgMain: TImage;
    procedure Outline1Click(Sender: TObject);
    procedure tlbtnSupportClick(Sender: TObject);
    procedure tlbtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.dfm}

uses Main_Unit;

procedure TfrmHelp.Outline1Click(Sender: TObject);
begin
  // Item select from Outline
 if Outline1.SelectedItem = 1 then
  begin
    tbsOverview.Show;
  end
 else
 if Outline1.SelectedItem = 2 then
  begin
    tbsLibrary.Show;
  end;
end;

procedure TfrmHelp.tlbtnCloseClick(Sender: TObject);
begin
  // Close
  frmHelp.Close;
end;

procedure TfrmHelp.tlbtnSupportClick(Sender: TObject);
begin
  // Support Information Message
  MessageDlg('Contact Support' + #13 +
  'Email: cbell@jeppeboys.co.za' + #13 + 'Mobile: +27 66 202 1724' + #13 +
  'Monday - Thursday 14h30 - 18h00 (SAST)',
  mtInformation, [mbClose], 0);
end;

end.
