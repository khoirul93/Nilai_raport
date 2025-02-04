program Aplikasi_Raport1;

uses
  Forms,
  U_koneksi in 'U_koneksi.pas' {f_koneksi},
  U_menu in 'U_menu.pas' {f_menu},
  U_input_siswa in 'U_input_siswa.pas' {f_input_siswa},
  U_input_guru in 'U_input_guru.pas' {F_input_guru},
  U_input_kelas in 'U_input_kelas.pas' {F_input_kelas},
  U_input_mapel in 'U_input_mapel.pas' {f_input_mapel},
  U_input_tgsajar in 'U_input_tgsajar.pas' {F_input_tgsajar},
  U_input_login in 'U_input_login.pas' {f_input_login},
  U_input_kerpibadian in 'U_input_kerpibadian.pas' {F_input_kepribadian},
  U_data_akademis in 'U_data_akademis.pas' {F_data_akademis},
  U_data_guru in 'U_data_guru.pas' {F_data_guru},
  U_data_kelas in 'U_data_kelas.pas' {F_data_kelas},
  U_data_mapel in 'U_data_mapel.pas' {F_data_mapel},
  U_data_nilai in 'U_data_nilai.pas' {F_data_nilai},
  U_data_siswa in 'U_data_siswa.pas' {F_data_siswa},
  U_data_tgsAjar in 'U_data_tgsAjar.pas' {F_data_tgsAjar},
  U_data_akun in 'U_data_akun.pas' {F_data_akun},
  U_data_kepribadian in 'U_data_kepribadian.pas' {F_data_Kepribadian},
  U_DM in 'U_DM.pas' {DM: TDataModule},
  U_input_kepribadian in 'U_input_kepribadian.pas' {f_input_akademis},
  U_input_nilai in 'U_input_nilai.pas' {F_input_nilai},
  U_login in 'U_login.pas' {F_login},
  U_Laporan_nilia in 'U_Laporan_nilia.pas' {F_laporan_nilai},
  U_laporan_nilai_kelas in 'U_laporan_nilai_kelas.pas' {F_Laporan_nilai_kelas},
  U_laporan_nilai_siswa in 'U_laporan_nilai_siswa.pas' {F_laporan_nilai_siswa},
  U_laporan_tgs_g in 'U_laporan_tgs_g.pas' {F_laporan_tgs_g},
  U__laporan_tgs_ajar in 'U__laporan_tgs_ajar.pas' {F_laporan_tgs_ajar},
  U_laporan_tgs_K in 'U_laporan_tgs_K.pas' {F_laporan_tgs_K},
  U_laporan_siswa in 'U_laporan_siswa.pas' {F_laporan_siswa},
  U_laporan_siswa_k in 'U_laporan_siswa_k.pas' {F_laporan_siswa_k},
  U_laporan_kelas in 'U_laporan_kelas.pas' {F_laporan_akademis},
  U_laporan_akademis_k in 'U_laporan_akademis_k.pas' {F_laporan_akademis_k},
  Ulaporan_akademis_s in 'Ulaporan_akademis_s.pas' {F_laporan_akademis_s},
  U_sd in 'U_sd.pas' {F_sd},
  U_laporan_guru in 'U_laporan_guru.pas' {F_laporan_guru};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tf_menu, f_menu);
  Application.CreateForm(Tf_koneksi, f_koneksi);
  Application.CreateForm(Tf_input_siswa, f_input_siswa);
  Application.CreateForm(TF_input_guru, F_input_guru);
  Application.CreateForm(TF_input_kelas, F_input_kelas);
  Application.CreateForm(Tf_input_mapel, f_input_mapel);
  Application.CreateForm(TF_input_tgsajar, F_input_tgsajar);
  Application.CreateForm(Tf_input_login, f_input_login);
  Application.CreateForm(TF_input_kepribadian, F_input_kepribadian);
  Application.CreateForm(TF_data_akademis, F_data_akademis);
  Application.CreateForm(TF_data_guru, F_data_guru);
  Application.CreateForm(TF_data_kelas, F_data_kelas);
  Application.CreateForm(TF_data_mapel, F_data_mapel);
  Application.CreateForm(TF_data_nilai, F_data_nilai);
  Application.CreateForm(TF_data_siswa, F_data_siswa);
  Application.CreateForm(TF_data_tgsAjar, F_data_tgsAjar);
  Application.CreateForm(TF_data_akun, F_data_akun);
  Application.CreateForm(TF_data_Kepribadian, F_data_Kepribadian);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tf_input_akademis, f_input_akademis);
  Application.CreateForm(TF_input_nilai, F_input_nilai);
  Application.CreateForm(TF_login, F_login);
  Application.CreateForm(TF_laporan_nilai, F_laporan_nilai);
  Application.CreateForm(TF_Laporan_nilai_kelas, F_Laporan_nilai_kelas);
  Application.CreateForm(TF_laporan_nilai_siswa, F_laporan_nilai_siswa);
  Application.CreateForm(TF_laporan_tgs_g, F_laporan_tgs_g);
  Application.CreateForm(TF_laporan_tgs_ajar, F_laporan_tgs_ajar);
  Application.CreateForm(TF_laporan_tgs_K, F_laporan_tgs_K);
  Application.CreateForm(TF_laporan_siswa, F_laporan_siswa);
  Application.CreateForm(TF_laporan_siswa_k, F_laporan_siswa_k);
  Application.CreateForm(TF_laporan_akademis, F_laporan_akademis);
  Application.CreateForm(TF_laporan_akademis_k, F_laporan_akademis_k);
  Application.CreateForm(TF_laporan_akademis_s, F_laporan_akademis_s);
  Application.CreateForm(TF_sd, F_sd);
  Application.CreateForm(TF_laporan_guru, F_laporan_guru);
  Application.Run;
end.
