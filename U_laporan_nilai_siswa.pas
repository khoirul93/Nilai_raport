unit U_laporan_nilai_siswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qrpctrls, QRCtrls, jpeg, QuickRpt, ExtCtrls;

type
  TF_laporan_nilai_siswa = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabelNIP: TQRLabel;
    QRLabel12: TQRLabel;
    QRLlabelNAMA: TQRLabel;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRSysData1: TQRSysData;
    QRDBMAPEL: TQRDBText;
    QRDBULANGAN: TQRDBText;
    QRDBTUGAS: TQRDBText;
    QRDBUTS: TQRDBText;
    QRDBUAS: TQRDBText;
    QRDBTOTAL: TQRDBText;
    QRDBKET: TQRDBText;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRPLabel1: TQRPLabel;
    QRPLabelnamawlait: TQRPLabel;
    QRPLabel2: TQRPLabel;
    QRPLabelnipt: TQRPLabel;
    QRLabelKELAS: TQRPLabel;
    QRLabel5: TQRLabel;
    qrlsmt: TQRLabel;
    QRLtahun: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_laporan_nilai_siswa: TF_laporan_nilai_siswa;

implementation

{$R *.dfm}

end.
