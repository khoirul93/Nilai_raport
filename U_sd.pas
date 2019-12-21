unit U_sd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, sPanel;

type
  TF_sd = class(TForm)
    sPanel1: TsPanel;
    Image1: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_sd: TF_sd;

implementation

{$R *.dfm}

end.
