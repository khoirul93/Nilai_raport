unit U_laporan_tgs_g;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, jpeg, QuickRpt, ExtCtrls;

type
  TF_laporan_tgs_g = class(TForm)
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
    QRLabel18: TQRLabel;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRSysData1: TQRSysData;
    QRDBMAPEL: TQRDBText;
    QRDBSTATUS: TQRDBText;
    QRDBKELAS: TQRDBText;
    QRDBSISWA: TQRDBText;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_laporan_tgs_g: TF_laporan_tgs_g;

implementation

{$R *.dfm}

end.
