unit Add_Book;
{********** Add Book Wizard **********
  (C) 2022 Connor Bell - All Rights Reserved
  Development Date: 14 April 2022
  Development Location: Beukes Avenue, Highway Gardens

  Last Edited: 15 April 2022
  Contact
  cbell@jeppeboys.co.za
  +27 66 202 1724
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.FileCtrl, Vcl.Imaging.jpeg, Vcl.Samples.Spin;

type
  TfrmAdd = class(TForm)
    pnlBase: TPanel;
    btnAdd: TButton;
    btnCancel: TButton;
    lbledtTitle: TLabeledEdit;
    lbledtAuthor: TLabeledEdit;
    lbledtISBN: TLabeledEdit;
    lbledtCat: TLabeledEdit;
    lbledtGenre: TLabeledEdit;
    lbledtPubDate: TLabeledEdit;
    grpMain: TGroupBox;
    pnlMain: TPanel;
    lbledtPublisher: TLabeledEdit;
    FileListBox1: TFileListBox;
    lblImage: TLabel;
    chkImage: TCheckBox;
    chkClose: TCheckBox;
    spnCount: TSpinEdit;
    lblCopyCount: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdd: TfrmAdd;
  sFileName : string;

implementation

uses
  Main_Unit;

{$R *.dfm}

procedure TfrmAdd.btnAddClick(Sender: TObject);
begin
  if chkImage.Checked = True then
    begin
        frmMain.adtblMain['Image Name'] := 'noimage.jpg';
        FileListBox1.Enabled := False;
    end
  else
  if chkImage.Checked = False then
    begin
        frmMain.adtblMain['Image Name'] := FileListBox1.FileName;
    end;

  // Insert Information To Database Table
  frmMain.adtblMain['Title'] := lbledtTitle.Text;
  frmMain.adtblMain['Author'] := lbledtAuthor.Text;
  frmMain.adtblMain['ISBN'] := lbledtISBN.Text;
  frmMain.adtblMain['Publisher'] := lbledtPublisher.Text;
  frmMain.adtblMain['Date of Publication'] := lbledtPubDate.Text;
  frmMain.adtblMain['Database Entry Date'] := DateToStr(Now);
  frmMain.adtblMain['Genre'] := lbledtGenre.Text;
  frmMain.adtblMain['Category'] := lbledtCat.Text;
  frmMain.adtblMain['Copy Count'] := IntToStr(spnCount.Value);
  frmMain.adtblMain['Last User'] := 'N/A';
  frmMain.adtblMain['Usage History'] := 'N/A';
  frmMain.adtblMain['Report'] := '';
  frmMain.adtblMain['Image Name'] := sFileName;
  frmMain.adtblMain['In/Out'] := 'IN';
  frmMain.adtblMain.Post;
  // If No Image option is selected



  // Clear Edits for Next Book
  lbledtTitle.Clear;
  lbledtAuthor.Clear;
  lbledtISBN.Clear;
  lbledtCat.Clear;
  lbledtGenre.Clear;
  lbledtPubDate.Clear;
  lbledtPublisher.Clear;
  chkImage.Checked := False;

  // Multiple Books Option
  if chkClose.Checked = False then
    begin
      frmAdd.Close;
    end
  else
  if chkClose.Checked = True then
    begin
      frmMain.adtblMain.Insert;
    end;

end;

procedure TfrmAdd.btnCancelClick(Sender: TObject);
begin
  // Close on Cancel
  frmAdd.Close;
end;

procedure TfrmAdd.FileListBox1Click(Sender: TObject);
begin
  sFileName := FileListBox1.FileName;
end;

procedure TfrmAdd.FormActivate(Sender: TObject);
begin
  // Set Focus to Title Edit on Form Activate
  lbledtTitle.SetFocus;
  frmMain.adtblMain.Active := True;
  frmMain.adtblMain.Insert;
end;
end.
