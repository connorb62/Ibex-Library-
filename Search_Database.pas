unit Search_Database;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, Grids, StdCtrls;

type
  TfrmSearch = class(TForm)
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

uses
  Main_Unit;

{$R *.dfm}

procedure TfrmSearch.FormActivate(Sender: TObject);
begin
  
  // Populate Stringgrid
  with StringGrid1 do
    begin
      ColCount := 3;
      FixedCols := 0;
      RowCount := 2;
      FixedRows := 1;
      Cells[0, 0] := 'Search Parameter';
      DefaultColWidth := 200;
      Cells[1, 0] := 'Keyword';
      Cells[2, 0] := 'Results';
    end;
end;

procedure TfrmSearch.ToolButton1Click(Sender: TObject);
var
  K : Integer;
begin
  // Close Form
  for K := 0 to StringGrid2.ColCount - 1 do
    StringGrid2.Cols[K].Clear;

  frmSearch.Close;
end;

end.
