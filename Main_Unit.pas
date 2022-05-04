unit Main_Unit;
{                    **** MAIN APPLICATION - LLMS ****
 (C) 2022 Connor Bell - ALL RIGHTS RESERVED
 This application is the main application in a suite of applications

 Development Date: 14 - 18 April 2022
 Development Location: Beukes Ave, Highway Gardens
 Development PC: Dell Inspiron 15
 Development OS: Windows 8.1 Pro 9600

 Contact:
  email: cbell@jeppeboys.co.za
  mobile: +27 66 202 1724
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, CategoryButtons, ExtCtrls, DBCtrls, Grids, DBGrids,
  StdCtrls, TeEngine, TeeProcs, Chart, Series, ADODB, DB, ImgList,
  VclTee.TeeGDIPlus, System.ImageList, Vcl.Imaging.jpeg, Vcl.Themes, Vcl.Menus;

type
  TfrmMain = class(TForm)
    stsbr1: TStatusBar;
    pgcMain: TPageControl;
    tbsLibrary: TTabSheet;
    pgcLibrary: TPageControl;
    tbsDatabase: TTabSheet;
    tbsItemInfo: TTabSheet;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    DBNavigator1: TDBNavigator;
    pnlTop: TPanel;
    cbbSearch: TComboBox;
    edtSearchDatabase: TEdit;
    btnSearchDatabase: TButton;
    edtQuickTitle: TEdit;
    lblQuickISBN: TLabel;
    edtQuickISBN: TEdit;
    lblQuickINOUT: TLabel;
    edtQuickINOUT: TEdit;
    lblAuthorQuick: TLabel;
    edtQuickAuthor: TEdit;
    lblQuickLastUsed: TLabel;
    edtLastUser: TEdit;
    tbsUser: TTabSheet;
    tbsDetailedAnalysis: TTabSheet;
    CategoryButtons1: TCategoryButtons;
    grpOverview: TGroupBox;
    edtTitle: TEdit;
    imgImage: TImage;
    lbledtISBN: TLabeledEdit;
    lbledtAuthor: TLabeledEdit;
    lbledtPubDate: TLabeledEdit;
    lbledtCopyCount: TLabeledEdit;
    lbledtStatus: TLabeledEdit;
    PageControl1: TPageControl;
    tbsOverview: TTabSheet;
    tbsReport: TTabSheet;
    tbsUsageHist: TTabSheet;
    tbsUsageGraph: TTabSheet;
    tbsDatabaseMan: TTabSheet;
    Chart1: TChart;
    Series1: TAreaSeries;
    conMain: TADOConnection;
    adtblMain: TADOTable;
    dsMain: TDataSource;
    adtstMain: TADODataSet;
    imglstMain: TImageList;
    CategoryPanelGroup2: TCategoryPanelGroup;
    CategoryPanel3: TCategoryPanel;
    redConnectionString: TRichEdit;
    lblConnectionString: TLabel;
    grpOverviewDB: TGroupBox;
    lbledtProvider: TLabeledEdit;
    lbledtDataSource: TLabeledEdit;
    btnRefresh: TButton;
    btnSaveInfo: TButton;
    btnOpenConnection: TButton;
    lbledtUserID: TLabeledEdit;
    lbledtMode: TLabeledEdit;
    CategoryPanel4: TCategoryPanel;
    lbledtSysDB1: TLabeledEdit;
    lbledtRegPath: TLabeledEdit;
    lbledtDBpass: TLabeledEdit;
    lbledtEngTyp: TLabeledEdit;
    lbledtLMode: TLabeledEdit;
    lbledtPBulk: TLabeledEdit;
    lbledtBTrans: TLabeledEdit;
    lbledtNPassw: TLabeledEdit;
    lbledtSysDB: TLabeledEdit;
    lbledtEncrDB: TLabeledEdit;
    grpMain: TGroupBox;
    redConnectionProp: TRichEdit;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    ToolButton8: TToolButton;
    btnAbout: TToolButton;
    DBGrid1: TDBGrid;
    imgQuick: TImage;
    lbledtBarcode: TLabeledEdit;
    lbledtDatabaseEntry: TLabeledEdit;
    lbledtCategory: TLabeledEdit;
    lbledtGenre: TLabeledEdit;
    lbledtLastUser: TLabeledEdit;
    btnNew: TButton;
    pgcDataMan: TPageControl;
    tbsLibraryMan: TTabSheet;
    tbsUserMan: TTabSheet;
    lbledtTableName: TLabeledEdit;
    pgcUsers: TPageControl;
    tbsUserDatabase: TTabSheet;
    tbsUserInfo: TTabSheet;
    pnlUserTop: TPanel;
    dbnvgtrUser: TDBNavigator;
    cbbUserParam: TComboBox;
    edtSearchParam: TEdit;
    btnSearch: TButton;
    CategoryPanelGroup3: TCategoryPanelGroup;
    CategoryPanel5: TCategoryPanel;
    dbgrdUser: TDBGrid;
    conUser: TADOConnection;
    adtblUser: TADOTable;
    dsUser: TDataSource;
    dbmmoMain: TDBMemo;
    mnmnMain: TMainMenu;
    mntmMain1: TMenuItem;
    mntmEdit1: TMenuItem;
    AddBook1: TMenuItem;
    AddBook2: TMenuItem;
    N1: TMenuItem;
    AddUser1: TMenuItem;
    AddUser2: TMenuItem;
    Refresh1: TMenuItem;
    Database1: TMenuItem;
    N2: TMenuItem;
    IssueBook3: TMenuItem;
    IssueBook4: TMenuItem;
    ools1: TMenuItem;
    ools2: TMenuItem;
    Statistics1: TMenuItem;
    Statistics2: TMenuItem;
    Help1: TMenuItem;
    Help2: TMenuItem;
    About1: TMenuItem;
    N3: TMenuItem;
    Print1: TMenuItem;
    Database2: TMenuItem;
    Database3: TMenuItem;
    Library1: TMenuItem;
    Library2: TMenuItem;
    ConnectionString1: TMenuItem;
    ConnectionString2: TMenuItem;
    LibraryDatabaseConnection1: TMenuItem;
    UserDatabaseConnection1: TMenuItem;
    N4: TMenuItem;
    Close1: TMenuItem;
    View1: TMenuItem;
    Library3: TMenuItem;
    UserManagement1: TMenuItem;
    DetailedAnalysis1: TMenuItem;
    DatabaseManagement1: TMenuItem;
    Database4: TMenuItem;
    Database5: TMenuItem;
    Database6: TMenuItem;
    Database7: TMenuItem;
    LibraryDatabase1: TMenuItem;
    LibraryDatabase2: TMenuItem;
    redUserConnectionString: TRichEdit;
    lblConStringLab: TLabel;
    redUserConInfo: TRichEdit;
    grpUserConInfo: TGroupBox;
    lbledtUserProvider: TLabeledEdit;
    lbledtUserDataSource: TLabeledEdit;
    lbledtUserUserID: TLabeledEdit;
    lbledtUserMode: TLabeledEdit;
    lbledtUserTableName: TLabeledEdit;
    tlbtSep6: TToolButton;
    tlbtnSep6: TToolButton;
    grpOverviewUser: TGroupBox;
    edtUserTitle: TEdit;
    lbledtGrade: TLabeledEdit;
    lbledtClass: TLabeledEdit;
    lbledtUserIDMain: TLabeledEdit;
    redUsageUser: TRichEdit;
    lblUH: TLabel;
    procedure CategoryButtons1Categories0Items0Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items1Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items2Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items3Click(Sender: TObject);
    procedure pgcLibraryChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgcLibraryChange(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure dbgrdMainCellClick(Column: TColumn);
    procedure dbgrdMainColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure dbgrdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrdMainDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbgrdMainColExit(Sender: TObject);
    procedure dbgrdMainColEnter(Sender: TObject);
    procedure dbgrdMainDblClick(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSearchDatabaseClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure edtSearchDatabaseChange(Sender: TObject);
    procedure btnOpenConnectionClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure CategoryButtons1Categories1Items2Click(Sender: TObject);
    procedure CategoryButtons1Categories1Items3Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure ools2Click(Sender: TObject);
    procedure AddBook1Click(Sender: TObject);
    procedure IssueBook3Click(Sender: TObject);
    procedure Library3Click(Sender: TObject);
    procedure UserManagement1Click(Sender: TObject);
    procedure DetailedAnalysis1Click(Sender: TObject);
    procedure DatabaseManagement1Click(Sender: TObject);
    procedure Database1Click(Sender: TObject);
    procedure Statistics1Click(Sender: TObject);
    procedure Statistics2Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure dbgrdUserDblClick(Sender: TObject);
    procedure dbgrdUserCellClick(Column: TColumn);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrdUserKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure LibraryDatabaseConnection1Click(Sender: TObject);
    procedure UserDatabaseConnection1Click(Sender: TObject);
    procedure AddBook2Click(Sender: TObject);
    procedure AddUser1Click(Sender: TObject);
    procedure AddUser2Click(Sender: TObject);
    procedure IssueBook4Click(Sender: TObject);
    procedure Database4Click(Sender: TObject);
    procedure Database5Click(Sender: TObject);
    procedure Database6Click(Sender: TObject);
    procedure Database7Click(Sender: TObject);
    procedure LibraryDatabase1Click(Sender: TObject);
    procedure LibraryDatabase2Click(Sender: TObject);
    procedure stsbr1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  sConnectionString : WideString;
  txtFile : TextFile;
  sLine : string;
  iPosTo, iPosFrom : Integer;
  // Connection String Information Variables
  sProvider, sUserID, sDataSource, sMode : string;
  // JET OLEDB Variables
  iPos2, iPos4 : Integer;
  sSystemDatabase, sRegistryPath, sDatabasePassword, sEngineType,
  sDatabaseLockingMode, sGlobalPartialBulkOps,  sGlobalBulkTransactions,
  sNewDatabasePassword, sCreateSystemDatabase, sEncryptDatabase : string;
  // Theme Variables
  txtFileTheme : TextFile;
  sThemeLine, sTheme : string;
  bTheme : Boolean;
  // Remove Book
  sRemoveBook : string;

implementation

uses
  Search_Database, Add_Book, New_Settings, Help_Docs, About, New_Connection, Issue_Book, Make_Report, FirstHelp, Add_User, Return_Book;

{$R *.dfm}

procedure TfrmMain.About1Click(Sender: TObject);
begin
  // Open About Form
  frmAbout.Show;
end;

procedure TfrmMain.AddBook1Click(Sender: TObject);
begin
  // Show Add Book Wizard - Menu
  frmAdd.Show;
end;

procedure TfrmMain.AddBook2Click(Sender: TObject);
var
  iMessage : Integer;
begin
  // Remove Book
   //sRemoveBook := adtblMain['Title'];
   //adtblMain.Delete;
    // Remove User
  iMessage := MessageDlg('Confirm Book Removal?', mtWarning, mbYesNo, 0);
  if iMessage = mrYes then
    begin
      adtblMain.Delete;
    end
  else
  if iMessage = mrNo then
    begin
      Exit;
    end;
end;

procedure TfrmMain.AddUser1Click(Sender: TObject);
begin
  // Add User
  frmAddUser.Show;
end;

procedure TfrmMain.AddUser2Click(Sender: TObject);
var
  iMessage2 : Integer;
begin
  // Remove User
  iMessage2 := MessageDlg('Confirm User Removal?', mtWarning, mbYesNo, 0);
  if iMessage2 = mrYes then
    begin
      adtblUser.Delete;
    end
  else
  if iMessage2 = mrNo then
    begin
      Exit;
    end;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  // Open About Form
  frmAbout.Show;
end;

procedure TfrmMain.btnNewClick(Sender: TObject);
begin
    frmSettings.Show;
    frmSettings.tbsDatabase.Show;
end;

procedure TfrmMain.btnOpenConnectionClick(Sender: TObject);
begin
   // Import Connection String Information from TextFile;
  lbledtProvider.Clear;
  lbledtUserID.Clear;
  lbledtDataSource.Clear;
  lbledtMode.Clear;
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
        lbledtProvider.Text := sProvider;
        lbledtUserID.Text := sUserID;
        lbledtDataSource.Text := sDataSource;
        lbledtMode.Text := sMode;
        lbledtSysDB1.Text := sSystemDatabase;
        lbledtRegPath.Text := sRegistryPath;
        lbledtDBpass.Text := sDatabasePassword;
        lbledtEngTyp.Text := sEngineType;
        lbledtLMode.Text := sDatabaseLockingMode;
        lbledtPBulk.Text := sGlobalPartialBulkOps;
        lbledtBTrans.Text := sGlobalBulkTransactions;
        lbledtNPassw.Text := sNewDatabasePassword;
        lbledtSysDB.Text := sCreateSystemDatabase;
        lbledtEncrDB.Text := sEncryptDatabase;
    end;
  CloseFile(txtFile);
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  // Refresh Connectin String
  redConnectionString.Clear;
  redConnectionString.Lines.Add(conMain.ConnectionString);
  redConnectionProp.Clear;
  redConnectionProp.Lines.Add('Connection Timeout: ' + IntToStr(conMain.ConnectionTimeout));
  if conMain.Connected = True then
    begin
      redConnectionProp.Lines.Add('Connected: True');
    end
  else
    begin
      redConnectionProp.Lines.Add('Connected: False');
    end;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
var
  iResultCount : Integer;
  sInput : string;
  iCount : Integer;
  I, K: Integer;
begin
  // Initialise Variables
  iResultCount := 0;
  iCount := 1;

   // Format Search Stringgrid
  frmSearch.StringGrid1.Cells[0, 1] := cbbUserParam.Text;
  frmSearch.StringGrid1.Cells[1, 1] := edtSearchParam.Text;
  sInput := edtSearchParam.Text;
  for K := 0 to frmSearch.StringGrid2.ColCount - 1 do
    frmSearch.StringGrid2.Cols[K].Clear;
  frmSearch.StringGrid2.DefaultColWidth := 120;
  frmSearch.StringGrid2.FixedCols := 0;
  frmSearch.StringGrid2.ColCount := 4;
  frmSearch.StringGrid2.Cells[0, 0] := 'Name';
  frmSearch.StringGrid2.Cells[1, 0] := 'Surname';
  frmSearch.StringGrid2.Cells[2, 0] := 'UserID';
  frmSearch.StringGrid2.Cells[3, 0] := 'Grade';
  frmSearch.StringGrid2.Cells[4, 0] := 'Class';

    // Search
  adtblUser.First;
  while not adtblUser.Eof do
    begin
      if UpperCase(adtblUser[cbbUserParam.Text]) = UpperCase(sInput) then
        begin
          Inc(iResultCount);
          for I := 1 to iResultCount do
            begin
              frmSearch.StringGrid2.Cells[0, iCount] := adtblUser['UserID'];
              frmSearch.StringGrid2.Cells[1, iCount] := adtblUser['Name'];
              frmSearch.StringGrid2.Cells[2, iCount] := adtblUser['Surname'];
              frmSearch.StringGrid2.Cells[3, iCount] := adtblUser['Grade'];
              frmSearch.StringGrid2.Cells[4, iCount] := adtblUser['Class'];
            end;
            Inc(iCount);
        end;
      adtblUser.Next;
    end;

  frmSearch.StringGrid1.Cells[2, 1] := IntToStr(iResultCount);
  sInput := '';

  // Clear Fields
  cbbUserParam.Text := 'Search Parameter';
  edtSearchParam.Text := '';

  // Show Form
  frmSearch.Show;
end;

procedure TfrmMain.btnSearchDatabaseClick(Sender: TObject);
var
  iResultCount : Integer;
  sInput : string;
  I, K : Integer;
  iCount : Integer;
begin
  // Initialise Variables
  iResultCount := 0;
  iCount := 1;

  // Format Search Stringgrid
  for K := 0 to frmSearch.StringGrid2.ColCount - 1 do
    frmSearch.StringGrid2.Cols[K].Clear;
  frmSearch.StringGrid1.Cells[0, 1] := cbbSearch.Text;
  frmSearch.StringGrid1.Cells[1, 1] := edtSearchDatabase.Text;
  sInput := edtSearchDatabase.Text;
  frmSearch.StringGrid2.DefaultColWidth := 120;
  frmSearch.StringGrid2.FixedCols := 0;
  frmSearch.StringGrid2.ColCount := 6;
  frmSearch.StringGrid2.Cells[0, 0] := 'Title';
  frmSearch.StringGrid2.Cells[1, 0] := 'Author';
  frmSearch.StringGrid2.Cells[2, 0] := 'ISBN';
  frmSearch.StringGrid2.Cells[3, 0] := 'Category';
  frmSearch.StringGrid2.Cells[4, 0] := 'Genre';
  frmSearch.StringGrid2.Cells[5, 0] := 'In/Out';

  // Search
  adtblMain.First;
  while not adtblMain.Eof do
    begin
      if UpperCase(adtblMain[cbbSearch.Text]) = UpperCase(sInput) then
        begin
          Inc(iResultCount);
          for I := 1 to iResultCount do
            begin
              frmSearch.StringGrid2.Cells[0, iCount] := adtblMain['Title'];
              frmSearch.StringGrid2.Cells[1, iCount] := adtblMain['Author'];
              frmSearch.StringGrid2.Cells[2, iCount] := adtblMain['ISBN'];
              frmSearch.StringGrid2.Cells[3, iCount] := adtblMain['Category'];
              frmSearch.StringGrid2.Cells[4, iCount] := adtblMain['Genre'];
              frmSearch.StringGrid2.Cells[5, iCount] := adtblMain['In/Out'];
            end;
          Inc(iCount);
        end;
        adtblMain.Next;
    end;

  frmSearch.StringGrid1.Cells[2, 1] := IntToStr(iResultCount);
  sInput := '';

  // Clear Fields
  cbbSearch.Text := 'Search Parameter';
  edtSearchDatabase.Text := '';
  btnSearchDatabase.Enabled := False;

  // Show Form
  frmSearch.Show;
end;

procedure TfrmMain.CategoryButtons1Categories0Items0Click(Sender: TObject);
begin
  // Show Overview Tab
  tbsOverview.Show;
end;

procedure TfrmMain.CategoryButtons1Categories0Items1Click(Sender: TObject);
begin
  // Show Report Tab
  tbsReport.Show;
end;

procedure TfrmMain.CategoryButtons1Categories0Items2Click(Sender: TObject);
begin
  // Show Usage History Tab
  tbsUsageHist.Show;
end;

procedure TfrmMain.CategoryButtons1Categories0Items3Click(Sender: TObject);
begin
  // Show Usage Graph
  tbsUsageGraph.Show;
end;

procedure TfrmMain.CategoryButtons1Categories1Items2Click(Sender: TObject);
begin
  // Make Report
  frmReport.Show;
end;

procedure TfrmMain.CategoryButtons1Categories1Items3Click(Sender: TObject);
begin
  // Modify Report
  frmReport.Show;
  frmReport.redMain.Clear;
  frmReport.redMain.Lines.Add(dbmmoMain.Text);
end;

procedure TfrmMain.Close1Click(Sender: TObject);
begin
  // Menu Close
  Application.Terminate;
end;

procedure TfrmMain.Database1Click(Sender: TObject);
begin
    // Refresh Database Table
  if tbsLibrary.Showing = True then
    begin
      adtblMain.Refresh;
    end
  else
  if tbsUser.Showing = True then
    begin
      adtblUser.Refresh;
    end;
end;

procedure TfrmMain.Database4Click(Sender: TObject);
begin
  // Show Lib Database
  tbsLibrary.Show;
  tbsDatabase.Show;
end;

procedure TfrmMain.Database5Click(Sender: TObject);
begin
  // Show Book Info
  tbsLibrary.Show;
  tbsItemInfo.Show;
end;

procedure TfrmMain.Database6Click(Sender: TObject);
begin
  // User Management Show
  tbsUser.Show;
  tbsUserDatabase.Show;
end;

procedure TfrmMain.Database7Click(Sender: TObject);
begin
  // User Management Show
  tbsUser.Show;
  tbsUserInfo.Show;
end;

procedure TfrmMain.DatabaseManagement1Click(Sender: TObject);
begin
  // Database Management
  tbsDatabaseMan.Show;
end;

procedure TfrmMain.dbgrdMainCellClick(Column: TColumn);
begin
  // Select Record
  edtQuickTitle.Text := adtblMain['Title'];
  edtQuickISBN.Text := adtblMain['ISBN'];
  edtQuickAuthor.Text := adtblMain['Author'];
  // edtLastUser.Text := adtblMain['Last User'];
end;

procedure TfrmMain.dbgrdMainColEnter(Sender: TObject);
begin
    // Select Record
  edtQuickTitle.Text := adtblMain['Title'];
  edtQuickISBN.Text := adtblMain['ISBN'];
  edtQuickAuthor.Text := adtblMain['Author'];
  // edtLastUser.Text := adtblMain['Last User'];
end;

procedure TfrmMain.dbgrdMainColExit(Sender: TObject);
begin
    // Select Record
  edtQuickTitle.Text := adtblMain['Title'];
  edtQuickISBN.Text := adtblMain['ISBN'];
  edtQuickAuthor.Text := adtblMain['Author'];
  // edtLastUser.Text := adtblMain['Last User'];
end;

procedure TfrmMain.dbgrdMainColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  // Select Record
  edtQuickTitle.Text := adtblMain['Title'];
  edtQuickISBN.Text := adtblMain['ISBN'];
  edtQuickAuthor.Text := adtblMain['Author'];
  // edtLastUser.Text := adtblMain['Last User'];
end;

procedure TfrmMain.dbgrdMainDblClick(Sender: TObject);
begin
  tbsItemInfo.Show;
  edtTitle.Text := adtblMain['Title'];
end;

procedure TfrmMain.dbgrdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Select Record
  edtQuickTitle.Text := adtblMain['Title'];
  edtQuickISBN.Text := adtblMain['ISBN'];
  edtQuickAuthor.Text := adtblMain['Author'];
  // edtLastUser.Text := adtblMain['Last User'];
  stsbr1.Panels[0].Text := 'Item No: ' + IntToStr(adtblMain['ID']);

end;

procedure TfrmMain.dbgrdMainDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  // Select Record
  edtQuickTitle.Text := adtblMain['Title'];
  edtQuickISBN.Text := adtblMain['ISBN'];
  edtQuickAuthor.Text := adtblMain['Author'];
  // edtLastUser.Text := adtblMain['Last User'];
end;

procedure TfrmMain.dbgrdUserCellClick(Column: TColumn);
begin
  stsbr1.Panels[1].Text := '[' + IntToStr(adtblUser['ID']) + ']';
end;

procedure TfrmMain.dbgrdUserDblClick(Sender: TObject);
begin
  tbsUserInfo.Show;

  edtUserTitle.Clear;
  lbledtClass.Clear;
  lbledtGrade.Clear;

  edtUserTitle.Text := adtblUser['Name'] + ' ' + adtblUser['Surname'];
  lbledtClass.Text := adtblUser['Class'];
  lbledtGrade.Text := adtblUser['Grade'];
  lbledtUserIDMain.Text := adtblUser['UserID'];
  redUsageUser.Clear;
  redUsageUser.Lines.Add(adtblUser['Usage History']);
end;

procedure TfrmMain.dbgrdUserKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Key Movement
  stsbr1.Panels[1].Text := '[' + IntToStr(adtblUser['ID']) + ']';
end;

procedure TfrmMain.DBGrid1CellClick(Column: TColumn);
begin
  // Database Cell Click - Update Information
  if (Length(adtblMain['Title']) = 0) or (Length(adtblMain['ISBN']) = 0) or
  (Length(adtblMain['In/Out']) = 0) or (Length(adtblMain['Author']) = 0) or
  (Length(adtblMain['Last User']) = 0) or (Length(adtblMain['Image Name']) = 0)
  then
    begin
      exit;
    end
  else
    begin
      edtQuickTitle.Text := adtblMain['Title'];
      edtQuickISBN.Text := adtblMain['ISBN'];
      edtQuickINOUT.Text  := adtblMain['In/Out'];
      edtQuickAuthor.Text := adtblMain['Author'];
      edtLastUser.Text := adtblMain['Last User'];
      imgQuick.Picture.LoadFromFile(adtblMain['Image Name']);
    end;
  // Update Statusbar Information
  stsbr1.Panels[1].Text := '[' + IntToStr(adtblMain['ID']) + ']';
end;

procedure TfrmMain.DBGrid1DblClick(Sender: TObject);
begin
  // Double Click Database Record
  tbsItemInfo.Show;
  edtTitle.Text := adtblMain['Title'];
  lbledtISBN.Text := adtblMain['ISBN'];
  lbledtAuthor.Text := adtblMain['Author'];
  lbledtPubDate.Text := adtblMain['Date of Publication'];
  lbledtStatus.Text := adtblMain['In/Out'];
  imgImage.Picture.LoadFromFile(adtblMain['Image Name']);
  lbledtBarcode.Text := adtblMain['ISBN'];
  lbledtLastUser.Text := adtblMain['Last User'];
  lbledtGenre.Text := adtblMain['Genre'];
  lbledtCategory.Text := adtblMain['Category'];
  lbledtDatabaseEntry.Text := adtblMain['Database Entry Date'];
  lbledtCopyCount.Text := adtblMain['Copy Count'];
end;

procedure TfrmMain.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Key Movement
  // Database Cell Click - Update Information
  if (Length(adtblMain['Title']) = 0) or (Length(adtblMain['ISBN']) = 0) or
  (Length(adtblMain['In/Out']) = 0) or (Length(adtblMain['Author']) = 0) or
  (Length(adtblMain['Last User']) = 0) or (Length(adtblMain['Image Name']) = 0)
  then
    begin
      exit;
    end
  else
    begin
      edtQuickTitle.Text := adtblMain['Title'];
      edtQuickISBN.Text := adtblMain['ISBN'];
      edtQuickINOUT.Text  := adtblMain['In/Out'];
      edtQuickAuthor.Text := adtblMain['Author'];
      edtLastUser.Text := adtblMain['Last User'];
      imgQuick.Picture.LoadFromFile(adtblMain['Image Name']);
    end;

  stsbr1.Panels[1].Text := '[' + IntToStr(adtblMain['ID']) + ']';
end;

procedure TfrmMain.DetailedAnalysis1Click(Sender: TObject);
begin
  // View Detailed Analysis
  tbsDetailedAnalysis.Show;
end;

procedure TfrmMain.edtSearchDatabaseChange(Sender: TObject);
begin
  // Enable Search Button
  btnSearchDatabase.Enabled := True;
end;

procedure TfrmMain.FormActivate(Sender: TObject);   // Form OnActivate
var
  txtData, txtTableUser: TextFile;
  sConnectionString, sConStrUser : WideString;
  txtTable : TextFile;
  sTable, sTableUser : string;
  I : Integer;
begin

  // Caption
  frmMain.Caption := 'Ibex Library';

  // Choose Database Read From File
  AssignFile(txtData, 'Connection_String.txt');
  Reset(txtData);
  while not Eof(txtData) do
    begin
      Readln(txtData, sConnectionString);
    end;
  CloseFile(txtData);

    // Choose Database Read From File
  AssignFile(txtTableUser, 'Connection_String_User.txt');
  Reset(txtTableUser);
  while not Eof(txtTableUser) do
    begin
      Readln(txtTableUser, sConStrUser);
    end;
  CloseFile(txtTableUser);

  if (Length(sConnectionString) <> 0) and (Length(sConStrUser) <> 0) then
    begin
      // Fill conMain
      conMain.Connected := False;
      conMain.ConnectionString := sConnectionString;
      // Reconnect conMain
      conMain.Connected := True;

      // Refresh Table
      AssignFile(txtTable, 'Table_Name.txt');
      Reset(txtTable);
      while not Eof(txtTable) do
        begin
          Readln(txtTable, sTable);
        end;
      CloseFile(txtTable);
      lbledtTableName.Text := sTable;

      // Fill adoTable
      adtblMain.Active := False;
      adtblMain.TableName := sTable;
      adtblMain.Connection := conMain;
      adtblMain.Active := True;

      // Misc
      dsMain.DataSet := adtblMain;

      DBGrid1.DataSource := dsMain;
      DBGrid1.Refresh;
      DBGrid1.Columns.RebuildColumns;
      // Adjust Column Widths
      DBGrid1.Columns[0].Width := 60;
      for I := 1 to DBGrid1.Columns.Count - 1 do
        begin
          DBGrid1.Columns[I].Width := 120;
        end;

      // Import Connection String Information from TextFile;
      lbledtProvider.Clear;
      lbledtUserID.Clear;
      lbledtDataSource.Clear;
      lbledtMode.Clear;
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
            lbledtProvider.Text := sProvider;
            lbledtUserID.Text := sUserID;
            lbledtDataSource.Text := sDataSource;
            lbledtMode.Text := sMode;
            lbledtSysDB1.Text := sSystemDatabase;
            lbledtRegPath.Text := sRegistryPath;
            lbledtDBpass.Text := sDatabasePassword;
            lbledtEngTyp.Text := sEngineType;
            lbledtLMode.Text := sDatabaseLockingMode;
            lbledtPBulk.Text := sGlobalPartialBulkOps;
            lbledtBTrans.Text := sGlobalBulkTransactions;
            lbledtNPassw.Text := sNewDatabasePassword;
            lbledtSysDB.Text := sCreateSystemDatabase;
            lbledtEncrDB.Text := sEncryptDatabase;
        end;
      CloseFile(txtFile);

      // Show Connection Status of conMain
      redConnectionProp.Clear;
      if conMain.Connected = True  then
        begin
          redConnectionProp.Lines.Add('Connection Connected: True');
        end
      else
        begin
          redConnectionProp.Lines.Add('Connection Connected: False');
        end;

      // Show Connection Timeout of conMain
      redConnectionProp.Lines.Add('Connection Timeout: ' +
       IntToStr(conMain.ConnectionTimeout));

       // Disable Search Button on Start
       btnSearchDatabase.Enabled := False;

      // Display Connection String in RichEdit
      redConnectionString.Clear;
      redConnectionString.Lines.Add(conMain.ConnectionString);

      // ConUser
      conUser.Connected := False;
      conUser.ConnectionString := sConStrUser;

      // Reconnect conMain
      conUser.Connected := True;

      // Refresh Table
      AssignFile(txtTableUser, 'Table_Name_User.txt');
      Reset(txtTableUser);
      while not Eof(txtTableUser) do
        begin
          Readln(txtTableUser, sTableUser);
        end;
      CloseFile(txtTableUser);
      lbledtUserTableName.Text := sTableUser;

      // Fill adoTable
      adtblUser.Active := False;
      adtblUser.TableName := sTableUser;
      adtblUser.Connection := conUser;
      adtblUser.Active := True;

      // Misc
      dsUser.DataSet := adtblUser;

      dbgrdUser.DataSource := dsUser;
      dbgrdUser.Refresh;
      dbgrdUser.Columns.RebuildColumns;
      // Adjust Column Widths
      dbgrdUser.Columns[0].Width := 60;
      for I := 1 to dbgrdUser.Columns.Count - 1 do
        begin
          dbgrdUser.Columns[I].Width := 120;
        end;

      // Import Connection String Information from TextFile;
      lbledtUserProvider.Clear;
      lbledtUserUserID.Clear;
      lbledtUserDataSource.Clear;
      lbledtUserMode.Clear;
      if not FileExists('Connection_String_User.txt') then
        begin
          MessageDlg('Cannot find Connection String File' + #13 +
          'It either does not exist, or is missing', mtError, [mbOK], 0);
        end
      else
        begin
          AssignFile(txtTableUser, 'Connection_String_User.txt');
          Reset(txtTableUser);
          while not Eof(txtTableUser) do
            begin
              Readln(txtTableUser, sLine);
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
            end;
            lbledtUserProvider.Text := sProvider;
            lbledtUserUserID.Text := sUserID;
            lbledtUserDataSource.Text := sDataSource;
            lbledtUserMode.Text := sMode;

        end;
      CloseFile(txtTableUser);

      // Show Connection Status of conMain
      redUserConnectionString.Clear;
      redUserConInfo.Clear;

      if conUser.Connected = True  then
        begin
          redUserConInfo.Lines.Add('Connection Connected: True');
        end
      else
        begin
          redUserConInfo.Lines.Add('Connection Connected: False');
        end;

      // Show Connection Timeout of conMain
      redUserConInfo.Lines.Add('Connection Timeout: ' +
       IntToStr(conUser.ConnectionTimeout));

       // Disable Search Button on Start
       btnSearchDatabase.Enabled := False;

      // Display Connection String in RichEdit
      redUserConnectionString.Clear;
      redUserConnectionString.Lines.Add(conUser.ConnectionString);
    end
  else
    begin
      frmFirst.Visible := True;
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  txtFile1 : TextFile;
  iPos : Integer;
  sLine : string;
  sProductType, sKey, sContact, sEmail, sStatus, sDOL : string;
  txtLoc : TextFile;
  sLineLoc : string;
begin
    // Caption
    frmMain.Caption := 'Ibex Library';

   // Get Activation File Location
   if not FileExists('Act_File_Location.txt') then
    begin
      MessageDlg('Cannot Find Activation File Location' + #13 +
      'The Application will now exit', mtError, [mbOK], 0);
      Application.Terminate;
    end
   else
    begin
      AssignFile(txtLoc, 'Act_File_Location.txt');
      Reset(txtLoc);
      while not Eof(txtLoc) do
        begin
          Readln(txtLoc, sLineLoc);
        end;
      CloseFile(txtLoc);
    end;

  // Verify activation status and adjust menu title
  if not FileExists(sLineLoc) then
    begin
      sStatus := 'Unactivated';
      Exit;
    end
  else
    begin
      AssignFile(txtFile1, sLineLoc);
      Reset(txtFile1);

      while not Eof(txtFile1) do
        begin
          Readln(txtFile1, sLine);
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
        if (sKey = '') or (Length(sKey) < 19) then
          begin
            sStatus := 'Unactivated';
          end;

        if sStatus = 'Unactivated' then
          begin
            frmMain.Caption := 'Ibex Library ' + sProductType + ' - Unactivated Product';
            btnSearchDatabase.Enabled := False;
            cbbSearch.Enabled := False;
            edtSearchDatabase.Enabled := False;
            tbsDetailedAnalysis.Enabled := False;
            DBNavigator1.Enabled := False;
          end
        else
          if sStatus = 'Activated' then
            begin
              frmMain.Caption := 'Ibex Library ' + sProductType;
              btnSearchDatabase.Enabled := True;
              cbbSearch.Enabled := True;
              edtSearchDatabase.Enabled := True;
              tbsDetailedAnalysis.Enabled := True;
              DBNavigator1.Enabled := True;
            end;
    end;
  CloseFile(txtFile1);

  // Get Theme Information and Set to Form
  if not FileExists('Theme.txt') then
    begin
      MessageDlg('Cannot Locate "Theme.txt" theme file', mtError,
      [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFileTheme, 'Theme.txt');
      Reset(txtFileTheme);
      while not Eof(txtFileTheme) do
        begin
          Readln(txtFileTheme, sThemeLine);
          sTheme := sThemeLine;
          TStyleManager.TrySetStyle(sTheme);
        end;
    end;
  CloseFile(txtFileTheme);

  // Status Bar Information
  case pgcMain.ActivePageIndex of
   0: stsbr1.Panels[0].Text := '[' + IntToStr(pgcMain.ActivePageIndex) + ']' + ' Library';
   1: stsbr1.Panels[0].Text := '[' + IntToStr(pgcMain.ActivePageIndex) +  ']' + ' User Management';
   2: stsbr1.Panels[0].Text := '[' + IntToStr(pgcMain.ActivePageIndex) +  ']' + ' Detailed Analysis';
   3: stsbr1.Panels[0].Text := '[' + IntToStr(pgcMain.ActivePageIndex) +  ']' + ' Database Management';
  end;

  stsbr1.Panels[2].Text := DateToStr(Now);
  stsbr1.Panels[3].Text := TimeToStr(Now);
end;

procedure TfrmMain.Help2Click(Sender: TObject);
begin
  // Show Help Documentation Form
  frmHelp.Show;
end;

procedure TfrmMain.IssueBook3Click(Sender: TObject);
begin
  // Show Form - Menu
  frmIssue.Show;
end;

procedure TfrmMain.IssueBook4Click(Sender: TObject);
begin
  // Return Book
  frmReturn.Show;
end;

procedure TfrmMain.Library3Click(Sender: TObject);
begin
  // View Library
  tbsLibrary.Show;
end;

procedure TfrmMain.LibraryDatabase1Click(Sender: TObject);
begin
  // Library Database Show
  tbsDatabaseMan.Show;
  tbsLibraryMan.Show;
end;

procedure TfrmMain.LibraryDatabase2Click(Sender: TObject);
begin
  // User Database Show
  tbsDatabaseMan.Show;
  tbsUserMan.Show;
end;

procedure TfrmMain.LibraryDatabaseConnection1Click(Sender: TObject);
begin
  // Show New Connection
  frmSettings.Show;
  frmSettings.tbsDatabase.Show;
  frmSettings.btnNewConnection.Default := True;
end;

procedure TfrmMain.ools2Click(Sender: TObject);
begin
 // Menu Settings
 frmSettings.Show;
end;

procedure TfrmMain.pgcLibraryChange(Sender: TObject);
begin
  // On Tab Change
  if tbsItemInfo.Visible = True then
    begin
      cbbSearch.Enabled := False;
      edtSearchDatabase.Enabled := False;
      btnSearchDatabase.Enabled := False;
      DBNavigator1.Enabled := False;
    end
  else
  if tbsDatabase.Visible = True then
    begin
      cbbSearch.Enabled := True;
      edtSearchDatabase.Enabled := True;
      btnSearchDatabase.Enabled := True;
      DBNavigator1.Enabled := True;
    end;
end;

procedure TfrmMain.pgcLibraryChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  // On Changing Tabs
  if tbsItemInfo.Visible = True then
    begin
      cbbSearch.Enabled := False;
      edtSearchDatabase.Enabled := False;
      btnSearchDatabase.Enabled := False;
      DBNavigator1.Enabled := False;
    end
  else
  if tbsDatabase.Visible = True then
    begin
      cbbSearch.Enabled := True;
      edtSearchDatabase.Enabled := True;
      btnSearchDatabase.Enabled := True;
      DBNavigator1.Enabled := True;
    end;
end;

procedure TfrmMain.pgcMainChange(Sender: TObject);
begin
  // Status Bar Information
  case pgcMain.ActivePageIndex of
   0: stsbr1.Panels[0].Text := '[' + IntToStr(pgcMain.ActivePageIndex) + ']' + ' Library';
   1: stsbr1.Panels[0].Text := '[' + IntToStr(pgcMain.ActivePageIndex) +  ']' + ' User Management';
   2: stsbr1.Panels[0].Text := '[' + IntToStr(pgcMain.ActivePageIndex) +  ']' + ' Detailed Analysis';
   3: stsbr1.Panels[0].Text := '[' + IntToStr(pgcMain.ActivePageIndex) +  ']' + ' Database Management';
  end;
  stsbr1.Panels[1].Text := '';
end;

procedure TfrmMain.Statistics1Click(Sender: TObject);
begin
  // Produce and Show Statistics Message
  if tbsLibrary.Showing = True then
    begin
      MessageDlg('Library Database Statistics' + #13 +
      'Book Count: ' + IntToStr(adtblMain.RecordCount) + #13 +
      'Library Size: ' + IntToStr(adtblMain.RecordSize) + #13 +
      'Cache Size: ' + IntToStr(adtblMain.CacheSize) + #13 +
      'Field Count: ' + IntToStr(adtblMain.FieldCount), mtInformation, [mbOK], 0);
    end
  else
  if tbsUser.Showing = True then
    begin
       MessageDlg('User Database Statistics' + #13 +
      'User Count: ' + IntToStr(adtblUser.RecordCount) + #13 +
      'Database Size: ' + IntToStr(adtblUser.RecordSize) + #13 +
      'Cache Size: ' + IntToStr(adtblUser.CacheSize) + #13 +
      'Field Count: ' + IntToStr(adtblUser.FieldCount), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmMain.Statistics2Click(Sender: TObject);
begin
    // Home
  tbsLibrary.Show;
  tbsDatabase.Show;
end;

procedure TfrmMain.stsbr1Click(Sender: TObject);
begin
  stsbr1.Panels[3].Text := TimeToStr(Now);
end;

procedure TfrmMain.ToolButton10Click(Sender: TObject);
var
  iMessage2 : Integer;
begin
  // Remove User
  iMessage2 := MessageDlg('Confirm User Removal?', mtWarning, mbYesNo, 0);
  if iMessage2 = mrYes then
    begin
      adtblUser.Delete;
    end
  else
  if iMessage2 = mrNo then
    begin
      Exit;
    end;
end;

procedure TfrmMain.ToolButton12Click(Sender: TObject);
begin
  // Show Settings Form
  frmSettings.Show;
end;

procedure TfrmMain.ToolButton13Click(Sender: TObject);
begin
  // Produce and Show Statistics Message
  if tbsLibrary.Showing = True then
    begin
      MessageDlg('Library Database Statistics' + #13 +
      'Book Count: ' + IntToStr(adtblMain.RecordCount) + #13 +
      'Library Size: ' + IntToStr(adtblMain.RecordSize) + #13 +
      'Cache Size: ' + IntToStr(adtblMain.CacheSize) + #13 +
      'Field Count: ' + IntToStr(adtblMain.FieldCount), mtInformation, [mbOK], 0);
    end
  else
  if tbsUser.Showing = True then
    begin
       MessageDlg('User Database Statistics' + #13 +
      'User Count: ' + IntToStr(adtblUser.RecordCount) + #13 +
      'Database Size: ' + IntToStr(adtblUser.RecordSize) + #13 +
      'Cache Size: ' + IntToStr(adtblUser.CacheSize) + #13 +
      'Field Count: ' + IntToStr(adtblUser.FieldCount), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmMain.ToolButton14Click(Sender: TObject);
begin
  // Home
  tbsLibrary.Show;
  tbsDatabase.Show;
end;

procedure TfrmMain.ToolButton15Click(Sender: TObject);
begin
  // Close
  Application.Terminate;
end;

procedure TfrmMain.ToolButton1Click(Sender: TObject);
begin
  // Show Add Book Wizard
  frmAdd.Show;
end;

procedure TfrmMain.ToolButton2Click(Sender: TObject);
var
  iMessage : Integer;
begin
  // Remove Book
   //sRemoveBook := adtblMain['Title'];
   //adtblMain.Delete;
    // Remove User
  iMessage := MessageDlg('Confirm Book Removal?', mtWarning, mbYesNo, 0);
  if iMessage = mrYes then
    begin
      adtblMain.Delete;
    end
  else
  if iMessage = mrNo then
    begin
      Exit;
    end;
end;

procedure TfrmMain.ToolButton4Click(Sender: TObject);
begin
  // Show Form
  frmIssue.Show;
end;

procedure TfrmMain.ToolButton5Click(Sender: TObject);
begin
  // Return Book
  frmReturn.Show;
end;

procedure TfrmMain.ToolButton7Click(Sender: TObject);
begin
  // Refresh Database Table
  if tbsLibrary.Showing = True then
    begin
      adtblMain.Refresh;
    end
  else
  if tbsUser.Showing = True then
    begin
      adtblUser.Refresh;
    end;
end;

procedure TfrmMain.ToolButton8Click(Sender: TObject);
begin
  // Show Help Documentation Form
  frmHelp.Show;
end;

procedure TfrmMain.ToolButton9Click(Sender: TObject);
begin
  // Add User
  frmAddUser.Show;
end;

procedure TfrmMain.UserDatabaseConnection1Click(Sender: TObject);
begin
  // Show Connection Settings
  frmSettings.Show;
  frmSettings.tbsDatabase.Show;
  frmSettings.btnNewUserD.Default := True;
end;

procedure TfrmMain.UserManagement1Click(Sender: TObject);
begin
  // View User Management
  tbsUserMan.Show;
end;

end.
