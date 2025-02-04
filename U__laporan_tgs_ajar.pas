unit U__laporan_tgs_ajar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, Buttons, sBitBtn, sEdit, sComboBox,
  Grids, DBGrids, sLabel, sGroupBox;

type
  TF_laporan_tgs_ajar = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sGroupBox2: TsGroupBox;
    cb_kelas: TsComboBox;
    edit_nama: TsEdit;
    btn_kelas: TsBitBtn;
    btn_nama: TsBitBtn;
    sPanel1: TsPanel;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure cb_kelasClick(Sender: TObject);
    procedure edit_namaChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btn_namaClick(Sender: TObject);
    procedure btn_kelasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
  end;

var
  F_laporan_tgs_ajar: TF_laporan_tgs_ajar;

implementation

uses U_DM, U_laporan_tgs_g, U_laporan_tgs_K;

{$R *.dfm}
procedure TF_laporan_tgs_ajar.bersih;
begin
cb_kelas.Text:='--Pilih--';
edit_nama.Clear;
end;

procedure TF_laporan_tgs_ajar.btn_kelasClick(Sender: TObject);
begin
if cb_kelas.Text='--Pilih--' then
begin
  Application.MessageBox('Pilih Dahulu kelas','Warning',MB_OK+MB_ICONWARNING);
  cb_kelas.SetFocus;
end
else
begin
  with DM.q_tugasmengajar do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by tm_kd) as NO,tugasmengajar.tm_kd,tugasmengajar.guru_nip, guru.guru_nama,tugasmengajar.mapel_kd,mapel.mapel_nama,mapel.mapel_smt,mapel.mapel_status,'+
  ' tugasmengajar.kelas_kd,kelas.kelas_nama,tugasmengajar.siswa from tugasmengajar,guru, kelas, mapel where tugasmengajar.guru_nip=guru.guru_nip and tugasmengajar.kelas_kd=kelas.kelas_kd and tugasmengajar.mapel_kd=mapel.mapel_kd'+
  ' and kelas_nama like  '+QuotedStr(cb_kelas.Text) + ' order by guru_nama asc';
  Active:=True;
  if DM.q_tugasmengajar.IsEmpty then
  begin
    ShowMessage('DATA KELAS TIDAK DITEMUKAN!!!');
  end
  else
  begin
    Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by tm_kd) as NO,tugasmengajar.tm_kd,tugasmengajar.guru_nip, guru.guru_nama,tugasmengajar.mapel_kd,mapel.mapel_nama,mapel.mapel_smt,mapel.mapel_status,'+
  ' tugasmengajar.kelas_kd,kelas.kelas_nama,tugasmengajar.siswa from tugasmengajar,guru, kelas, mapel where tugasmengajar.guru_nip=guru.guru_nip and tugasmengajar.kelas_kd=kelas.kelas_kd and tugasmengajar.mapel_kd=mapel.mapel_kd'+
  ' and kelas_nama like  '+QuotedStr(cb_kelas.Text) + ' order by guru_nama asc';
  Active:=True;

  F_laporan_tgs_K.QuickRep1.DataSet:=DM.q_tugasmengajar;
  F_laporan_tgs_K.QRLabelkelas.Caption:=DM.q_tugasmengajar.FieldByName('kelas_nama').AsString;
  F_laporan_tgs_K.QRLlabelNAMA.Caption:=DM.q_tugasmengajar.FieldByName('siswa').AsString;
   F_laporan_tgs_K.QRDBNIP.DataSet:=DM.q_tugasmengajar; F_laporan_tgs_K.QRDBNIP.DataField:='guru_nip';
   F_laporan_tgs_K.QRDNAMA.DataSet:=DM.q_tugasmengajar; F_laporan_tgs_K.QRDNAMA.DataField:='guru_nama';
   F_laporan_tgs_K.QRDBMAPEL.DataSet:=DM.q_tugasmengajar; F_laporan_tgs_K.QRDBMAPEL.DataField:='mapel_nama';
  F_laporan_tgs_K.QuickRep1.Preview;
  end;
end;
end;
end;

procedure TF_laporan_tgs_ajar.btn_namaClick(Sender: TObject);
begin
if edit_nama.Text='' then
begin
  Application.MessageBox('Pilih Dahulu Nama Guru','Warning',MB_OK+MB_ICONWARNING);
  edit_nama.SetFocus;
end
else
begin
    with DM.q_tugasmengajar do
  begin
    Active:=False;
    Close;
    SQL.Clear;
     SQL.Text:='select ROW_NUMBER() over (order by tm_kd) as NO,tugasmengajar.tm_kd,tugasmengajar.guru_nip, guru.guru_nama,tugasmengajar.mapel_kd,mapel.mapel_nama,mapel.mapel_smt,mapel.mapel_status,'+
  ' tugasmengajar.kelas_kd,kelas.kelas_nama,tugasmengajar.siswa from tugasmengajar,guru, kelas, mapel where tugasmengajar.guru_nip=guru.guru_nip and tugasmengajar.kelas_kd=kelas.kelas_kd and tugasmengajar.mapel_kd=mapel.mapel_kd'+
  ' and guru_nama like  '+QuotedStr(edit_nama.Text + '%') + ' order by guru_nama asc';
  Active:=True;
  if DM.q_tugasmengajar.IsEmpty then
  begin
    ShowMessage('DATA NAMA GURU TIDAK DITEMUKAN!!!');
  end
  else
  begin
       Active:=False;
    Close;
    SQL.Clear;
     SQL.Text:='select ROW_NUMBER() over (order by tm_kd) as NO,tugasmengajar.tm_kd,tugasmengajar.guru_nip, guru.guru_nama,tugasmengajar.mapel_kd,mapel.mapel_nama,mapel.mapel_smt,mapel.mapel_status,'+
  ' tugasmengajar.kelas_kd,kelas.kelas_nama,tugasmengajar.siswa from tugasmengajar,guru, kelas, mapel where tugasmengajar.guru_nip=guru.guru_nip and tugasmengajar.kelas_kd=kelas.kelas_kd and tugasmengajar.mapel_kd=mapel.mapel_kd'+
  ' and guru_nama like  '+QuotedStr(edit_nama.Text + '%') + ' order by guru_nama asc';
  Active:=True;
  F_laporan_tgs_g.QuickRep1.DataSet:=DM.q_tugasmengajar;
  F_laporan_tgs_g.QRLabelNIP.Caption:=DM.q_tugasmengajar.FieldByName('guru_nip').AsString;
  F_laporan_tgs_g.QRLlabelNAMA.Caption:=DM.q_tugasmengajar.FieldByName('guru_nama').AsString;
  F_laporan_tgs_g.QRDBMAPEL.DataSet:=DM.q_tugasmengajar; F_laporan_tgs_g.QRDBMAPEL.DataField:='mapel_nama';
  F_laporan_tgs_g.QRDBSTATUS.DataSet:=DM.q_tugasmengajar; F_laporan_tgs_g.QRDBSTATUS.DataField:='mapel_status';
  F_laporan_tgs_g.QRDBKELAS.DataSet:=DM.q_tugasmengajar; F_laporan_tgs_g.QRDBKELAS.DataField:='kelas_nama';
  F_laporan_tgs_g.QRDBSISWA.DataSet:=DM.q_tugasmengajar; F_laporan_tgs_g.QRDBSISWA.DataField:='siswa';
  F_laporan_tgs_g.QuickRep1.Preview;
  end;

  end;
end;
end;

procedure TF_laporan_tgs_ajar.cb_kelasClick(Sender: TObject);
begin
with DM.q_tugasmengajar do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by tm_kd) as NO,tugasmengajar.tm_kd,tugasmengajar.guru_nip, guru.guru_nama,tugasmengajar.mapel_kd,mapel.mapel_nama,mapel.mapel_smt,mapel.mapel_status,'+
  ' tugasmengajar.kelas_kd,kelas.kelas_nama,tugasmengajar.siswa from tugasmengajar,guru, kelas, mapel where tugasmengajar.guru_nip=guru.guru_nip and tugasmengajar.kelas_kd=kelas.kelas_kd and tugasmengajar.mapel_kd=mapel.mapel_kd'+
  ' and kelas_nama like  '+QuotedStr(cb_kelas.Text) + ' order by guru_nama asc';
  Active:=True;

end;
DBGrid1.DataSource:=DM.ds_tugasmengajar;
end;

procedure TF_laporan_tgs_ajar.DBGrid1CellClick(Column: TColumn);
begin
with DM.q_tugasmengajar do
begin
  edit_nama.Text:=FieldByName('guru_nama').AsString;
end;
end;

procedure TF_laporan_tgs_ajar.edit_namaChange(Sender: TObject);
begin
if edit_nama.Text='' then
begin
  with DM.q_tugasmengajar do
  begin
    Active:=False;
    Close;
    SQL.Clear;
     SQL.Text:='select ROW_NUMBER() over (order by tm_kd) as NO,tugasmengajar.tm_kd,tugasmengajar.guru_nip, guru.guru_nama,tugasmengajar.mapel_kd,mapel.mapel_nama,mapel.mapel_smt,mapel.mapel_status,'+
  ' tugasmengajar.kelas_kd,kelas.kelas_nama,tugasmengajar.siswa from tugasmengajar,guru, kelas, mapel where tugasmengajar.guru_nip=guru.guru_nip and tugasmengajar.kelas_kd=kelas.kelas_kd and tugasmengajar.mapel_kd=mapel.mapel_kd'+
  ' and guru_nama like  '+QuotedStr(edit_nama.Text + '%') + ' order by guru_nama asc';
  Active:=True;

  end;
  DBGrid1.DataSource:=DM.ds_tugasmengajar;
end
else
begin
  with DM.q_tugasmengajar do
  begin
    Active:=False;
    Close;
    SQL.Clear;
     SQL.Text:='select ROW_NUMBER() over (order by tm_kd) as NO,tugasmengajar.tm_kd,tugasmengajar.guru_nip, guru.guru_nama,tugasmengajar.mapel_kd,mapel.mapel_nama,mapel.mapel_smt,mapel.mapel_status,'+
  ' tugasmengajar.kelas_kd,kelas.kelas_nama,tugasmengajar.siswa from tugasmengajar,guru, kelas, mapel where tugasmengajar.guru_nip=guru.guru_nip and tugasmengajar.kelas_kd=kelas.kelas_kd and tugasmengajar.mapel_kd=mapel.mapel_kd'+
  ' and guru_nama like  '+QuotedStr(edit_nama.Text + '%') + ' order by guru_nama asc';
  Active:=True;

  end;
  DBGrid1.DataSource:=DM.ds_tugasmengajar;
end;
end;

procedure TF_laporan_tgs_ajar.FormShow(Sender: TObject);
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
