unit Make_Report;
{                        **** MAKE REPORT FORM ****
  This application is part of a suite of LLMS applications
  (C) 2022 Connor Bell - ALL RIGHTS RESERVED

  Development Date: 17 April 2022
  Development Location: Beukes Ave, Highway Gardens

  Contact
    email: cbell@jeppeboys.co.za
    mobile: +27 66 202 1724
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TfrmReport = class(TForm)
    pnlTop: TPanel;
    tlbrMain: TToolBar;
    tlbtnClose: TToolButton;
    tlbtnSep1: TToolButton;
    tlbtnSave: TToolButton;
    redMain: TRichEdit;
    procedure tlbtnCloseClick(Sender: TObject);
    procedure tlbtnSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport: TfrmReport;


implementation

uses
  Main_Unit;

{$R *.dfm}

procedure TfrmReport.FormActivate(Sender: TObject);
begin
  // Set up rich edit
  redMain.Lines.Add('Book: ' + frmMain.edtTitle.Text);
  redMain.Lines.Add('[' + 'Report Date: ' +  DateToStr(Now) +  ']');
end;

procedure TfrmReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Close Form
  redMain.Clear;
end;

procedure TfrmReport.tlbtnCloseClick(Sender: TObject);
begin
  // Close Form
  redMain.Clear;
  frmReport.Close;
end;

procedure TfrmReport.tlbtnSaveClick(Sender: TObject);
var
  sBookName : string;
begin
  // Save To Database
  sBookName := frmMain.edtTitle.Text;
  if frmMain.adtblMain.Locate('Title', sBookName, []) = True then
    begin
       frmMain.adtblMain.Edit;
       frmMain.adtblMain['Report'] := redMain.Text;
       frmMain.adtblMain.Post;
    end;
  frmReport.Close;
end;

end.
