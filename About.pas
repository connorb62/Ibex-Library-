unit About;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TfrmAbout = class(TForm)
    pnlTop: TPanel;
    ToolBar1: TToolBar;
    Shape1: TShape;
    tlbtnClose: TToolButton;
    imgMain: TImage;
    imgSecond: TImage;
    shpMain: TShape;
    redMain: TRichEdit;
    procedure tlbtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses
  Main_Unit;

{$R *.dfm}

procedure TfrmAbout.tlbtnCloseClick(Sender: TObject);
begin
  frmAbout.Close;
end;

end.
