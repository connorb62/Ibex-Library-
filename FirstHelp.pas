unit FirstHelp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmFirst = class(TForm)
    pnlTop: TPanel;
    pnlMain: TPanel;
    pnlCentre: TPanel;
    pnlBase: TPanel;
    btnNext: TButton;
    btnGetStarted: TButton;
    btnClose: TButton;
    imgMain: TImage;
    procedure btnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnGetStartedClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFirst: TfrmFirst;

implementation

uses
  Main_Unit, New_Settings, New_Connection;

{$R *.dfm}

procedure TfrmFirst.btnCloseClick(Sender: TObject);
begin
  // Close
  Application.Terminate;
end;

procedure TfrmFirst.btnGetStartedClick(Sender: TObject);
begin
  frmSettings.Show;
  frmSettings.tbsDatabase.Show;
  frmSettings.btnNewConnection.Default := True;
  frmFirst.Close;
end;

procedure TfrmFirst.btnNextClick(Sender: TObject);
begin
  imgMain.Picture.LoadFromFile('steps.png');
end;

procedure TfrmFirst.FormActivate(Sender: TObject);
begin
  // Activate, show correct images

end;

end.
