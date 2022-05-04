program IbexLibrary;

uses
  Forms,
  Main_Unit in 'Main_Unit.pas' {frmMain},
  Search_Database in 'Search_Database.pas' {frmSearch},
  Add_Book in 'Add_Book.pas' {frmAdd},
  Settings in 'Settings.pas' {Form1},
  New_Settings in 'New_Settings.pas' {frmSettings},
  Help_Docs in 'Help_Docs.pas' {frmHelp},
  Vcl.Themes,
  Vcl.Styles,
  About in 'About.pas' {frmAbout},
  New_Connection in 'New_Connection.pas' {frmNewConnection},
  Issue_Book in 'Issue_Book.pas' {frmIssue},
  Make_Report in 'Make_Report.pas' {frmReport},
  FirstHelp in 'FirstHelp.pas' {frmFirst},
  Add_User in 'Add_User.pas' {frmAddUser},
  Return_Book in 'Return_Book.pas' {frmReturn};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ibex Library Management System';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSearch, frmSearch);
  Application.CreateForm(TfrmAdd, frmAdd);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmNewConnection, frmNewConnection);
  Application.CreateForm(TfrmIssue, frmIssue);
  Application.CreateForm(TfrmReport, frmReport);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.CreateForm(TfrmAddUser, frmAddUser);
  Application.CreateForm(TfrmReturn, frmReturn);
  Application.Run;
end.
