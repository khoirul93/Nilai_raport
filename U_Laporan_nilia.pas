unit U_Laporan_nilia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, Buttons, sBitBtn, sEdit, sLabel,
  sComboBox, Grids, DBGrids, sGroupBox;

type
  TF_laporan_nilai = class(TForm)
    sGroupBox1: TsGroupBox;
    sGroupBox2: TsGroupBox;
    DBGrid1: TDBGrid;
    cb_kelas: TsComboBox;
    sLabel1: TsLabel;
    edit_nama: TsEdit;
    sLabel3: TsLabel;
    btn_kelas: TsBitBtn;
    btn_nama: TsBitBtn;
    sPanel1: TsPanel;
    cb_tahunajrn: TsComboBox;
    sLabel2: TsLabel;
    cb_semster_mapel: TsComboBox;
    sLabel13: TsLabel;
    procedure FormShow(Sender: TObject);
    procedure cb_kelasClick(Sender: TObject);
    procedure cb_smtClick(Sender: TObject);
    procedure edit_namaChange(Sender: TObject);
    procedure btn_kelasClick(Sender: TObject);
    procedure btn_namaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure cb_tahunajrnClick(Sender: TObject);
    procedure cb_semster_mapelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
  end;

var
  F_laporan_nilai: TF_laporan_nilai;

implementation

uses U_DM, U_laporan_nilai_kelas, U_laporan_nilai_siswa;

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


procedure TF_laporan_nilai.bersih;
begin
cb_kelas.Text:='--Pilih--';
//cb_smt.Text:='--Pilih--';
edit_nama.Clear;
cb_tahunajrn.Text:='--Pilih--';
cb_semster_mapel.Text:='--Pilih--';
SetCueBanner(edit_nama,'Masukkan Nama Siswa');

with DM.q_nilai do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO, nilai.nilai_kd,nilai.tahun,mapel.mapel_smt,nilai.siswa_nis,siswa.siswa_nama,kelas.kelas_nama,mapel.mapel_kd,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan from siswa,nilai,mapel,kelas where nilai.siswa_nis=siswa.siswa_nis and nilai.mapel_kd=mapel.mapel_kd and siswa.kelas_kd=kelas.kelas_kd' ;
  Active:=True;
  DBGrid1.DataSource:=DM.ds_nilai;
  DM.ds_nilai.DataSet:=DM.q_nilai;
end;
end;

procedure TF_laporan_nilai.btn_kelasClick(Sender: TObject);
begin
if cb_kelas.Text='--Pilih--' then
begin
  Application.MessageBox('Pilih Dahulu Kriteria Laporan','WARNING',MB_OK+MB_ICONWARNING);
  cb_kelas.SetFocus;
end
else if cb_tahunajrn.Text='--Pilih--' then
     begin
       Application.MessageBox('Pilih Dahulu Tahun Aaran','Warning',MB_OK+MB_ICONWARNING);
       cb_tahunajrn.SetFocus;
     end
     else if cb_semster_mapel.Text='--Pilih--' then
          begin
              Application.MessageBox('Pilih Dahulu Semester ','Warning',MB_OK+MB_ICONWARNING);
              cb_semster_mapel.SetFocus;
          end
          else
begin
with DM.q_nilai do
begin
  Active:=False;
  Close;
SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,mapel.mapel_smt,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd and kelas_nama like '+QuotedStr(cb_kelas.Text + '%' )+' and mapel_smt like '+QuotedStr(cb_semster_mapel.Text)+' and  tahun  like '+QuotedStr(cb_tahunajrn.Text)  +'  order by mapel_nama ASC';
  Active:=True;
    if DM.q_nilai.IsEmpty then
    begin
      ShowMessage('DATA TIDAK DITEMUKAN!!!');
    end
    else
    begin
       Active:=False;
  Close;
  SQL.Clear;
 SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,mapel.mapel_smt,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd and kelas_nama like '+QuotedStr(cb_kelas.Text + '%' ) +' and mapel_smt like '+QuotedStr(cb_semster_mapel.Text)+' and  tahun  like '+QuotedStr(cb_tahunajrn.Text)  +'  order by mapel_nama ASC';
  Active:=True;
  F_Laporan_nilai_kelas.QuickRep1.DataSet:=DM.q_nilai;
  F_Laporan_nilai_kelas.QRLTahun.Caption:=DM.q_nilai.FieldByName('tahun').AsString;
  F_Laporan_nilai_kelas.qrlsmt.Caption:=DM.q_nilai.FieldByName('mapel_smt').AsString;
  F_Laporan_nilai_kelas.QRLabelKELAS.Caption:=DM.q_nilai.FieldByName('kelas_nama').AsString;
  F_Laporan_nilai_kelas.QRLlabelNAMA.Caption:=DM.q_nilai.FieldByName('guru_nama').AsString;
  F_Laporan_nilai_kelas.QRLabelNIP.Caption:=DM.q_nilai.FieldByName('guru_nip').AsString;
  F_Laporan_nilai_kelas.QRPLabelnamawlait.Caption:=DM.q_nilai.FieldByName('guru_nama').AsString;
  F_Laporan_nilai_kelas.QRPLabelnipt.Caption:=DM.q_nilai.FieldByName('guru_nip').AsString;
  F_Laporan_nilai_kelas.QRDBNIS.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBNIS.DataField:='siswa_nis';
  F_Laporan_nilai_kelas.QRDBnama.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBnama.DataField:='siswa_nama';
  F_Laporan_nilai_kelas.QRDBMAPEL.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBMAPEL.DataField:='mapel_nama';
  F_Laporan_nilai_kelas.QRDBULANGAN.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBULANGAN.DataField:='nilai_ulangan';
  F_Laporan_nilai_kelas.QRDBTUGAS.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBTUGAS.DataField:='nilai_tugas';
  F_Laporan_nilai_kelas.QRDBUTS.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBUTS.DataField:='nilai_uts';
  F_Laporan_nilai_kelas.QRDBUAS.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBUAS.DataField:='nilai_uas';
  F_Laporan_nilai_kelas.QRDBTOTAL.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBTOTAL.DataField:='nilai_total';
  F_Laporan_nilai_kelas.QRDBKET.DataSet:=DM.q_nilai; F_Laporan_nilai_kelas.QRDBKET.DataField:='nilai_keterangan';

  F_Laporan_nilai_kelas.QuickRep1.Preview;
    end;

end;
end;

end;

procedure TF_laporan_nilai.btn_namaClick(Sender: TObject);
begin
if edit_nama.Text='' then
begin
  Application.MessageBox('Pilih Dahulu Nama Siswa','WARNING',MB_OK+MB_ICONWARNING);
  cb_kelas.SetFocus;
end
else if cb_tahunajrn.Text='--Pilih--' then
     begin
       Application.MessageBox('Pilih Dahulu Tahun Aaran','Warning',MB_OK+MB_ICONWARNING);
       cb_tahunajrn.SetFocus;
     end
     else if cb_semster_mapel.Text='--Pilih--' then
          begin
              Application.MessageBox('Pilih Dahulu Semester ','Warning',MB_OK+MB_ICONWARNING);
              cb_semster_mapel.SetFocus;
          end
          else
begin
with DM.q_nilai do
begin
  Active:=False;
  Close;
  SQL.Clear;
 SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,mapel.mapel_smt,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd and siswa_nama like '+QuotedStr(edit_nama.Text + '' )+' and mapel_smt like '+QuotedStr(cb_semster_mapel.Text)+' and  tahun  like '+QuotedStr(cb_tahunajrn.Text)  +'  order by mapel_nama ASC';
  Active:=True;
   if DM.q_nilai.IsEmpty then
    begin
      ShowMessage('DATA TIDAK DITEMUKAN!!!');
    end
    else
    begin
       Active:=False;
  Close;
  SQL.Clear;
    SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,mapel.mapel_smt,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd and siswa_nama like '+QuotedStr(edit_nama.Text + '%' )+' and mapel_smt like '+QuotedStr(cb_semster_mapel.Text)+' and  tahun  like '+QuotedStr(cb_tahunajrn.Text)  +'  order by mapel_nama ASC';
  Active:=True;
 // F_Laporan_nilai_kelas.QuickRep1.DataSet:=DM.q_nilai;
  F_laporan_nilai_siswa.QuickRep1.DataSet:=DM.q_nilai;
  F_laporan_nilai_siswa.qrlsmt.Caption:=DM.q_nilai.FieldByName('mapel_smt').AsString;
  F_laporan_nilai_siswa.QRLtahun.Caption:=DM.q_nilai.FieldByName('tahun').AsString;
  F_laporan_nilai_siswa.QRLabelKELAS.Caption:=DM.q_nilai.FieldByName('kelas_nama').AsString;
  F_laporan_nilai_siswa.QRLlabelNAMA.Caption:=DM.q_nilai.FieldByName('siswa_nama').AsString;
  F_laporan_nilai_siswa.QRLabelNIP.Caption:=DM.q_nilai.FieldByName('siswa_nis').AsString;
  F_laporan_nilai_siswa.QRPLabelnamawlait.Caption:=DM.q_nilai.FieldByName('guru_nama').AsString;
  F_laporan_nilai_siswa.QRPLabelnipt.Caption:=DM.q_nilai.FieldByName('guru_nip').AsString;
  F_laporan_nilai_siswa.QRDBMAPEL.DataSet:=DM.q_nilai; F_laporan_nilai_siswa.QRDBMAPEL.DataField:='mapel_nama';
  F_laporan_nilai_siswa.QRDBULANGAN.DataSet:=DM.q_nilai; F_laporan_nilai_siswa.QRDBULANGAN.DataField:='nilai_ulangan';
  F_laporan_nilai_siswa.QRDBTUGAS.DataSet:=DM.q_nilai; F_laporan_nilai_siswa.QRDBTUGAS.DataField:='nilai_tugas';
  F_laporan_nilai_siswa.QRDBUTS.DataSet:=DM.q_nilai; F_laporan_nilai_siswa.QRDBUTS.DataField:='nilai_uts';
  F_laporan_nilai_siswa.QRDBUAS.DataSet:=DM.q_nilai; F_laporan_nilai_siswa.QRDBUAS.DataField:='nilai_uas';
  F_laporan_nilai_siswa.QRDBTOTAL.DataSet:=DM.q_nilai; F_laporan_nilai_siswa.QRDBTOTAL.DataField:='nilai_total';
  F_laporan_nilai_siswa.QRDBKET.DataSet:=DM.q_nilai; F_laporan_nilai_siswa.QRDBKET.DataField:='nilai_keterangan';



  F_laporan_nilai_siswa.QuickRep1.Preview;
   end;
end;
end;
end;

procedure TF_laporan_nilai.cb_kelasClick(Sender: TObject);
begin
with DM.q_nilai do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd and kelas_nama like '+QuotedStr(cb_kelas.Text + '%' ) +' and mapel_smt like '+QuotedStr(cb_semster_mapel.Text)+' and  tahun  like '+QuotedStr(cb_tahunajrn.Text)  +'  order by mapel_nama ASC';
  Active:=True;

end;
DBGrid1.DataSource:=DM.ds_nilai;
end;

procedure TF_laporan_nilai.cb_semster_mapelClick(Sender: TObject);
begin
with DM.q_nilai do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd  and mapel_smt like '+QuotedStr(cb_semster_mapel.Text)+' and  tahun  like '+QuotedStr(cb_tahunajrn.Text)  +'  order by mapel_nama ASC';
  Active:=True;

end;
DBGrid1.DataSource:=DM.ds_nilai;
end;

procedure TF_laporan_nilai.cb_smtClick(Sender: TObject);
begin
 {with DM.q_nilai do
begin
  Active:=False;
  Close;
  SQL.Clear;
   SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO, nilai.nilai_kd,nilai.tahun,mapel.mapel_smt,nilai.siswa_nis,siswa.siswa_nama,kelas.kelas_nama,mapel.mapel_kd,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan from siswa,nilai,mapel,kelas where nilai.siswa_nis=siswa.siswa_nis and nilai.mapel_kd=mapel.mapel_kd and siswa.kelas_kd=kelas.kelas_kd and mapel_smt like '+QuotedStr(cb_smt.Text + '%');
  Active:=True;


end;
DBGrid1.DataSource:=DM.ds_nilai;  }
end;

procedure TF_laporan_nilai.cb_tahunajrnClick(Sender: TObject);
begin
with DM.q_nilai do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd and  tahun  like '+QuotedStr(cb_tahunajrn.Text)  +'  order by mapel_nama ASC';
  Active:=True;

end;
DBGrid1.DataSource:=DM.ds_nilai;
end;

procedure TF_laporan_nilai.DBGrid1CellClick(Column: TColumn);
begin
with DM.q_nilai do
begin
  edit_nama.Text:=FieldByName('siswa_nama').AsString;
end;
end;

procedure TF_laporan_nilai.edit_namaChange(Sender: TObject);
begin
if edit_nama.Text='' then
begin
with DM.q_nilai do
begin
  Active:=False;
  Close;
  SQL.Clear;
    SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd  and mapel_smt like '+QuotedStr(cb_semster_mapel.Text)+' and  tahun  like '+QuotedStr(cb_tahunajrn.Text)  +'  order by mapel_nama ASC';
end;
DBGrid1.DataSource:=DM.ds_nilai;

end
else
begin
 with DM.q_nilai do
begin
  Active:=False;
  Close;
  SQL.Clear;
       SQL.Text:='select ROW_NUMBER() over (order by nilai_kd) as NO,nilai.tahun,nilai.siswa_nis,siswa.siswa_nama,nilai.mapel_kd,kelas.kelas_nama,mapel.mapel_nama,nilai.nilai_ulangan,nilai.nilai_tugas,nilai.nilai_uts,nilai.nilai_uas,' +
  'nilai.nilai_total,nilai.nilai_keterangan,kelas.guru_nip,guru.guru_nama from  mapel,nilai,siswa,kelas,guru where nilai.mapel_kd=mapel.mapel_kd and kelas.guru_nip=guru.guru_nip and nilai.siswa_nis=siswa.siswa_nis '+
  'and siswa.kelas_kd=kelas.kelas_kd  and mapel_smt like '+QuotedStr(cb_semster_mapel.Text)+' and  tahun  like '+QuotedStr(cb_tahunajrn.Text)+'and siswa_nama like '+QuotedStr(edit_nama.Text + '%')+'  order by mapel_nama ASC';
  Active:=True;


end;
DBGrid1.DataSource:=DM.ds_nilai;

end;
end;

procedure TF_laporan_nilai.FormShow(Sender: TObject);
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
bersih;
end;

end.
