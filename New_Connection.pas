unit New_Connection;
{               **** NEW CONNECTION WIZARD ****
(C) 2022 Connor Bell - ALL RIGHTS RESERVED
This application is part of the LLMS Suite of Applications

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
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, Vcl.CheckLst;

type
  TfrmNewConnection = class(TForm)
    pnlTop: TPanel;
    pgcMain: TPageControl;
    tbsProvider: TTabSheet;
    ToolBar1: TToolBar;
    tlbtnClose: TToolButton;
    tbsLocation: TTabSheet;
    tbsProp: TTabSheet;
    lstMain: TListBox;
    edtLocation: TEdit;
    btnLocation2: TButton;
    lblChooseLocation: TLabel;
    pnlBase: TPanel;
    btnOK: TButton;
    lblUser: TLabel;
    lbledtUsername: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    chkPassword: TCheckBox;
    lstMode: TCheckListBox;
    tlbtnSep1: TToolButton;
    tlbtnBack: TToolButton;
    tlbtnNext: TToolButton;
    lbledtTableName: TLabeledEdit;
    cbbType: TComboBox;
    procedure tlbtnCloseClick(Sender: TObject);
    procedure chkPasswordClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnLocation2Click(Sender: TObject);
    procedure tlbtnBackClick(Sender: TObject);
    procedure tlbtnNextClick(Sender: TObject);
    procedure lstModeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewConnection: TfrmNewConnection;
  sLocation, sMode  : string;
  OpenDialog : TOpenDialog;

implementation

uses
  New_Settings, Main_Unit, FirstHelp;

{$R *.dfm}

procedure TfrmNewConnection.btnLocation2Click(Sender: TObject);
begin
  OpenDialog := TOpenDialog.Create(Self);
  OpenDialog.InitialDir := GetCurrentDir;
  OpenDialog.Options := [TOpenOption.ofFileMustExist];
  OpenDialog.Filter := 'Microsoft Access Database|*.mdb*';
  if OpenDialog.Execute then
    begin
      edtLocation.Text := OpenDialog.FileName;
      sLocation := OpenDialog.FileName;
    end
  else
    begin
      exit;
    end;
    OpenDialog.Free;
  frmFirst.Close;
end;

procedure TfrmNewConnection.btnOKClick(Sender: TObject);
var
  // Library Connection Variables
  txtConnection : TextFile;
  txtFile : TextFile;
  iPosTo, iPosFrom, iPos2, iPos4 : Integer;
  sLine, sProvider, sUserID, sDataSource, sMode, sSystemDatabase,
  sRegistryPath, sDatabasePassword, sEngineType, sDatabaseLockingMode,
  sGlobalPartialBulkOps, sGlobalBulkTransactions, sNewDatabasePassword,
  sCreateSystemDatabase, sEncryptDatabase  : string;
  txtTable : TextFile;
begin
 {  Connection String:
 Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;
 Data Source=C:\Users\Connor Bell\Desktop\Library Software- Delphi 10.4 Files\Library.mdb;
 Mode=ReadWrite;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";
 Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;
 Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;
 Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";
 Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;
 Jet OLEDB:Don't Copy Locale on Compact=False;
 Jet OLEDB:Compact Without Replica Repair=False;
 Jet OLEDB:SFP=False;
 }
 if cbbType.Text = 'Library Connection' then
  begin
    // Set Info
    frmNewConnection.Caption := 'New Library Connection';
    // Mode Selection from CheckList
    case lstMode.ItemIndex of
      0: sMode := 'Read';
      1: sMode := 'ReadWrite';
      2: sMode := 'Share Deny None';
      3: sMode := 'Share Deny Read';
      4: sMode := 'Share Deny Write';
      5: sMode := 'Share Exclusive';
      6: sMode := 'Write';
    end;

    // Disconnect
    frmMain.adtblMain.Active := False;
    frmMain.conMain.Connected := False;

    // Build Connection String
    frmMain.conMain.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;' +
    'Data Source=' + sLocation + ';' +
    'Mode=' + sMode + ';' + 'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";' +
    'Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;' +
    'Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;' +
    'Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";'   +
    'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;' +
    'Jet OLEDB:Don''t Copy Locale on Compact=False;' +
    'Jet OLEDB:Compact Without Replica Repair=False;' +
    'Jet OLEDB:SFP=False;';
     frmMain.conMain.LoginPrompt := False;
     frmMain.conMain.Provider := 'Microsoft.Jet.OLEDB.4.0';

    // Set Table Name
      frmMain.adtblMain.TableName := lbledtTableName.Text;
      frmMain.adtblMain.Connection := frmMain.conMain;
      AssignFile(txtTable, 'Table_Name.txt');
      Rewrite(txtTable);
      Writeln(txtTable, lbledtTableName.Text);
      CloseFile(txtTable);

    // Make Connection Active
     frmMain.conMain.Connected := True;
     frmMain.adtblMain.Active := True;

     // Write to textfile
     AssignFile(txtConnection, 'Connection_String.txt');
     Rewrite(txtConnection);
     Writeln(txtConnection, frmMain.conMain.ConnectionString);
     CloseFile(txtConnection);

     // Establish Connection Status
     if frmMain.conMain.Connected = True then
      begin
        MessageDlg('Connection Successful', mtInformation, [mbOK], 0);
      end
     else
      begin
        MessageDlg('Connection Failed', mtError, [mbOK], 0);
      end;

     // Populate Main Form Database Management Information
     // Import Connection String Information from TextFile;
    frmMain.lbledtProvider.Clear;
    frmMain.lbledtUserID.Clear;
    frmMain.lbledtDataSource.Clear;
    frmMain.lbledtMode.Clear;

    if not FileExists('Connection_String.txt') then
      begin
        MessageDlg('Cannot find Connection String File' + #13 +
        'It either does not exist, or is missing', mtError, [mbOK], 0);
      end
    else
      begin
        AssignFile(txtFile, 'Connection_String.txt');
        Reset(txtFile);
        while not Eof(txtFile) do
          begin
            Readln(txtFile, sLine);
            iPosTo := Pos(';', sLine);
            iPosFrom := Pos('=', sLine);
            sProvider := Copy(sLine, iPosFrom + 1, iPosTo - iPosFrom - 1);
            Delete(sLine, 1, iPosTo);

            iPosTo := Pos(';', sLine);
            iPosFrom := Pos('=', sLine);
            sUserID := Copy(sLine, iPosFrom + 1, iPosTo - iPosFrom - 1);
            Delete(sLine, 1, iPosTo);

            iPosTo := Pos(';', sLine);
            iPosFrom := Pos('=', sLine);
            sDataSource := Copy(sLine, iPosFrom + 1, iPosTo - iPosFrom - 1);
            Delete(sLine, 1, iPosTo);

            iPosTo := Pos(';', sLine);
            iPosFrom := Pos('=', sLine);
            sMode := Copy(sLine, iPosFrom + 1, iPosTo - iPosFrom - 1);
            Delete(sLine, 1, iPosTo);

            //// JET OLEDB ////
            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sSystemDatabase := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sRegistryPath:= Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sDatabasePassword := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sEngineType := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sDatabaseLockingMode := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sGlobalPartialBulkOps := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sGlobalBulkTransactions := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sNewDatabasePassword := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sCreateSystemDatabase := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sEncryptDatabase := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);
          end;
          frmMain.lbledtProvider.Text := sProvider;
          frmMain.lbledtUserID.Text := sUserID;
          frmMain.lbledtDataSource.Text := sDataSource;
          frmMain.lbledtMode.Text := sMode;
          frmMain.lbledtSysDB1.Text := sSystemDatabase;
          frmMain.lbledtRegPath.Text := sRegistryPath;
          frmMain.lbledtDBpass.Text := sDatabasePassword;
          frmMain.lbledtEngTyp.Text := sEngineType;
          frmMain.lbledtLMode.Text := sDatabaseLockingMode;
          frmMain.lbledtPBulk.Text := sGlobalPartialBulkOps;
          frmMain.lbledtBTrans.Text := sGlobalBulkTransactions;
          frmMain.lbledtNPassw.Text := sNewDatabasePassword;
          frmMain.lbledtSysDB.Text := sCreateSystemDatabase;
          frmMain.lbledtEncrDB.Text := sEncryptDatabase;
      end;
    CloseFile(txtFile);

    // Refresh Table
    frmMain.dsMain.DataSet := frmMain.adtblMain;
    frmMain.DBGrid1.DataSource := frmMain.dsMain;
    frmMain.DBGrid1.Refresh;
    frmMain.DBGrid1.Columns.RebuildColumns;
    //frmMain.DBGrid1.Columns[1].Width := 120;
    //frmMain.DBGrid1.Columns[frmMain.DBGrid1.Columns.Count - 1].Width := 120;

    //  Clear Fields
    edtLocation.Text := '';
    sLocation := '';
    pgcMain.ActivePage := tbsProvider;
    lbledtTableName.Clear;
    // Close Wizard
    frmNewConnection.Close;
  end
 else
 if cbbType.Text = 'User Connection' then
  begin
     // Set Info
    frmNewConnection.Caption := 'New User Connection';
    // Mode Selection from CheckList
    case lstMode.ItemIndex of
      0: sMode := 'Read';
      1: sMode := 'ReadWrite';
      2: sMode := 'Share Deny None';
      3: sMode := 'Share Deny Read';
      4: sMode := 'Share Deny Write';
      5: sMode := 'Share Exclusive';
      6: sMode := 'Write';
    end;

    // Disconnect
    frmMain.adtblUser.Active := False;
    frmMain.conUser.Connected := False;

    // Build Connection String
    frmMain.conUser.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;' +
    'Data Source=' + sLocation + ';' +
    'Mode=' + sMode + ';' + 'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";' +
    'Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;' +
    'Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;' +
    'Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";'   +
    'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;' +
    'Jet OLEDB:Don''t Copy Locale on Compact=False;' +
    'Jet OLEDB:Compact Without Replica Repair=False;' +
    'Jet OLEDB:SFP=False;';
     frmMain.conUser.LoginPrompt := False;
     frmMain.conUser.Provider := 'Microsoft.Jet.OLEDB.4.0';

     // Set Table Name
      frmMain.adtblUser.TableName := lbledtTableName.Text;
      frmMain.adtblUser.Connection := frmMain.conUser;
      AssignFile(txtTable, 'Table_Name_User.txt');
      Rewrite(txtTable);
      Writeln(txtTable, lbledtTableName.Text);
      CloseFile(txtTable);

    // Make Connection Active
     frmMain.conUser.Connected := True;
     frmMain.adtblUser.Active := True;

     // Write to textfile
     AssignFile(txtConnection, 'Connection_String_User.txt');
     Rewrite(txtConnection);
     Writeln(txtConnection, frmMain.conUser.ConnectionString);
     CloseFile(txtConnection);

     // Establish Connection Status
     if frmMain.conUser.Connected = True then
      begin
        MessageDlg('Connection Successful', mtInformation, [mbOK], 0);
      end
     else
      begin
        MessageDlg('Connection Failed', mtError, [mbOK], 0);
      end;

    frmMain.lbledtUserProvider.Clear;
    frmMain.lbledtUserUserID.Clear;
    frmMain.lbledtUserDataSource.Clear;
    frmMain.lbledtUserMode.Clear;

    if not FileExists('Connection_String_User.txt') then
      begin
        MessageDlg('Cannot find Connection String File' + #13 +
        'It either does not exist, or is missing', mtError, [mbOK], 0);
      end
    else
      begin
        AssignFile(txtFile, 'Connection_String_User.txt');
        Reset(txtFile);
        while not Eof(txtFile) do
          begin
            Readln(txtFile, sLine);
            iPosTo := Pos(';', sLine);
            iPosFrom := Pos('=', sLine);
            sProvider := Copy(sLine, iPosFrom + 1, iPosTo - iPosFrom - 1);
            Delete(sLine, 1, iPosTo);

            iPosTo := Pos(';', sLine);
            iPosFrom := Pos('=', sLine);
            sUserID := Copy(sLine, iPosFrom + 1, iPosTo - iPosFrom - 1);
            Delete(sLine, 1, iPosTo);

            iPosTo := Pos(';', sLine);
            iPosFrom := Pos('=', sLine);
            sDataSource := Copy(sLine, iPosFrom + 1, iPosTo - iPosFrom - 1);
            Delete(sLine, 1, iPosTo);

            iPosTo := Pos(';', sLine);
            iPosFrom := Pos('=', sLine);
            sMode := Copy(sLine, iPosFrom + 1, iPosTo - iPosFrom - 1);
            Delete(sLine, 1, iPosTo);

            //// JET OLEDB ////
            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sSystemDatabase := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sRegistryPath:= Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sDatabasePassword := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sEngineType := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sDatabaseLockingMode := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sGlobalPartialBulkOps := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sGlobalBulkTransactions := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sNewDatabasePassword := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sCreateSystemDatabase := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);

            iPos2 := Pos(';', sLine);
            iPos4 := Pos('=', sLine);
            sEncryptDatabase := Copy(sLine, iPos4 + 1, iPos2 - iPos4 - 1);
            Delete(sLine, 1, iPos2);
          end;
          frmMain.lbledtUserProvider.Text := sProvider;
          frmMain.lbledtUserUserID.Text := sUserID;
          frmMain.lbledtUserDataSource.Text := sDataSource;
          frmMain.lbledtUserMode.Text := sMode;
      end;
    CloseFile(txtFile);

    // Refresh Table
    frmMain.dsUser.DataSet := frmMain.adtblUser;
    frmMain.dbgrdUser.DataSource := frmMain.dsUser;
    frmMain.dbgrdUser.Refresh;
    frmMain.dbgrdUser.Columns.RebuildColumns;
    //frmMain.DBGrid1.Columns[1].Width := 120;
    //frmMain.DBGrid1.Columns[frmMain.DBGrid1.Columns.Count - 1].Width := 120;

    //  Clear Fields
    edtLocation.Text := '';
    sLocation := '';
    pgcMain.ActivePage := tbsProvider;
    lbledtTableName.Clear;
    // Close Wizard
    frmNewConnection.Close;
  end;
end;

procedure TfrmNewConnection.chkPasswordClick(Sender: TObject);
begin
  // Set Blank Password
  if chkPassword.Checked = True then
    begin
      lbledtPassword.Enabled := False;
    end
  else
  if chkPassword.Checked = False then
    begin
      lbledtPassword.Enabled := True;
    end;
end;

procedure TfrmNewConnection.lstModeClick(Sender: TObject);
begin
  // Enable OK Button
  if (Length(edtLocation.Text) > 0) and (lstMain.Selected[0] = True) then
    begin
      btnOK.Enabled := True;
    end;
end;

procedure TfrmNewConnection.tlbtnBackClick(Sender: TObject);
begin
  // Back Tabsheet Button
  if tbsProvider.Showing = True then
    begin
      Beep;
    end
  else
  if tbsLocation.Showing = True then
    begin
      tbsProvider.Show;
    end
  else
  if tbsProp.Showing = True then
    begin
      tbsLocation.Show;
    end;
end;

procedure TfrmNewConnection.tlbtnCloseClick(Sender: TObject);
begin
  // Close Wizard
  frmNewConnection.Close;
end;

procedure TfrmNewConnection.tlbtnNextClick(Sender: TObject);
begin
  // Next Tabsheet Button
  if tbsProvider.Showing = True then
    begin
      tbsLocation.Show;
    end
  else
  if tbsLocation.Showing = True then
    begin
      tbsProp.Show;
    end
  else
  if tbsProp.Showing = True then
    begin
      Beep;
    end;
end;

end.
