unit U_laporan_siswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, Buttons, sBitBtn, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox;

type
  TF_laporan_siswa = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sGroupBox2: TsGroupBox;
    cb_kelas: TsComboBox;
    btn_kelas: TsBitBtn;
    sPanel1: TsPanel;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure cb_kelasClick(Sender: TObject);
    procedure btn_kelasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  F_laporan_siswa: TF_laporan_siswa;

implementation

uses U_DM, U_laporan_siswa_k;

{$R *.dfm}

procedure TF_laporan_siswa.btn_kelasClick(Sender: TObject);
begin
if cb_kelas.Text='--Pilih--' then
begin
  Application.MessageBox('Pilih Dahulu Kelas Siswa','Warning',MB_OK+MB_ICONWARNING);
  cb_kelas.SetFocus;
end
else
begin
  with DM.q_siswa do
  begin
    Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by siswa_nis) as NO,siswa.siswa_nis,siswa.siswa_nama,siswa.siswa_alamat,siswa.siswa_tahun,siswa.siswa_tptlahir,siswa.siswa_tgllahir,siswa.siswa_tahun,siswa.siswa_wali,siswa.siswa_jk,siswa.kelas_kd,kelas.kelas_nama, ' +
  ' kelas.guru_nip,guru.guru_nama from siswa, kelas, guru where siswa.kelas_kd=kelas.kelas_kd and kelas.guru_nip=guru.guru_nip and kelas_nama like '+QuotedStr(cb_kelas.Text);
  Active:=True;
  if DM.q_siswa.IsEmpty then
  begin
    ShowMessage('Data Siswa Tidak Ditemukan!!');
  end
  else
  begin
    Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by siswa_nis) as NO,siswa.siswa_nis,siswa.siswa_nama,siswa.siswa_alamat,siswa.siswa_tahun,siswa.siswa_tptlahir,siswa.siswa_tgllahir,siswa.siswa_tahun,siswa.siswa_wali,siswa.siswa_jk,siswa.kelas_kd,kelas.kelas_nama, ' +
  ' kelas.guru_nip,guru.guru_nama from siswa, kelas, guru where siswa.kelas_kd=kelas.kelas_kd and kelas.guru_nip=guru.guru_nip and kelas_nama like '+QuotedStr(cb_kelas.Text);
  Active:=True;
  F_laporan_siswa_k.QuickRep1.DataSet:=DM.q_siswa;
  F_laporan_siswa_k.QRLKELAS.Caption:=DM.q_siswa.FieldByName('kelas_nama').AsString;
  F_laporan_siswa_k.QRLabelNIP.Caption:=DM.q_siswa.FieldByName('guru_nip').AsString;
  F_laporan_siswa_k.QRLlabelNAMA.Caption:=DM.q_siswa.FieldByName('guru_nama').AsString;
  F_laporan_siswa_k.QRPLabelnipt.Caption:=DM.q_siswa.FieldByName('guru_nip').AsString;
  F_laporan_siswa_k.QRPLabelnamawlait.Caption:=DM.q_siswa.FieldByName('guru_nama').AsString;
  F_laporan_siswa_k.QRDBNIS.DataSet:=DM.q_siswa; F_laporan_siswa_k.QRDBNIS.DataField:='siswa_nis';
  F_laporan_siswa_k.QRDBNAMA.DataSet:=DM.q_siswa; F_laporan_siswa_k.QRDBNAMA.DataField:='siswa_nama';
  F_laporan_siswa_k.QRDBJK.DataSet:=DM.q_siswa; F_laporan_siswa_k.QRDBJK.DataField:='siswa_jk';
  F_laporan_siswa_k.QRDBTEMPAT.DataSet:=DM.q_siswa; F_laporan_siswa_k.QRDBTEMPAT.DataField:='siswa_tptlahir';
  F_laporan_siswa_k.QRDBTGLLHR.DataSet:=DM.q_siswa; F_laporan_siswa_k.QRDBTGLLHR.DataField:='siswa_tgllahir';
  F_laporan_siswa_k.QRDBWALI.DataSet:=DM.q_siswa; F_laporan_siswa_k.QRDBWALI.DataField:='siswa_wali';
  F_laporan_siswa_k.QRDBALAMAT.DataSet:=DM.q_siswa; F_laporan_siswa_k.QRDBALAMAT.DataField:='siswa_alamat';
  F_laporan_siswa_k.QuickRep1.Preview;
  end;
  end;
end;
end;

procedure TF_laporan_siswa.cb_kelasClick(Sender: TObject);
begin
with DM.q_siswa do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by siswa_nis) as NO,siswa.siswa_nis,siswa.siswa_nama,siswa.siswa_alamat,siswa.siswa_tahun,siswa.siswa_tptlahir,siswa.siswa_tgllahir,siswa.siswa_tahun,siswa.siswa_wali,siswa.siswa_jk,siswa.kelas_kd,kelas.kelas_nama, ' +
  ' kelas.guru_nip,guru.guru_nama from siswa, kelas, guru where siswa.kelas_kd=kelas.kelas_kd and kelas.guru_nip=guru.guru_nip and kelas_nama like '+QuotedStr(cb_kelas.Text);
  Active:=True;
end;
DBGrid1.DataSource:=DM.ds_siswa;
end;

procedure TF_laporan_siswa.FormShow(Sender: TObject);
begin
DM.q_kelas.Active:=False;
DM.q_kelas.SQL.Clear;
DM.q_kelas.SQL.Add('select * from kelas');
DM.q_kelas.Active:=True;
cb_kelas.Items.Clear;
while not DM.q_kelas.Eof do
begin
  cb_kelas.Items.Add(DM.q_kelas.FieldByName('kelas_nama').AsString);
  DM.q_kelas.Next;
end;
cb_kelas.Text:='--Pilih--';


with DM.q_siswa do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by siswa_nis) as NO,siswa.siswa_nis,siswa.siswa_nama,siswa.siswa_alamat,siswa.siswa_tahun,siswa.siswa_tptlahir,siswa.siswa_tgllahir,siswa.siswa_tahun,siswa.siswa_wali,siswa.siswa_jk,siswa.kelas_kd,kelas.kelas_nama, ' +
  ' kelas.guru_nip,guru.guru_nama from siswa, kelas, guru where siswa.kelas_kd=kelas.kelas_kd and kelas.guru_nip=guru.guru_nip';
  Active:=True;
end;
DBGrid1.DataSource:=DM.ds_siswa;
end;

end.
