unit New_Settings;
{                         **** SETTINGS ****
(C) 2022 Connor Bell - ALL RIGHTS RESERVED
This application is part of the LLMS suite of applications

Development Date: 15 April 2022
Development Location: Beukes Ave, Highway Gardens

Contact
  email: cbell@jeppeboys.co.za
  mobile: +27 66 202 1724
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ToolWin, pngimage, Vcl.Themes, System.DateUtils;

type
  TfrmSettings = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    tlbtnApply: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Label1: TLabel;
    PageControl1: TPageControl;
    tbsGeneral: TTabSheet;
    RadioGroup2: TRadioGroup;
    tbsLook: TTabSheet;
    grpTheme: TGroupBox;
    cbbThemes: TComboBox;
    btnRestoreD: TButton;
    tbsDatabase: TTabSheet;
    tbsActivation: TTabSheet;
    Activation: TGroupBox;
    redActStat: TRichEdit;
    GroupBox1: TGroupBox;
    imgStat: TImage;
    Label2: TLabel;
    edtSerial: TLabeledEdit;
    GroupBox2: TGroupBox;
    redProdDetails: TRichEdit;
    Button1: TButton;
    btnAct: TButton;
    Button3: TButton;
    btnRenew: TButton;
    Button5: TButton;
    grpNewConnection: TGroupBox;
    btnNewConnection: TButton;
    edtLicenseFile: TEdit;
    grpUser: TGroupBox;
    btnNewUserD: TButton;
    grpUpdateDateTime: TGroupBox;
    btnUpdate: TButton;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure cbbThemesChange(Sender: TObject);
    procedure tlbtnApplyClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure btnRestoreDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewConnectionClick(Sender: TObject);
    procedure btnNewUserDClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;
  txtFile : TextFile;
  sLine : string;
  iPos : Integer;
  // Activation Variables
  sProductType, sKey, sContact, sEmail, sStatus, sDOL, sDateStart, sDateEnd : string;
  txtLoc : TextFile;
  DateStart, DateEnd, Days : TDate;
  sLine1 : string;

implementation

{$R *.dfm}

uses Main_Unit, New_Connection, FirstHelp;

procedure TfrmSettings.FormActivate(Sender: TObject);
var
  txtLoc1 : TextFile;
begin
  // Form Activate -
  // Clear RichEdits
  redActStat.Clear;
  redProdDetails.Clear;

  // Load Activation File Location
  if not FileExists('Act_File_Location.txt') then
    begin
      MessageDlg('Cannot Locate Activation File Location', mtError, [mbOK], 0);
      Application.Terminate;
    end
  else
    begin
      AssignFile(txtLoc1, 'Act_File_Location.txt');
      Reset(txtLoc1);

      while not Eof(txtLoc1) do
        begin
          Readln(txtLoc1, sLine1);
          edtLicenseFile.Text := sLine1
        end;
      CloseFile(txtLoc1);
    end;

  // Load Activation Information
  if not FileExists(edtLicenseFile.Text) then
    begin
      redActStat.Clear;
      redActStat.Font.Color := clRed;
      redActStat.Lines.Add('Unactivated Product');
      Exit;
    end
  else
    begin
      AssignFile(txtFile, edtLicenseFile.Text);
      Reset(txtFile);
      while not Eof(txtFile) do
        begin
          Readln(txtFile, sLine);
          // Product Type
          iPos := Pos('#', sLine);
          sProductType := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Product Key
          iPos := Pos('#', sLine);
          sKey := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // User Details
          iPos := Pos('#', sLine);
          sContact := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // User Email
          iPos := Pos('#', sLine);
          sEmail := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Activation Status
          iPos := Pos('#', sLine);
          sStatus := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Start Date
          iPos := Pos('#', sLine);
          sDateStart := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // End Date
          sDateEnd := sLine;
        end;
      redActStat.Lines.Add('Product Activation Status: ' + sStatus);
      redActStat.Lines.Add('Licensed To: ' + sContact + ' ' + sEmail);
      redActStat.Lines.Add('Expires: ' + sDateEnd);
      edtSerial.ReadOnly := True;
      edtSerial.Text := sKey;
      redProdDetails.Lines.Add('Leaf Library Management System Version 1' + #13 +
      'LLMS: ' + sProductType);
      imgStat.Picture.LoadFromFile('accept.png');
      DateStart := StrToDate(sDateStart);
      DateEnd := StrToDate(sDateEnd);

      // Display Remaining Days on License
      Label2.Caption := 'Days Remaining on License: ' +
      IntToStr(DaysBetween(System.DateUtils.Today, DateEnd)) + ' days';

      // Check License Days remaining
      // ************* Please Fix This ********************
      if DaysBetween(System.DateUtils.Today, DateEnd) = 0 then
        begin
          MessageDlg('License Expired' + #13 +
          'Settings > Renew - To Buy a new license', mtError, [mbOK], 0);
          btnRenew.Enabled := True;
        end;

       // Verify Serial Number
      if (edtSerial.Text = '') or (Length(edtSerial.Text) < 19) then
        begin
          imgStat.Picture.LoadFromFile('cross.png');
          redActStat.Clear;
          redActStat.Font.Color := clRed;
          redActStat.Lines.Add('Invalid Product Key');
          redActStat.Lines.Add('Unactivated Product');

          redProdDetails.Clear;
          Label2.Caption := '';
          btnAct.Enabled := True;
        end;

    end;
  CloseFile(txtFile);

end;

procedure TfrmSettings.FormCreate(Sender: TObject);
var
  txtTheme : TextFile;
  sTheme : string;
begin
  // Read from TextFile to populate setting fields
  // Theme
  if not FileExists('Theme.txt') then
    begin
      exit;  // Show Error at some point
    end
  else
    begin
      AssignFile(txtTheme, 'Theme.txt');
      Reset(txtTheme);
      while not Eof(txtTheme) do
        begin
          Readln(txtTheme, sTheme);
        end;
    end;
  CloseFile(txtTheme);
  cbbThemes.Text := sTheme;
end;

procedure TfrmSettings.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  tlbtnApply.Enabled := False;
end;

procedure TfrmSettings.tlbtnApplyClick(Sender: TObject);
var
  sTheme : string;
  bTheme : Boolean;
  txtFileTheme : TextFile;
begin
  // Apply Theme Settings
  if tbsLook.Showing = True then
    begin
      sTheme := cbbThemes.Text;
      if not bTheme then
        begin
          sTheme := 'Windows';
        end;
      TStyleManager.TrySetStyle(sTheme);

      // Write Theme Information to TextFile for future use
      AssignFile(txtFileTheme, 'Theme.txt');
      Rewrite(txtFileTheme);
      Writeln(txtFileTheme, sTheme);
      CloseFile(txtFileTheme);
    end;
  // Disable Button
  tlbtnApply.Enabled := False;
end;

procedure TfrmSettings.btnApplyClick(Sender: TObject);
var
  sTheme : string;
  bTheme : Boolean;
begin
  sTheme := cbbThemes.Text;
  if not bTheme then
    begin
      sTheme := 'Windows';
    end;
    TStyleManager.TrySetStyle(sTheme);
end;

procedure TfrmSettings.btnNewConnectionClick(Sender: TObject);
begin
  // Show New Connection Wizard
  frmNewConnection.Show;
  frmNewConnection.cbbType.Text := 'Library Connection';
end;

procedure TfrmSettings.btnNewUserDClick(Sender: TObject);
begin
  // Show Connection Form
  frmNewConnection.Show;
  frmNewConnection.cbbType.Text := 'User Connection';
end;

procedure TfrmSettings.btnRestoreDClick(Sender: TObject);
 var
  bTheme : Boolean;
  txtTheme : TextFile;
begin
  // Restore Default Theme
  cbbThemes.Text := 'Themes';
  TStyleManager.TrySetStyle('Windows');
  // Write Default Theme To File - For Main Form
  AssignFile(txtTheme, 'Theme.txt');
  Rewrite(txtTheme);
  Writeln(txtTheme, 'Windows');
  CloseFile(txtTheme);
end;

procedure TfrmSettings.btnUpdateClick(Sender: TObject);
begin
  frmMain.stsbr1.Panels[2].Text := DateToStr(Now);
  frmMain.stsbr1.Panels[3].Text := TimeToStr(Now);
  MessageDlg('Updated', mtInformation, [mbOK], 0);
end;

procedure TfrmSettings.Button1Click(Sender: TObject);
var
  OpenDialog : TOpenDialog;
begin
  // Load Activation Information from Textfile
  OpenDialog := TOpenDialog.Create(Self);
  OpenDialog.InitialDir := GetCurrentDir;
  OpenDialog.Options := [TOpenOption.ofFileMustExist];
  OpenDialog.Filter := 'LLMS License Text File|*.txt*';
  if OpenDialog.Execute then
    begin
      AssignFile(txtFile, OpenDialog.FileName);
      Reset(txtFile);
      edtSerial.Clear;
      redActStat.Clear;
      redProdDetails.Clear;
      Label2.Caption := '';
      while not Eof(txtFile) do
        begin
          Readln(txtFile, sLine);
          // Product Type
          iPos := Pos('#', sLine);
          sProductType := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Product Key
          iPos := Pos('#', sLine);
          sKey := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // User Details
          iPos := Pos('#', sLine);
          sContact := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // User Email
          iPos := Pos('#', sLine);
          sEmail := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Activation Status
          iPos := Pos('#', sLine);
          sStatus := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Days on License
          sDOL := sLine;
        end;

      // Display Information From TextFile
      redActStat.Lines.Add('Product Activation Status: ' + sStatus);
      redActStat.Lines.Add('Licensed To: ' + sContact + ' ' + sEmail);
      edtSerial.ReadOnly := True;
      edtSerial.Text := sKey;
      redProdDetails.Lines.Add('Leaf Library Management System Version 1' + #13 +
      'LLMS: ' + sProductType);
      imgStat.Picture.LoadFromFile('accept.png');
      Label2.Caption := 'Days Remaining on License: ' + sDOL + ' days';
      if (edtSerial.Text = '') or (Length(edtSerial.Text) < 19) then
        begin
          imgStat.Picture.LoadFromFile('cross.png');
          redActStat.Clear;
          redActStat.Font.Color := clRed;
          redActStat.Lines.Add('Invalid Product Key');
          redActStat.Lines.Add('Unactivated Product');
          redProdDetails.Clear;
          Label2.Caption := '';
        end;
        CloseFile(txtFile);

        edtLicenseFile.Text := OpenDialog.FileName;

        // Write the Act Location to File so it can be used
        AssignFile(txtLoc, 'Act_File_Location.txt');
        Rewrite(txtLoc);
        Writeln(txtLoc, edtLicenseFile.Text);
        CloseFile(txtLoc);
    end
  else
    begin
      exit;
    end;
    OpenDialog.Free;


  {if not FileExists('Act_File.txt') then
    begin
      redActStat.Clear;
      MessageDlg('Activation File: Act_File is missing', mtError, [mbOK], 0);
      Exit;
    end
  else
    begin
      AssignFile(txtFile, 'Act_File.txt');
      Reset(txtFile);
      edtSerial.Clear;
      redActStat.Clear;
      redProdDetails.Clear;
      Label2.Caption := '';
      while not Eof(txtFile) do
        begin
          Readln(txtFile, sLine);
          // Product Type
          iPos := Pos('#', sLine);
          sProductType := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Product Key
          iPos := Pos('#', sLine);
          sKey := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // User Details
          iPos := Pos('#', sLine);
          sContact := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // User Email
          iPos := Pos('#', sLine);
          sEmail := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Activation Status
          iPos := Pos('#', sLine);
          sStatus := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          // Days on License
          sDOL := sLine;
        end;

      // Display Information From TextFile
      redActStat.Lines.Add('Product Activation Status: ' + sStatus);
      redActStat.Lines.Add('Licensed To: ' + sContact + ' ' + sEmail);
      edtSerial.ReadOnly := True;
      edtSerial.Text := sKey;
      redProdDetails.Lines.Add('Leaf Library Management System Version 1' + #13 +
      'LLMS: ' + sProductType);
      imgStat.Picture.LoadFromFile('accept.png');
      Label2.Caption := 'Days Remaining on License: ' + sDOL + ' days';
      if (edtSerial.Text = '') or (Length(edtSerial.Text) < 19) then
        begin
          imgStat.Picture.LoadFromFile('cross.png');
          redActStat.Clear;
          redActStat.Font.Color := clRed;
          redActStat.Lines.Add('Invalid Product Key');
          redActStat.Lines.Add('Unactivated Product');
          redProdDetails.Clear;
          Label2.Caption := '';
        end;
    end;
  CloseFile(txtFile); }
end;

procedure TfrmSettings.cbbThemesChange(Sender: TObject);
begin
  tlbtnApply.Enabled := True;
end;

procedure TfrmSettings.ToolButton1Click(Sender: TObject);
begin
  // Close Button
  frmSettings.Close;
end;

procedure TfrmSettings.ToolButton4Click(Sender: TObject);
begin
  // Back Button
  if tbsActivation.Showing = True then
    begin
      tbsDatabase.Show;
    end
  else
  if tbsDatabase.Showing = True then
    begin
      tbsLook.Show;
    end
  else
    if tbsLook.Showing = True then
      begin
        tbsGeneral.Show;
      end
  else
    if tbsGeneral.Showing = True then
      begin
        Beep;
      end;
end;

procedure TfrmSettings.ToolButton5Click(Sender: TObject);
begin
  // Next Button
  if tbsGeneral.Showing = True then
    begin
      tbsLook.Show;
    end
  else
  if tbsLook.Showing = True then
    begin
      tbsDatabase.Show;
    end
  else
  if tbsDatabase.Showing = True then
    begin
      tbsActivation.Show;
    end
  else
  if tbsActivation.Showing = True then
    begin
      Beep;
    end;
end;

end.
