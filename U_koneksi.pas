unit U_koneksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sEdit, Buttons, sBitBtn, sLabel,
  sGroupBox;

type
  Tf_koneksi = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sPanel1: TsPanel;
    sLabel3: TsLabel;
    edit_server: TsEdit;
    edit_database: TsEdit;
    sLabel4: TsLabel;
    edit_username: TsEdit;
    sLabel5: TsLabel;
    edit_password: TsEdit;
    sGroupBox2: TsGroupBox;
    btn_set: TsBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btn_setClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
  end;

var
  f_koneksi: Tf_koneksi;

implementation

uses U_DM, U_menu;

{$R *.dfm}
function SetCueBanner(const Edit: TEdit; const Placeholder: String): Boolean;
const
  EM_SETCUEBANNER = $1501;
var
  UniStr: WideString;
begin
  UniStr := Placeholder;
  SendMessage(Edit.Handle, EM_SETCUEBANNER, WParam(True),LParam(UniStr));
  Result := GetLastError() = ERROR_SUCCESS;
end;

procedure Tf_koneksi.bersih;
begin
 edit_server.Clear;
 edit_server.SetFocus;
 edit_database.Clear;
 edit_username.Clear;
 edit_password.Clear;
  SetCueBanner(edit_server,'Masukkan Server Komputer');
  SetCueBanner(edit_database,'Masukkan Nama DataBase');
  SetCueBanner(edit_username,'Masukkan Username Server');
  SetCueBanner(edit_password,'Masukkan Password Server');
end;

procedure Tf_koneksi.btn_setClick(Sender: TObject);
var NamaFile: String;
List: TStringList;
begin
 if (edit_server.Text='') OR (edit_database.Text='')  then
begin
ShowMessage('Periksa Inputan Server Atau Database !');
edit_server.SetFocus;
end
else
begin
  NamaFile :='koneksi';
  NamaFile := ChangeFileExt(NamaFile,'.ini');
  List := TStringList.Create;
  try
  List.NameValueSeparator:=':';
  List.Add('Path:Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID='+edit_username.Text+';password='+edit_password.Text+' ;Initial Catalog='+edit_database.Text+';Data Source='+edit_server.Text);
  try
  List.SaveToFile(NamaFile);
  ShowMessage('Tersimpan ke file:'#13 + NamaFile);
  bersih;
  except
  ShowMessage('Gagal Tulis File!');
  end;
  finally
  List.Free;
  end;
end;
end;

procedure Tf_koneksi.FormActivate(Sender: TObject);
begin
bersih;
end;

end.
