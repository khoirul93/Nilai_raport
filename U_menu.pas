unit U_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ActnMan, sSkinManager, sSkinProvider, ToolWin, ActnCtrls,
  Ribbon, RibbonLunaStyleActnCtrls, Buttons, sSpeedButton,
  RibbonObsidianStyleActnCtrls, ExtCtrls, jpeg, ComCtrls, XPMan, HTMLHelpviewer, shellapi;


type
  Tf_menu = class(TForm)
    Ribbon1: TRibbon;
    rbp_file: TRibbonPage;
    rbg_login: TRibbonGroup;
    rbg_input: TRibbonPage;
    sSkinProvider1: TsSkinProvider;
    sSkinManager1: TsSkinManager;
    ActionManager1: TActionManager;
    btn_login: TsSpeedButton;
    rbg_logout: TRibbonGroup;
    btn_logout: TsSpeedButton;
    rbg_guru: TRibbonGroup;
    btn_guru: TsSpeedButton;
    rbg_kelas: TRibbonGroup;
    btn_kelas: TsSpeedButton;
    RibbonPage1: TRibbonPage;
    rbg_nilai: TRibbonGroup;
    btn_nilai: TsSpeedButton;
    rbg_mapel: TRibbonGroup;
    btn_mapel: TsSpeedButton;
    rbg_tgsajar: TRibbonGroup;
    btn_tgsajar: TsSpeedButton;
    rbg_Kepribadian: TRibbonGroup;
    btn_Kepribadian: TsSpeedButton;
    rb_laporan: TRibbonPage;
    Rbg_lap_akademis: TRibbonGroup;
    sSpeedButton2: TsSpeedButton;
    Rbg_lap_nilai: TRibbonGroup;
    sSpeedButton8: TsSpeedButton;
    Rbg_lap_siswa: TRibbonGroup;
    sSpeedButton9: TsSpeedButton;
    Rbg_lap_tgs: TRibbonGroup;
    sSpeedButton10: TsSpeedButton;
    rbg_siswa: TRibbonGroup;
    btn_siswa: TsSpeedButton;
    RibbonPage3: TRibbonPage;
    rbg_akun: TRibbonGroup;
    btn_akun: TsSpeedButton;
    rbg_database: TRibbonGroup;
    btn_database: TsSpeedButton;
    rbg_akademis: TRibbonGroup;
    btn_akademis: TsSpeedButton;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    RibbonPage2: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    sSpeedButton1: TsSpeedButton;
    RibbonGroup2: TRibbonGroup;
    sSpeedButton3: TsSpeedButton;
    rbg_lap_guru: TRibbonGroup;
    sSpeedButton4: TsSpeedButton;
    procedure btn_KepribadianClick(Sender: TObject);
    procedure btn_guruClick(Sender: TObject);
    procedure btn_kelasClick(Sender: TObject);
    procedure btn_mapelClick(Sender: TObject);
    procedure btn_tgsajarClick(Sender: TObject);
    procedure btn_siswaClick(Sender: TObject);
    procedure btn_dakademisClick(Sender: TObject);
    procedure btn_dkelasClick(Sender: TObject);
    procedure btn_dguruClick(Sender: TObject);
    procedure Btn_dmapelClick(Sender: TObject);
    procedure btn_dnilaiClick(Sender: TObject);
    procedure btn_dsiswaClick(Sender: TObject);
    procedure btn_dtgsmengajarClick(Sender: TObject);
    procedure btn_dakunClick(Sender: TObject);
    procedure btn_deskulClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_akunClick(Sender: TObject);
    procedure btn_databaseClick(Sender: TObject);
    procedure btn_akademisClick(Sender: TObject);
    procedure btn_nilaiClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_logoutClick(Sender: TObject);
    procedure sSpeedButton8Click(Sender: TObject);
    procedure sSpeedButton10Click(Sender: TObject);
    procedure sSpeedButton9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_menu: Tf_menu;

implementation

uses U_DM, U_input_siswa, U_koneksi, U_input_guru, U_input_kelas, U_input_mapel,
  U_input_tgsajar, U_input_kerpibadian, U_input_login, U_data_akademis,
  U_data_guru, U_data_kelas, U_data_mapel, U_data_nilai, U_data_siswa,
  U_data_tgsAjar, U_data_akun, U_data_kepribadian, U_input_kepribadian,
  U_input_nilai, U_login, U_Laporan_nilia, U__laporan_tgs_ajar, U_laporan_siswa,
  U_laporan_kelas, U_sd, U_laporan_guru;

{$R *.dfm}

procedure Tf_menu.btn_akademisClick(Sender: TObject);
begin
F_data_akademis.Show;
end;

procedure Tf_menu.btn_akunClick(Sender: TObject);
begin
F_data_akun.Show;
end;

procedure Tf_menu.btn_dakademisClick(Sender: TObject);
begin
F_data_akademis.Show;
end;

procedure Tf_menu.btn_dakunClick(Sender: TObject);
begin
F_data_akun.Show;
end;

procedure Tf_menu.btn_databaseClick(Sender: TObject);
begin
f_koneksi.Show;
end;

procedure Tf_menu.btn_deskulClick(Sender: TObject);
begin
F_data_Kepribadian.Show;
end;

procedure Tf_menu.btn_dguruClick(Sender: TObject);
begin
F_data_guru.Show;
end;

procedure Tf_menu.btn_dkelasClick(Sender: TObject);
begin
F_data_kelas.Show;
end;

procedure Tf_menu.Btn_dmapelClick(Sender: TObject);
begin
F_data_mapel.Show;
end;

procedure Tf_menu.btn_dnilaiClick(Sender: TObject);
begin
F_data_nilai.Show;
end;

procedure Tf_menu.btn_dsiswaClick(Sender: TObject);
begin
F_data_siswa.Show;
end;

procedure Tf_menu.btn_dtgsmengajarClick(Sender: TObject);
begin
F_data_tgsAjar.Show;
end;

procedure Tf_menu.btn_siswaClick(Sender: TObject);
begin
 F_data_siswa.Show;
end;

procedure Tf_menu.btn_guruClick(Sender: TObject);
begin
F_data_guru.Show;
end;

procedure Tf_menu.btn_kelasClick(Sender: TObject);
begin
F_data_kelas.Show;
end;

procedure Tf_menu.btn_loginClick(Sender: TObject);
begin
F_login.Show;
F_login.edit_username.Clear;
F_login  .edit_pass.Clear;
  F_login.edit_username.SetFocus;
end;

procedure Tf_menu.btn_logoutClick(Sender: TObject);
begin
if (Application.MessageBox('Yakin Akan Logout ?','Knfirmasi Ulang',MB_YESNO)=ID_YES) then
begin
   f_menu.btn_login.Visible:=True;
   f_menu.btn_login.Enabled:=True;
   f_menu.rbg_login.Enabled:=True;
     f_menu.rbg_logout.Enabled:=False ;
     f_menu.rbg_siswa.Visible:=False;
     f_menu.rbg_guru.Visible:=False;
     f_menu.rbg_kelas.Visible:=False;
     f_menu.rbg_mapel.Visible:=False;
     f_menu.rbg_tgsajar.Visible:=False;
     f_menu.rbg_Kepribadian.Visible:=False;
     f_menu.rbg_akademis.Visible:=False;
     f_menu.rbg_nilai.Visible:=False;
     f_menu.rbg_database.Visible:=False;
     f_menu.rbg_akun.Visible:=False;
     f_menu.Rbg_lap_akademis.Visible:=False;
     f_menu.Rbg_lap_nilai.Visible:=False;
     f_menu.Rbg_lap_siswa.Visible:=False;
     f_menu.Rbg_lap_tgs.Visible:=False;
     f_menu.rbg_lap_guru.Visible:=False;
     f_menu.btn_login.Visible:=True;


end;

end;

procedure Tf_menu.btn_mapelClick(Sender: TObject);
begin
  F_data_mapel.Show;
end;

procedure Tf_menu.btn_nilaiClick(Sender: TObject);
begin
F_data_nilai.Show;
end;

procedure Tf_menu.btn_KepribadianClick(Sender: TObject);
begin
F_data_Kepribadian.Show;
end;

procedure Tf_menu.btn_tgsajarClick(Sender: TObject);
begin
F_data_tgsAjar.Show;
end;

procedure Tf_menu.FormCreate(Sender: TObject);
begin

 f_menu.btn_login.Visible:=True;
 f_menu.btn_login.Enabled:=True;
     f_menu.rbg_logout.Enabled:=False ;
     f_menu.rbg_siswa.Visible:=False;
     f_menu.rbg_guru.Visible:=False;
     f_menu.rbg_kelas.Visible:=False;
     f_menu.rbg_mapel.Visible:=False;
     f_menu.rbg_tgsajar.Visible:=False;
     f_menu.rbg_Kepribadian.Visible:=False;
     f_menu.rbg_akademis.Visible:=False;
     f_menu.rbg_nilai.Visible:=False;
     f_menu.rbg_database.Visible:=False;
     f_menu.rbg_akun.Visible:=False;
     f_menu.Rbg_lap_akademis.Visible:=False;
     f_menu.Rbg_lap_nilai.Visible:=False;
     f_menu.Rbg_lap_siswa.Visible:=False;
     f_menu.Rbg_lap_tgs.Visible:=False;
     f_menu.rbg_lap_guru.Visible:=False;

     StatusBar1.Panels[6].Text:='SISTEM PENGOLAHAN NILAI RAPORT                     ';
   //  F_login.ShowHint;

end;

procedure Tf_menu.FormShow(Sender: TObject);
var
NamaFile,CS: String;
List: TStringList;
begin
NamaFile :='koneksi';
  Namafile := ChangeFileExt(NamaFile, '.ini');
  if FileExists(NamaFile) then
  begin
    List := TStringList.Create;
      try
      List.NameValueSeparator := ':';
        try
        List.LoadFromFile(NamaFile);
        CS:=List.Values['path'];
        except
        end;
    finally
    List.Free;
end;
//KoNEKSI
    try
      dm.koneksi.Connected:=false;
      dm.koneksi.LoginPrompt:=false;
      dm.koneksi.ConnectionString:=CS;
      dm.koneksi.Connected:=true;
      //ShowMessage('Sukses Konek!!');
      DM.q_akademis.Connection:=DM.koneksi;
 DM.ds_akadeis.DataSet:=DM.q_akademis;
 DM.q_kepribadian.Connection:=DM.koneksi;
 DM.ds_kepribadian.DataSet:=DM.q_kepribadian;
 DM.q_guru.Connection:=DM.koneksi;
 DM.ds_guru.DataSet:=DM.q_guru;
 DM.q_kelas.Connection:=DM.koneksi;
 DM.ds_kelas.DataSet:=DM.q_kelas;
 DM.q_login.Connection:=DM.koneksi;
 DM.ds_login.DataSet:=DM.q_login;
 DM.q_mapel.Connection:=DM.koneksi;
 DM.ds_mapel.DataSet:=DM.q_mapel;
 DM.q_nilai.Connection:=DM.koneksi;
 DM.ds_nilai.DataSet:=DM.q_nilai;
 DM.q_siswa.Connection:=DM.koneksi;
 DM.ds_siswa.DataSet:=DM.q_siswa;
 DM.q_tugasmengajar.Connection:=DM.koneksi;
 DM.ds_tugasmengajar.DataSet:=DM.q_tugasmengajar;
 DM.ADOQuery1.Connection:=DM.koneksi;


  except
    ShowMessage('Gagal Konek');
  end;
  end
  else
 begin
 ShowMessage('File Koneksi Tidak ditemukan');
  f_menu.Show;

end;
F_login.Show;
end;

procedure Tf_menu.sSpeedButton10Click(Sender: TObject);
begin
F_laporan_tgs_ajar.Show;
end;

procedure Tf_menu.sSpeedButton1Click(Sender: TObject);
begin
F_sd.Show;
end;

procedure Tf_menu.sSpeedButton2Click(Sender: TObject);
begin
F_laporan_akademis.Show;
end;

procedure Tf_menu.sSpeedButton3Click(Sender: TObject);
begin
ShellExecute(Handle, 'open','E:\Aplikasi Raport\help.chm',nil,nil,SW_NORMAL);
end;

procedure Tf_menu.sSpeedButton4Click(Sender: TObject);
begin
with DM.q_guru do
 begin
    Active:=False;
  Close;
  SQL.Clear;
  SQL.Text:='  select ROW_NUMBER() over (order by Guru_nip ) as NO, * from guru';
   Active:=True ;
   F_laporan_guru.QuickRep1.DataSet:=DM.q_guru;
   F_laporan_guru.QRDBNIP.DataSet:=DM.q_guru; F_laporan_guru.QRDBNIP.DataField:='guru_nip';
   F_laporan_guru.QRDNAMA.DataSet:=DM.q_guru; F_laporan_guru.QRDNAMA.DataField:='guru_nama';
   F_laporan_guru.QRDBjk.DataSet:=DM.q_guru; F_laporan_guru.QRDBjk.DataField:='guru_jk';
   F_laporan_guru.QRDBTtl.DataSet:=DM.q_guru; F_laporan_guru.QRDBTtl.DataField:='guru_tgllahir';
   F_laporan_guru.QRDBagama.DataSet:=DM.q_guru; F_laporan_guru.QRDBagama.DataField:='guru_agama';
  // F_laporan_guru.QRDBalamat.DataSet:=DM.q_guru; F_laporan_guru.QRDBalamat.DataField:='guru_alamat';
   F_laporan_guru.QRDBStatus.DataSet:=DM.q_guru; F_laporan_guru.QRDBStatus.DataField:='guru_sattus';
   F_laporan_guru.QuickRep1.Preview;
 end;
end;

procedure Tf_menu.sSpeedButton8Click(Sender: TObject);
begin
F_laporan_nilai.Show;
end;

procedure Tf_menu.sSpeedButton9Click(Sender: TObject);
begin
F_laporan_siswa.Show;
end;

procedure Tf_menu.Timer1Timer(Sender: TObject);
var judul:string;
begin
judul:=StatusBar1.Panels[6].Text;
judul:=judul+judul[1];
judul:=Copy(judul,2,length(judul)-1);
StatusBar1.Panels[6].Text:=judul;
StatusBar1.Panels[3].Text:=TimeToStr(Time);
StatusBar1.Panels[5].Text:=DateToStr(Date);




end;

end.
