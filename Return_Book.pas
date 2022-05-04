unit Return_Book;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmReturn = class(TForm)
    pnlTop: TPanel;
    chkIssueMulti: TCheckBox;
    tlbrMain1: TToolBar;
    tlbtnClose: TToolButton;
    tlbtnSep1: TToolButton;
    tlbtnReturn: TToolButton;
    dbgrdReturn: TDBGrid;
    grpOverview: TGroupBox;
    redMain: TRichEdit;
    procedure tlbtnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgrdReturnCellClick(Column: TColumn);
    procedure dbgrdReturnKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tlbtnReturnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReturn: TfrmReturn;

implementation

uses
  Main_Unit;

{$R *.dfm}

procedure TfrmReturn.dbgrdReturnCellClick(Column: TColumn);
begin
  // Overview Information
  redMain.Clear;
  redMain.Lines.Add('Selected Book: ' + frmMain.adtblMain['Title']);
  redMain.Lines.Add('ISBN: ' + frmMain.adtblMain['ISBN']);
end;

procedure TfrmReturn.dbgrdReturnKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Overview Information
  redMain.Clear;
  redMain.Lines.Add('Selected Book: ' + frmMain.adtblMain['Title']);
  redMain.Lines.Add('ISBN: ' + frmMain.adtblMain['ISBN']);
end;

procedure TfrmReturn.FormActivate(Sender: TObject);
var
  I : Integer;
begin
  for I := 1 to frmMain.adtblMain.RecordCount -1 do
    begin
      dbgrdReturn.Columns[I].Width := 120;
    end;
  dbgrdReturn.Columns[0].Width := 50;
end;

procedure TfrmReturn.tlbtnCloseClick(Sender: TObject);
begin
  // Close
  frmReturn.Close;
end;

procedure TfrmReturn.tlbtnReturnClick(Sender: TObject);
begin
  frmMain.adtblMain.Edit;
  frmMain.adtblMain['In/Out'] := 'IN';
  frmMain.adtblMain.Post;
end;

end.
