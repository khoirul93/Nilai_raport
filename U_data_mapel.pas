unit U_data_mapel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, sBitBtn, sEdit, sComboBox,
  sGroupBox, sLabel;

type
  TF_data_mapel = class(TForm)
    sGroupBox1: TsGroupBox;
    sGroupBox2: TsGroupBox;
    cb_kategori: TsComboBox;
    DBGrid1: TDBGrid;
    Edit_key: TsEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sGroupBox3: TsGroupBox;
    btn_ubah: TsBitBtn;
    btn_tambah: TsBitBtn;
    btn_hapus: TsBitBtn;
    sLabel3: TsLabel;

    procedure Edit_keyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_tambahClick(Sender: TObject);
    procedure btn_ubahClick(Sender: TObject);
    procedure btn_hapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure tampil;
//    procedure hapus;

  end;

var
  F_data_mapel: TF_data_mapel;

implementation

uses U_DM, U_input_mapel;

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



procedure TF_data_mapel.tampil;

  begin

with DM.q_mapel do
 begin
   Active:=False;
   Close;
   SQL.Clear;
   SQL.Text:=' select ROW_NUMBER() over (order by mapel_kd ) as NO, * from mapel';
   Active:=True;
   DBGrid1.DataSource:=DM.ds_mapel;
   DM.ds_mapel.DataSet:=DM.q_mapel;
 end;
  end;


procedure TF_data_mapel.btn_hapusClick(Sender: TObject);
begin
if (Application.MessageBox('Yakin Hapus Data Mata Pelajaran ini ?','KONFIRM',MB_YESNO+MB_ICONQUESTION)=ID_YES) then

begin
try
DM.koneksi.BeginTrans;
with DM.q_mapel do
begin
  Connection:=DM.koneksi;
  SQL.Text:='delete from mapel where mapel_kd='+QuotedStr(sLabel3.Caption);
  ExecSQL;
end;
DM.koneksi.CommitTrans;
ShowMessage('Data Mata Pelajaran Terhapus');
except
DM.koneksi.RollbackTrans;
ShowMessage('Data Mata Pelajaran Gagal Terhapus');
end;
end;

tampil;
end;

procedure TF_data_mapel.btn_tambahClick(Sender: TObject);
begin
 f_input_mapel.Show;
 f_input_mapel.btn_edit.Enabled:=False;
  f_input_mapel.rb_pokok.Checked:=False;
  f_input_mapel.rb_eskul.Checked:=False;
 f_input_mapel.btn_simpan.Enabled:=True;
 f_input_mapel.edit_kdmapel.Enabled:=False;
// f_input_mapel.edit_kdmapel.SetFocus;

with DM.ADOQuery1 do
begin
  Close;
  SQL.Clear;
  SQL.Add('select * from mapel');
  Open;
  if (DM.ADOQuery1.RecordCount<=0) then
  begin
    f_input_mapel.edit_kdmapel.Text:='MPL001';
  end
  else
  begin
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Add('select max(right(mapel_kd,3))as kode from mapel');
    DM.ADOQuery1.Open;
    f_input_mapel.edit_kdmapel.Text:='MPL00'+IntToStr(DM.ADOQuery1['kode']+1);
  end

     end;


end;

procedure TF_data_mapel.btn_ubahClick(Sender: TObject);
begin
f_input_mapel.Show;
f_input_mapel.btn_simpan.Enabled:=False;
f_input_mapel.btn_edit.Enabled:=True;
f_input_mapel.edit_kdmapel.Enabled:=False;
f_input_mapel.edit_mapel.SetFocus;

with DM.q_mapel do
begin
  f_input_mapel.edit_kdmapel.Text:=FieldByName('mapel_kd').AsString ;
  f_input_mapel.edit_mapel.Text:=FieldByName('mapel_nama').AsString  ;
  f_input_mapel.cb_mapel.Text:=FieldByName('mapel_smt').AsString;
  f_input_mapel.status:=FieldByName('mapel_status').AsString;
  if f_input_mapel.status='Ekstrakurikuler' then
  begin
     f_input_mapel.rb_eskul.Checked:=True;
  f_input_mapel.rb_pokok.Checked:=False;

  end
  else
  begin
   f_input_mapel.rb_pokok.Checked:=True;
    f_input_mapel.rb_eskul.Checked:=False;
      end;
end;
end;

procedure TF_data_mapel.DBGrid1CellClick(Column: TColumn);
begin
with DM.q_mapel do
begin
  sLabel3.Caption:=FieldValues['mapel_kd']
end;
end;

procedure TF_data_mapel.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if DBGrid1.DataSource.DataSet.RecNo mod 2 =0 then
DBGrid1.Canvas.Brush.Color := clSkyBlue;
DBGrid1.DefaultDrawColumnCell(rect, datacol, column, state);
end;

procedure TF_data_mapel.Edit_keyChange(Sender: TObject);
var cari:string;
begin
if cb_kategori.Text='Kode Mata Pelajaran' then
cari:='mapel_kd'
else if cb_kategori.Text='Nama Mata Pelajaran' then
cari:='mapel_nama'
else  if cb_kategori.Text='Semester' then
cari:='mapel_smt'
else if cb_kategori.Text='Status' then
cari:='mapel_status';







 if Edit_key.Text='' then
 begin
  with DM.q_mapel do
  begin
    Active:=False;
    Close;
    SQL.Clear;
    SQL.Text:=' select ROW_NUMBER() over (order by mapel_kd ) as NO, * from mapel';
    Active:=True;
  end;
  DBGrid1.DataSource:=DM.ds_mapel;
 end
 else
 begin
   with DM.q_mapel do
   begin
     Active:=False;
     Close;
     SQL.Clear;
     SQL.Text:='   select ROW_NUMBER() over (order by mapel_kd ) as NO, * from mapel where '+cari+' like '+QuotedStr(Edit_key.Text+ '%');
     Active:=True;
   end;
   DBGrid1.DataSource:=DM.ds_mapel;
 end;


end;

procedure TF_data_mapel.FormShow(Sender: TObject);
begin
cb_kategori.Text:='Nama Mata Pelajaran' ;
Edit_key.Clear;
Edit_key.SetFocus;
sLabel3.Caption:='';

SetCueBanner(Edit_key,'Masukkan Kata Pencarian');
end;

end.
