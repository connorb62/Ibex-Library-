unit Add_User;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmAddUser = class(TForm)
    pnlMain: TPanel;
    chkClose: TCheckBox;
    pnlBase: TPanel;
    btnAdd: TButton;
    btnCancel: TButton;
    grpMain: TGroupBox;
    lbledtGrade: TLabeledEdit;
    lbledtClass: TLabeledEdit;
    lbledtSurname: TLabeledEdit;
    lbledtName: TLabeledEdit;
    lbledtUserID: TLabeledEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddUser: TfrmAddUser;

implementation

uses
  Main_Unit;

{$R *.dfm}

procedure TfrmAddUser.btnAddClick(Sender: TObject);
begin
  // Insert Information To Database Table
  frmMain.adtblUser.Insert;
  frmMain.adtblUser['Name'] := lbledtName.Text;
  frmMain.adtblUser['Surname'] := lbledtSurname.Text;
  frmMain.adtblUser['Grade'] := lbledtGrade.Text;
  frmMain.adtblUser['Class'] := lbledtClass.Text;
  frmMain.adtblUser['UserID'] := lbledtUserID.Text;
  frmMain.adtblUser['Usage History'] := 'N/A';
  frmMain.adtblUser.Post;

  // Clear Edits for Next Book
  lbledtName.Clear;
  lbledtSurname.Clear;
  lbledtGrade.Clear;
  lbledtClass.Clear;
  lbledtUserID.Clear;

  // Multiple Users Option
  if chkClose.Checked = False then
    begin
      frmAddUser.Close;
    end
  else
    begin
      frmMain.adtblUser.Insert;
    end;
end;

procedure TfrmAddUser.btnCancelClick(Sender: TObject);
begin
  //Close
  frmAddUser.Close;
end;

procedure TfrmAddUser.FormActivate(Sender: TObject);
begin
  // Set Focus to Name Edit on Form Activate
  lbledtName.SetFocus;
  frmMain.adtblUser.Active := True;
  frmMain.adtblUser.Insert;
end;

end.
