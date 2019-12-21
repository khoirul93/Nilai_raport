unit U_laporan_guru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, jpeg, QuickRpt, ExtCtrls;

type
  TF_laporan_guru = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRSysData1: TQRSysData;
    QRDBjk: TQRDBText;
    QRDBNIP: TQRDBText;
    QRDNAMA: TQRDBText;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBTtl: TQRDBText;
    QRDBagama: TQRDBText;
    QRDBStatus: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_laporan_guru: TF_laporan_guru;

implementation

{$R *.dfm}

end.
