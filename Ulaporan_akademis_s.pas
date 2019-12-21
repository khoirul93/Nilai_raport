unit Ulaporan_akademis_s;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, qrpctrls, jpeg, QuickRpt, ExtCtrls;

type
  TF_laporan_akademis_s = class(TForm)
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
    QRLabelKELAS: TQRPLabel;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRSysData1: TQRSysData;
    QRDBjenis: TQRDBText;
    QRDBnilai: TQRDBText;
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
    QRLabel22: TQRLabel;
    QRLTahun: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_laporan_akademis_s: TF_laporan_akademis_s;

implementation

{$R *.dfm}

end.
