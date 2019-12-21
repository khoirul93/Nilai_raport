unit U_input_siswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, Mask, sMaskEdit, sCustomComboEdit, sTooledit, sEdit,
  sMemo, sComboBox, sRadioButton, Buttons, sBitBtn, sGroupBox, ExtCtrls, sPanel,
  ExtDlgs, sDialogs, sButton;

type
  Tf_input_siswa = class(TForm)
    NIS: TsLabel;
    edit_nis: TsEdit;
    Nama: TsLabel;
    edit_nama: TsEdit;
    sLabel1: TsLabel;
    edit_tempat: TsEdit;
    edit_tgl: TsDateEdit;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    cb_agama: TsComboBox;
    sLabel4: TsLabel;
    edit_wali: TsEdit;
    sLabel5: TsLabel;
    edit_wali_pkrjaan: TsEdit;
    sLabel6: TsLabel;
    edit_alamat: TsMemo;
    sLabel7: TsLabel;
    cb_kelas: TsComboBox;
    sLabel8: TsLabel;
    edit_angakatan: TsEdit;
    sGroupBox1: TsGroupBox;
    sPanel1: TsPanel;
    sGroupBox2: TsGroupBox;
    btn_edit: TsBitBtn;
    btn_simpan: TsBitBtn;
    btn_foto: TsButton;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    sRadioGroup1: TsRadioGroup;
    rb_laki: TsRadioButton;
    rb_perempuan: TsRadioButton;
    procedure FormShow(Sender: TObject);
    procedure btn_fotoClick(Sender: TObject);
    procedure btn_simpanClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure edit_nisKeyPress(Sender: TObject; var Key: Char);
    procedure edit_angakatanKeyPress(Sender: TObject; var Key: Char);
    procedure edit_namaKeyPress(Sender: TObject; var Key: Char);
    procedure edit_tempatKeyPress(Sender: TObject; var Key: Char);
    procedure edit_waliKeyPress(Sender: TObject; var Key: Char);
    procedure edit_wali_pkrjaanKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
    procedure simpansiswa;
    var
    foto,jk:string;
  end;

var
  f_input_siswa: Tf_input_siswa;

implementation

uses U_DM, U_data_siswa;

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
procedure Tf_input_siswa.bersih;
begin
 edit_nis.Clear;
// edit_nis.SetFocus;
 edit_nama.Clear;
 edit_tempat.Clear;
 edit_tgl.Date:=Now;
  edit_wali.Clear;
  edit_wali_pkrjaan.Clear;
  edit_alamat.Clear;
  edit_angakatan.Clear;
  cb_agama.Text:='--Pilih--';
  cb_kelas.Text:='--Pilih--';
  SetCueBanner(edit_nis,'MasukKan NIS');
  SetCueBanner(edit_nama,'Masukkan Nama Siswa');
  SetCueBanner(edit_tempat,'Masukkan Tempat Lahir');
  SetCueBanner(edit_wali,'Masukkan Nama Wali');
  SetCueBanner(edit_wali_pkrjaan,'Masukkan Pekerjaan Wali');
  SetCueBanner(edit_angakatan,'Masukkan Tahun Masuk');
end;

procedure Tf_input_siswa.simpansiswa;
begin
 with DM.q_siswa do
 begin
   Active:=False;
   SQL.Text:='select * from siswa';
   Active:=True;
 end;
 try
   DM.koneksi.BeginTrans;
   with DM.q_siswa do
   begin
     Active:=True;
     Close;
     SQL.Clear;
     SQL.Add('insert into siswa values ('+QuotedStr(edit_nis.Text)+','+QuotedStr(edit_nama.Text)+','+QuotedStr(edit_tempat.Text)+','+QuotedStr(FormatDateTime('yyyy/mm/dd',edit_tgl.Date))+','+QuotedStr(jk)+','+QuotedStr(cb_agama.Text)+','+QuotedStr(edit_wali.Text)+','+QuotedStr(edit_wali_pkrjaan.Text)+','+QuotedStr(edit_alamat.Text)+','+QuotedStr(edit_angakatan.Text)+','+QuotedStr(cb_kelas.Text)+','+QuotedStr(foto)+')');
     ExecSQL;
   end;
   DM.koneksi.CommitTrans;
   ShowMessage('Data Siswa Tersimpan');
 except
  DM.koneksi.RollbackTrans;
  ShowMessage('Data Siswa Gagal di Simpan');
 end;
end;

procedure Tf_input_siswa.btn_editClick(Sender: TObject);
begin
if (rb_laki.Checked=True) then
jk:='Laki-laki'
else if (rb_perempuan.Checked=True) then
     jk:='Perempuan' ;
if edit_nis.Text='' then
begin
    Application.MessageBox('Data NIS Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
    edit_nis.SetFocus;
end
else if edit_nama.Text='' then
     begin
       Application.MessageBox('Data Nama Siswa Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
       edit_nama.SetFocus;
     end
     else if edit_tempat.Text='' then
          begin
            Application.MessageBox('Data Tempat Lahir Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
            edit_tempat.SetFocus;
          end
          else if cb_agama.Text='--Pilih--' then
               begin
                 Application.MessageBox('Pilih Dahulu Agama Siswa','Warning',+MB_OK+MB_ICONWARNING);
                 cb_agama.SetFocus;
               end
               else if edit_wali.Text='' then
                    begin
                      Application.MessageBox('Data Wali Siswa Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
                      edit_wali.SetFocus;
                    end
                    else if edit_wali_pkrjaan.Text='' then
                         begin
                           Application.MessageBox('Data Pekerjaan Wali Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
                           edit_wali_pkrjaan.SetFocus;
                         end
                         else if edit_alamat.Text='' then
                         begin
                         Application.MessageBox('Data Alamat Siswa Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
                         edit_alamat.SetFocus;
                         end
                         else if cb_kelas.Text='--Pilih--' then
                              begin
                                Application.MessageBox('Pilih Dahulu Kelas Siswa','Warning',+MB_OK+MB_ICONWARNING);
                                cb_kelas.SetFocus;
                              end
                            else if edit_angakatan.Text='' then
                                   begin
                                   Application.MessageBox('Data Angkatan Siswa Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
                                    edit_angakatan.SetFocus;
                                   end

else
begin
  with DM.q_siswa do
  begin
    Active:=False;
    SQL.Text:='select * from siswa';
    Active:=True;
  end;
  try
    DM.koneksi.BeginTrans;
    with DM.q_siswa do
    begin
      Active:=True;
      Close;
      SQL.Clear;
      SQL.Text:='update siswa set siswa_nama='+QuotedStr(edit_nama.Text)+',siswa_tptlahir='+QuotedStr(edit_tempat.Text)+',siswa_tgllahir='+QuotedStr(FormatDateTime('yyyy/mm/dd',edit_tgl.Date))+',siswa_jk='+QuotedStr(jk)+',siswa_agama='+QuotedStr(cb_agama.Text)+',siswa_wali='+QuotedStr(edit_wali.Text)+',siswa_walipkrj='+QuotedStr(edit_wali_pkrjaan.Text)+',siswa_alamat='+QuotedStr(edit_alamat.Text)+',siswa_tahun='+QuotedStr(edit_angakatan.Text)+',kelas_kd='+QuotedStr(cb_kelas.Text)+',foto='+QuotedStr(foto)+'where siswa_nis='+QuotedStr(edit_nis.Text);
      ExecSQL;
    end;
    DM.koneksi.CommitTrans;
    ShowMessage('Data Siswa di Rubah');
  except
  DM.koneksi.RollbackTrans;
  ShowMessage('Data Siswa Gagal di Runah');


  end;
  F_data_siswa.tampil;
  f_input_siswa.Close;
end;
end;

procedure Tf_input_siswa.btn_fotoClick(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
begin
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  foto:=OpenPictureDialog1.FileName;
end;
end;

procedure Tf_input_siswa.btn_simpanClick(Sender: TObject);
begin
if (rb_laki.Checked=True) then
jk:='Laki-laki'
else if (rb_perempuan.Checked=True) then
     jk:='Perempuan' ;
if edit_nis.Text='' then
begin
    Application.MessageBox('Data NIS Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
    edit_nis.SetFocus;
end
else if edit_nama.Text='' then
     begin
       Application.MessageBox('Data Nama Siswa Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
       edit_nama.SetFocus;
     end
     else if edit_tempat.Text='' then
          begin
            Application.MessageBox('Data Tempat Lahir Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
            edit_tempat.SetFocus;
          end
          else if cb_agama.Text='--Pilih--' then
               begin
                 Application.MessageBox('Pilih Dahulu Agama Siswa','Warning',+MB_OK+MB_ICONWARNING);
                 cb_agama.SetFocus;
               end
               else if edit_wali.Text='' then
                    begin
                      Application.MessageBox('Data Wali Siswa Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
                      edit_wali.SetFocus;
                    end
                    else if edit_wali_pkrjaan.Text='' then
                         begin
                           Application.MessageBox('Data Pekerjaan Wali Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
                           edit_wali_pkrjaan.SetFocus;
                         end
                         else if edit_alamat.Text='' then
                         begin
                         Application.MessageBox('Data Alamat Siswa Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
                         edit_alamat.SetFocus;
                         end
                         else if cb_kelas.Text='--Pilih--' then
                              begin
                                Application.MessageBox('Pilih Dahulu Kelas Siswa','Warning',+MB_OK+MB_ICONWARNING);
                                cb_kelas.SetFocus;
                              end
                              else if edit_angakatan.Text='' then
                                   begin
                                     Application.MessageBox('Data Angkatan Siswa Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
                                     edit_angakatan.SetFocus;
                                  end

else
begin
  with dm.q_siswa do
  begin
    Active:=False;
    Close;
    SQL.Clear;
    SQL.Text:='select * from siswa where siswa_nis='+QuotedStr(edit_nis.Text);
    Active:=True;
  end;
  if DM.q_siswa.IsEmpty then
  begin
    simpansiswa;
  end
  else
  ShowMessage('NIS Sudah di Gunakan');
   F_data_siswa.tampil;
   f_input_siswa.Close;
end;


end;

procedure Tf_input_siswa.edit_angakatanKeyPress(Sender: TObject; var Key: Char);
begin
{if not (Key in['0'..'9',#8,#13,#32]) then
begin
  Key:=#0;
  ShowMessage('Inputan Tahun Angkatan Hanya Angka');

end; }
end;

procedure Tf_input_siswa.edit_namaKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['a'..'z','A'..'Z',#8,#13,#32]) then
begin
  Key:=#0;
  ShowMessage('Inputan Nama Siswa Hanya Huruf');
end;
end;

procedure Tf_input_siswa.edit_nisKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,#13,#32]) then
begin
  Key:=#0;
  ShowMessage('Inputan NIS Hanya Angka');

end;
end;

procedure Tf_input_siswa.edit_tempatKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['a'..'z','A'..'Z',#8,#13,#32]) then
begin
  Key:=#0;
  ShowMessage('Inputan Tempat Lahir Hanya Huruf');
end;
end;

procedure Tf_input_siswa.edit_waliKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['a'..'z','A'..'Z',#8,#13,#32]) then
begin
  Key:=#0;
  ShowMessage('Inputan Nama Wali Hanya Huruf');
end;
end;

procedure Tf_input_siswa.edit_wali_pkrjaanKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in['a'..'z','A'..'Z',#8,#13,#32]) then
begin
  Key:=#0;
  ShowMessage('Inputan Pekerjaan Wali Hanya Huruf');
end;
end;

procedure Tf_input_siswa.FormShow(Sender: TObject);
begin
bersih;
begin
  DM.q_kelas.Active:=False;
  DM.q_kelas.SQL.Clear;
  DM.q_kelas.SQL.Add('select * from kelas');
  DM.q_kelas.Active:=True;
  cb_kelas.Items.Clear;
  while not DM.q_kelas.Eof do
  begin
    cb_kelas.Items.Add(DM.q_kelas.FieldByName('kelas_kd').AsString);
    DM.q_kelas.Next;
  end;
    end;
end;

end.
