unit U_input_tgsajar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sEdit, sComboBox, sLabel, sGroupBox,
  ExtCtrls, sPanel;

type
  TF_input_tgsajar = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    cb_kdmapel: TsComboBox;
    sLabel2: TsLabel;
    cb_kelas: TsComboBox;
    sLabel3: TsLabel;
    edit_nmmapel: TsEdit;
    sLabel4: TsLabel;
    cb_semester: TsComboBox;
    sLabel5: TsLabel;
    edit_jlmhsiswa: TsEdit;
    sLabel6: TsLabel;
    cb_kdguru: TsComboBox;
    sLabel7: TsLabel;
    edit_namaguru: TsEdit;
    sGroupBox2: TsGroupBox;
    btn_edit: TsBitBtn;
    btn_simpan: TsBitBtn;
    sLabel8: TsLabel;
    edit_kdtgsajr: TsEdit;
    procedure FormShow(Sender: TObject);
    procedure cb_kdmapelClick(Sender: TObject);
    procedure cb_kdguruClick(Sender: TObject);
    procedure cb_kelasClick(Sender: TObject);
    procedure btn_simpanClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_dataClick(Sender: TObject);
    procedure Btn_kembaliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure bersih;
   procedure simpantgsajr;
  end;

var
  F_input_tgsajar: TF_input_tgsajar;

implementation

uses U_DM, U_data_tgsAjar;
procedure TF_input_tgsajar.bersih;
begin
edit_kdtgsajr.Clear;
//edit_kdtgsajr.SetFocus;
cb_kdmapel.Text:='--Pilih--';
edit_nmmapel.Clear;
edit_nmmapel.Enabled:=False;
cb_kdguru.Text:='--Pilih--';
edit_namaguru.Clear;
edit_namaguru.Enabled:=False;
cb_kelas.Text:='--Pilih--';
edit_jlmhsiswa.Clear;
edit_jlmhsiswa.Enabled:=False;
cb_semester.Text:='0';
cb_semester.Enabled:=False;

end;
procedure TF_input_tgsajar.simpantgsajr;
begin
with DM.q_tugasmengajar do
begin
  Active:=False;
  SQL.Text:='select * from tugasmengajar';
  Active:=True;
end;
try
  DM.koneksi.BeginTrans;
  with DM.q_tugasmengajar do
  begin
    Active:=True;
    Close;
    SQL.Clear;
    SQL.Add('insert into tugasmengajar values('+QuotedStr(edit_kdtgsajr.Text)+','+QuotedStr(cb_kdmapel.Text)+','+QuotedStr(edit_jlmhsiswa.Text)+','+QuotedStr(cb_kdguru.Text)+','+QuotedStr(cb_semester.Text)+','+QuotedStr(cb_kelas.Text)+')');
    ExecSQL;
  end;
  DM.koneksi.CommitTrans;
  ShowMessage('Data Tugas Mengajar Tersimpan');
except
   DM.koneksi.RollbackTrans;
   ShowMessage('Data Tugas Mengajar Gagal di Simpan');
end;

end;

{$R *.dfm}

procedure TF_input_tgsajar.btn_dataClick(Sender: TObject);
begin
F_data_tgsAjar.Show;
end;

procedure TF_input_tgsajar.btn_editClick(Sender: TObject);
begin
if edit_kdtgsajr.Text='' then
begin
   Application.MessageBox('Data Kode Tugas Mengajar Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
   edit_kdtgsajr.SetFocus;
end
else if cb_kdmapel.Text='--Pilih--' then
begin
  Application.MessageBox('Pilih Dahulu Kode Mata Pelajaran','Warning',+MB_OK+MB_ICONWARNING);
  cb_kdmapel.SetFocus;
end
else if cb_kdguru.Text='--Pilih--' then
begin
  Application.MessageBox('Pilih Dahulu Kode guru','Warning',+MB_OK+MB_ICONWARNING);
  cb_kdguru.SetFocus;
end
else if cb_kelas.Text='--Pilih--' then
     begin
       Application.MessageBox('Pilih Dahulu Kode Kelas','Warning',+MB_OK+MB_ICONWARNING);
       cb_kelas.SetFocus;
     end
else
begin
  with DM.q_tugasmengajar do
  begin
    Active:=False;
    SQL.Text:='select * from tugasmengajar';
    Active:=True;
  end;
  try
       DM.koneksi.BeginTrans;
       with DM.q_tugasmengajar do
       begin
         Active:=True;
         Close;
         SQL.Clear;
         SQL.Text:='update tugasmengajar set mapel_kd='+QuotedStr(cb_kdmapel.Text)+',siswa='+QuotedStr(edit_jlmhsiswa.Text)+',guru_nip='+QuotedStr(cb_kdguru.Text)+',tm_semester='+QuotedStr(cb_semester.Text)+',kelas_kd='+QuotedStr(cb_kelas.Text)+'where tm_kd='+QuotedStr(edit_kdtgsajr.Text);
         ExecSQL;
       end;
       DM.koneksi.CommitTrans;
       ShowMessage('Data Tugas Mengajar Berhasil di Rubah');
  except
       DM.koneksi.RollbackTrans;
       ShowMessage('Data Tugas Mengajar Gagal di Rubah');
  end;
 F_data_tgsAjar.tampil;
 F_input_tgsajar.Close;
end;
end;

procedure TF_input_tgsajar.Btn_kembaliClick(Sender: TObject);
begin
Hide;
end;

procedure TF_input_tgsajar.btn_simpanClick(Sender: TObject);
begin
if edit_kdtgsajr.Text='' then
begin
   Application.MessageBox('Data Kode Tugas Mengajar Masih Kosong','Warning',+MB_OK+MB_ICONWARNING);
   edit_kdtgsajr.SetFocus;
end
else if cb_kdmapel.Text='--Pilih--' then
begin
  Application.MessageBox('Pilih Dahulu Kode Mata Pelajaran','Warning',+MB_OK+MB_ICONWARNING);
  cb_kdmapel.SetFocus;
end
else if cb_kdguru.Text='--Pilih--' then
begin
  Application.MessageBox('Pilih Dahulu Kode guru','Warning',+MB_OK+MB_ICONWARNING);
  cb_kdguru.SetFocus;
end
else if cb_kelas.Text='--Pilih--' then
     begin
       Application.MessageBox('Pilih Dahulu Kode Kelas','Warning',+MB_OK+MB_ICONWARNING);
       cb_kelas.SetFocus;
     end
else
begin
 with DM.q_tugasmengajar do
 begin
   Active:=False;
   Close;
   SQL.Clear;
   SQL.Text:='select * from tugasmengajar where tm_kd='+QuotedStr(edit_kdtgsajr.Text);
   Active:=True;
 end;
 if DM.q_tugasmengajar.IsEmpty then
 begin
   simpantgsajr
 end
 else
 ShowMessage('Kode Tugas Mengajar Sudah di Gunakan');
F_data_tgsAjar.tampil;
F_input_tgsajar.Close;
end;




end;

procedure TF_input_tgsajar.cb_kdguruClick(Sender: TObject);
begin
DM.q_guru.Active:=False;
DM.q_guru.SQL.Clear;
DM.q_guru.SQL.Add('select guru_nama, guru_nip from guru')  ;
DM.q_guru.SQL.Add('where guru_nip='''+cb_kdguru.Text+'''');
DM.q_guru.Open;
edit_namaguru.Text:=DM.q_guru['guru_nama'];
end;

procedure TF_input_tgsajar.cb_kdmapelClick(Sender: TObject);
begin
DM.q_mapel.Active:=False;
DM.q_mapel.SQL.Clear;
DM.q_mapel.SQL.Add('select * from mapel');
DM.q_mapel.SQL.Add('where mapel_kd='''+cb_kdmapel.Text+'''');
DM.q_mapel.Open;
edit_nmmapel.Text:=DM.q_mapel['mapel_nama'];
cb_semester.Text:=DM.q_mapel['mapel_smt'];
end;

procedure TF_input_tgsajar.cb_kelasClick(Sender: TObject);
begin
DM.q_siswa.Active:=False;
DM.q_siswa.Close;
DM.q_siswa.SQL.Clear;
DM.q_siswa.SQL.Add('select count (siswa_nis) kelas_kd from siswa   ') ;
DM.q_siswa.SQL.Add(' where kelas_kd='''+cb_kelas.Text+'''')  ;
DM.q_siswa.Active:=True;
//DM.q_siswa.SQL.Add('where kelas_kd='''+cb_kelas.Text+'''');
DM.q_siswa.Open;
edit_jlmhsiswa.Text:=DM.q_siswa['kelas_kd'] ;


end;

procedure TF_input_tgsajar.FormShow(Sender: TObject);
begin
bersih;
begin
  DM.q_mapel.Active:=False;
  DM.q_mapel.SQL.Clear;
  DM.q_mapel.SQL.Add('select * from mapel');
  DM.q_mapel.Active:=True;
  cb_kdmapel.Items.Clear;
  while not DM.q_mapel.Eof do
  begin
    cb_kdmapel.Items.Add(DM.q_mapel.FieldByName('mapel_kd').AsString);
     DM.q_mapel.Next;
  end;
end;
begin
  DM.q_guru.Active:=False;
 DM.q_guru.SQL.Clear;
 DM.q_guru.SQL.Add('select * from guru') ;
 DM.q_guru.Active:=True;
 cb_kdguru.Items.Clear;
 while not DM.q_guru.Eof do
 begin
   cb_kdguru.Items.Add(DM.q_guru.FieldByName('guru_nip').AsString);
   DM.q_guru.Next;

 end;
end;
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
