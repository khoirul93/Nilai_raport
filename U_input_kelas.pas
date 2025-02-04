unit U_input_kelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sComboBox, sLabel, sEdit, ExtCtrls,
  sPanel, sGroupBox;

type
  TF_input_kelas = class(TForm)
    sGroupBox1: TsGroupBox;
    sPanel1: TsPanel;
    Edit_nama: TsEdit;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sGroupBox2: TsGroupBox;
    btn_edit: TsBitBtn;
    btn_simpan: TsBitBtn;
    cb_wali: TsComboBox;
    edit_kd: TsEdit;
    sLabel2: TsLabel;
    sLabel4: TsLabel;
    sEdit1: TsEdit;
    procedure FormShow(Sender: TObject);
    procedure btn_simpanClick(Sender: TObject);
    procedure cb_waliClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
   procedure simpankel;
  end;

var
  F_input_kelas: TF_input_kelas;

implementation

uses U_DM, U_data_kelas;

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

procedure TF_input_kelas.bersih;
begin
Edit_nama.Clear;
 SetCueBanner(Edit_nama,'Masukkan Nama Kelas');
edit_kd.Clear;
//edit_kd.SetFocus;
cb_wali.Text:='--Pilih--' ;
 sEdit1.Clear;
sEdit1.Enabled:=False;

end;
procedure TF_input_kelas.btn_editClick(Sender: TObject);
begin
if edit_kd.Text='' then
begin
  Application.MessageBox('Data Kode Kelas Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
  edit_kd.SetFocus;
end
else if Edit_nama.Text='' then
begin
Application.MessageBox('Data Nama Kelas Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
     Edit_nama.SetFocus;
end

     else if cb_wali.Text='--Pilih--' then
          begin
             Application.MessageBox('Data Nip Wali Kelas Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
             cb_wali.SetFocus;
          end
else
begin
 with DM.q_kelas do
 begin
   Active:=False;
   SQL.Text:='select *from kelas';
   Active:=True
 end;
 try
    DM.koneksi.BeginTrans;
    with DM.q_kelas do
    begin
      Active:=True;
      Close;
      SQL.Clear;
      SQL.Text:='update kelas set kelas_nama='+QuotedStr(Edit_nama.Text)+',guru_nip='+QuotedStr(cb_wali.Text)+'where kelas_kd='+QuotedStr(edit_kd.Text);
      ExecSQL;
    end;
    DM.koneksi.CommitTrans;
    ShowMessage('Data Kelas Berhasil di Rubah');
 except
    DM.koneksi.RollbackTrans;
    ShowMessage('Data Kelas Gagal di Rubah');

 end;
   F_data_kelas.tampil;
  F_input_kelas.Close;

end;
end;

procedure TF_input_kelas.btn_simpanClick(Sender: TObject);
begin
if edit_kd.Text='' then
begin
  Application.MessageBox('Data Kode Kelas Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
  edit_kd.SetFocus;
end
else if Edit_nama.Text='' then
begin
Application.MessageBox('Data Nama Kelas Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
     Edit_nama.SetFocus;
end

     else if cb_wali.Text='--Pilih--' then
          begin
             Application.MessageBox('Data Nip Wali Kelas Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
             cb_wali.SetFocus;
          end
else
begin
  with DM.q_kelas do
  begin
    Active:=False;
    Close;
    SQL.Clear;
    SQL.Text:='Select * from kelas where kelas_kd='+QuotedStr(edit_kd.Text);
    Active:=True;
  end;
  if DM.q_kelas.IsEmpty then
  begin
    simpankel
  end
  else
  ShowMessage('Kode Kelas Sudah di Guanakan');

  F_data_kelas.tampil;
  F_input_kelas.Close;
end;

end;

procedure TF_input_kelas.simpankel;
begin
 with DM.q_kelas do
 begin
   Active:=False;
   SQL.Text:='select * from kelas';
   Active:=True;
 end;
 try
   DM.koneksi.BeginTrans;
   with DM.q_kelas do
   begin
     Active:=True;
     Close;
     SQL.Clear;
     SQL.Add('Insert into kelas values('+QuotedStr(edit_kd.Text)+','+QuotedStr(Edit_nama.Text)+','+QuotedStr(cb_wali.Text)+')');
     ExecSQL;
   end;
   DM.koneksi.CommitTrans;
   ShowMessage('Data kelas Tersimapan');
 except
       DM.koneksi.RollbackTrans;
       ShowMessage('Data Kelas Gagal di Simpan');

 end;

end;

procedure TF_input_kelas.cb_waliClick(Sender: TObject);
begin
DM.q_guru.Active:=False;
DM.q_guru.SQL.Clear;
DM.q_guru.SQL.Add('select guru_nama, guru_nip from guru')  ;
DM.q_guru.SQL.Add('where guru_nip='''+cb_wali.Text+'''');
DM.q_guru.Open;
sEdit1.Text:=DM.q_guru['guru_nama'];
end;

procedure TF_input_kelas.FormShow(Sender: TObject);
begin
bersih;
 DM.q_guru.Active:=False;
 DM.q_guru.SQL.Clear;
 DM.q_guru.SQL.Add('select * from guru') ;
 DM.q_guru.Active:=True;
 cb_wali.Items.Clear;
 while not DM.q_guru.Eof do
 begin
   cb_wali.Items.Add(DM.q_guru.FieldByName('guru_nip').AsString);
   DM.q_guru.Next;

 end;






end;

end.
