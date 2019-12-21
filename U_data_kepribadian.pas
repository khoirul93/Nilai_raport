unit U_data_kepribadian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, sBitBtn, sEdit, sComboBox,
  sGroupBox, sLabel;

type
  TF_data_Kepribadian = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel3: TsLabel;
    sGroupBox2: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    cb_kategori: TsComboBox;
    Edit_key: TsEdit;
    sGroupBox3: TsGroupBox;
    btn_ubah: TsBitBtn;
    btn_tambah: TsBitBtn;
    btn_hapus: TsBitBtn;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_tambahClick(Sender: TObject);
    procedure btn_ubahClick(Sender: TObject);
    procedure Edit_keyChange(Sender: TObject);
    procedure btn_hapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure tampil;
  end;

var
  F_data_Kepribadian: TF_data_Kepribadian;

implementation

uses U_DM, U_input_kerpibadian;

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



procedure TF_data_Kepribadian.btn_hapusClick(Sender: TObject);
begin
if (Application.MessageBox('Yakin Hapus Data Kepribadian','KONFIRM',MB_YESNO+MB_ICONQUESTION)=ID_YES) then
begin
  try
    DM.koneksi.BeginTrans ;
    with DM.q_kepribadian do
    begin
      Connection:=DM.koneksi;
      SQL.Text:='delete from kepribadian where kep_kd='+QuotedStr(sLabel3.Caption);
      ExecSQL;
    end;
    DM.koneksi.CommitTrans;
    ShowMessage('Data Kepribadian Terhapus');
  except
  DM.koneksi.RollbackTrans;
  ShowMessage('Data Kepribadian Gagal Terhapus');

  end;
  tampil;
end;
end;

procedure TF_data_Kepribadian.btn_tambahClick(Sender: TObject);
begin
F_input_kepribadian.Show;
F_input_kepribadian.btn_edit.Enabled:=False;
F_input_kepribadian.btn_simpan.Enabled:=True;
F_input_kepribadian.edit_kd.Enabled:=False;
//F_input_kepribadian.edit_kd.SetFocus;

with DM.ADOQuery1 do
begin
  Close;
  SQL.Clear;
  SQL.Add('select * from kepribadian');
  Open;
  if (DM.ADOQuery1.RecordCount<=0) then
  begin
    F_input_kepribadian.edit_kd.Text:='KEP001';
  end
  else
  begin
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Add('select max(right(kep_kd,3))as kode from kepribadian');
    DM.ADOQuery1.Open;
    F_input_kepribadian.edit_kd.Text:='KEP00'+IntToStr(DM.ADOQuery1['kode']+1);
  end

     end;

end;

procedure TF_data_Kepribadian.btn_ubahClick(Sender: TObject);
begin
F_input_kepribadian.Show;
F_input_kepribadian.btn_edit.Enabled:=True;
F_input_kepribadian.btn_simpan.Enabled:=False;
F_input_kepribadian.edit_kd.Enabled:=False;
F_input_kepribadian.edit_jenis.SetFocus;

with DM.q_kepribadian do
begin
  F_input_kepribadian.edit_kd.Text:=FieldByName('kep_kd').AsString;
  F_input_kepribadian.edit_jenis.Text:=FieldByName('kep_jenis').AsString;
  F_input_kepribadian.edit_kepribadian.Text:=FieldByName('kep_ket').AsString;
end;
end;

procedure TF_data_Kepribadian.DBGrid1CellClick(Column: TColumn);
begin
with DM.q_kepribadian do
begin
  sLabel3.Caption:=FieldByName('kep_kd').AsString;
end;
end;

procedure TF_data_Kepribadian.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if DBGrid1.DataSource.DataSet.RecNo mod 2 =0 then
DBGrid1.Canvas.Brush.Color := clSkyBlue;
DBGrid1.DefaultDrawColumnCell(rect, datacol, column, state);
end;

procedure TF_data_Kepribadian.Edit_keyChange(Sender: TObject);
var cari:string;
begin
if cb_kategori.Text='Kode Kepribadian' then
cari:='kep_kd'
else if cb_kategori.Text='Jenis Kepribadian' then
cari:='kep_jenis';
if Edit_key.Text='' then
begin
  with DM.q_kepribadian do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by kep_kd ) as NO, * from kepribadian';
  Active:=True;
end;
DBGrid1.DataSource:=DM.ds_kepribadian;
end
else
begin
  with DM.q_kepribadian do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by kep_kd ) as NO, * from kepribadian where '+cari+' like '+QuotedStr(Edit_key.Text+ '%' );
  Active:=True;
end;
DBGrid1.DataSource:=DM.ds_kepribadian;
end;



end;

procedure TF_data_Kepribadian.FormShow(Sender: TObject);
begin
cb_kategori.Text:='Jenis Kepribadian' ;
Edit_key.Clear;
Edit_key.SetFocus;
sLabel3.Caption:='';


SetCueBanner(Edit_key,'Masukkan Kata Pencarian');
end;

procedure TF_data_Kepribadian.tampil;
begin

with DM.q_kepribadian do
begin
  Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='select ROW_NUMBER() over (order by kep_kd ) as NO, * from kepribadian';
  Active:=True;
  DBGrid1.DataSource:=DM.ds_kepribadian;
  DM.ds_kepribadian.DataSet:=DM.q_kepribadian;
end;
end;

end.
