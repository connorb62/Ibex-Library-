unit Issue_Book;
{                     **** ISSUE BOOK FORM ****
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
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.DBCtrls;

type
  TfrmIssue = class(TForm)
    pnlTop: TPanel;
    tlbrMain1: TToolBar;
    tlbtnClose: TToolButton;
    pgcMain: TPageControl;
    tbsBook: TTabSheet;
    tbsUser: TTabSheet;
    tlbtnSep1: TToolButton;
    tlbtnSelect: TToolButton;
    tlbtnSelectUser: TToolButton;
    tlbtnNext: TToolButton;
    tlbtnBack: TToolButton;
    tlbtnSep2: TToolButton;
    tlbtnSep3: TToolButton;
    tlbtnIssue: TToolButton;
    grpOverview: TGroupBox;
    dbgrdBook: TDBGrid;
    dbgrdUser: TDBGrid;
    redMain: TRichEdit;
    chkIssueMulti: TCheckBox;
    procedure tlbtnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgrdBookCellClick(Column: TColumn);
    procedure dbgrdUserCellClick(Column: TColumn);
    procedure tlbtnSelectClick(Sender: TObject);
    procedure tlbtnSelectUserClick(Sender: TObject);
    procedure tlbtnIssueClick(Sender: TObject);
    procedure tlbtnBackClick(Sender: TObject);
    procedure tlbtnNextClick(Sender: TObject);
    procedure dbgrdBookKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdUserKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIssue: TfrmIssue;
  sBookName, sStudentName, sStudentSurname, sStudentFull : string;

implementation

uses
  Main_Unit;

{$R *.dfm}

procedure TfrmIssue.dbgrdBookCellClick(Column: TColumn);
begin
  // Store Selected Book Information
  sBookName := frmMain.adtblMain['Title'];
  tlbtnSelect.Enabled := True;
end;

procedure TfrmIssue.dbgrdBookKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Store Selected Book Information
  sBookName := frmMain.adtblMain['Title'];
  tlbtnSelect.Enabled := True;
end;

procedure TfrmIssue.dbgrdUserCellClick(Column: TColumn);
begin
  // Store User Information from Selected
  sStudentName := frmMain.adtblUser['Name'];
  sStudentSurname := frmMain.adtblUser['Surname'];
  sStudentFull := sStudentName + ' ' + sStudentSurname;
end;

procedure TfrmIssue.dbgrdUserKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Store User Information from Selected
  sStudentName := frmMain.adtblUser['Name'];
  sStudentSurname := frmMain.adtblUser['Surname'];
  sStudentFull := sStudentName + ' ' + sStudentSurname;
end;

procedure TfrmIssue.FormActivate(Sender: TObject);
var
  I : Integer;
begin
  // Initialise
  sBookName := '';
  sStudentFull := '';
  sStudentName := '';
  sStudentSurname := '';
end;

procedure TfrmIssue.tlbtnBackClick(Sender: TObject);
begin
  // Back Button
  if tbsBook.Showing = True then
    begin
      Beep
    end
  else
  if tbsUser.Showing = True then
    begin
      tbsBook.Show;
    end;
end;

procedure TfrmIssue.tlbtnCloseClick(Sender: TObject);
begin
  // Close Form
  frmIssue.Close;
end;

procedure TfrmIssue.tlbtnIssueClick(Sender: TObject);   // Issue OnClick
begin
  // Modify Database and Issue Book
  if frmMain.adtblMain.Locate('Title', sBookName, []) = True then
    begin
      // Edit
      frmMain.adtblMain.Edit;
      frmMain.adtblUser.Edit;

      frmMain.adtblMain['Last User'] := sStudentFull;
      frmMain.adtblMain['In/Out'] := 'OUT';

      // Add User usage history for a book
      if frmMain.adtblMain['Usage History'] = 'N/A' then
        begin
          frmMain.adtblMain['Usage History'] := sStudentFull;
        end
      else
        begin
          frmMain.adtblMain['Usage History'] :=
          frmMain.adtblMain['Usage History'] + ',' + sStudentFull;
        end;


      // Add Book usage history for a user
      if (frmMain.adtblUser['Usage History'] = '')  or
      (frmMain.adtblUser['Usage History'] = 'N/A') then
        begin
          frmMain.adtblUser['Usage History'] := sBookName;
        end
      else
        begin
          frmMain.adtblUser['Usage History'] :=
          frmMain.adtblUser['Usage History'] + ',' + sBookName;
        end;

      // Post
      frmMain.adtblUser.Post;
      frmMain.adtblMain.Post;
    end;
   if chkIssueMulti.Checked = True then
    begin
      sStudentName := '';
      sStudentFull := '';
      sStudentSurname := '';
      sBookName := '';
      tlbtnSelectUser.Enabled := False;
      tlbtnSelect.Enabled := False;
      tbsBook.Show;
    end
   else
    begin
      sStudentName := '';
      sStudentFull := '';
      sStudentSurname := '';
      sBookName := '';
      tlbtnSelectUser.Enabled := False;
      tlbtnSelect.Enabled := False;
      tbsBook.Show;
      frmIssue.Close;
    end;

  // Initialise Variables
  sStudentName := '';
  sStudentSurname := '';
  sStudentFull := '';
  sBookName := '';
end;

procedure TfrmIssue.tlbtnNextClick(Sender: TObject);
begin
  // Next Button
  if tbsUser.Showing = True then
    begin
      Beep;
    end
  else
  if tbsBook.Showing = True then
    begin
      tbsUser.Show;
    end;
end;

procedure TfrmIssue.tlbtnSelectClick(Sender: TObject);
begin
  // Confirm Selection
  redMain.Lines.Clear;
  redMain.Lines.Add('Book Title: ' + sBookName);
  tlbtnSelectUser.Enabled := True;
  tbsUser.Show;
  tlbtnSelect.Enabled := False;
end;

procedure TfrmIssue.tlbtnSelectUserClick(Sender: TObject);
begin
  // Confirm User
  redMain.Lines.Add(#13 + 'Student Information: ');
  redMain.Lines.Add('Name: ' + sStudentName);
  redMain.Lines.Add('Surname: ' + sStudentSurname);
  tlbtnIssue.Enabled := True;
  tlbtnSelectUser.Enabled := False;
end;

end.
