unit Bgzltj_bbUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TBgzltj_bbform = class(TForm)
    BB: TQuickRep;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    Btitle: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape24: TQRShape;
    QRLabel7: TQRLabel;
    QRSysData2: TQRSysData;
    BKcrqTitle: TQRLabel;
    BWtrTitle: TQRLabel;
    QRChildBand2: TQRChildBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape13: TQRShape;
    QRBand1: TQRBand;
    bjobno: TQRDBText;
    bcmhc: TQRDBText;
    Btdh: TQRDBText;
    beta: TQRDBText;
    bdzh: TQRDBText;
    bmdg: TQRDBText;
    QRShape3: TQRShape;
    QRShape8: TQRShape;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape15: TQRShape;
    bsdrq: TQRDBText;
    Bscrq: TQRDBText;
    QRShape16: TQRShape;
    Blx: TQRDBText;
    QRShape17: TQRShape;
    SummaryBand1: TQRBand;
    BhjTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRShape9: TQRShape;
    Bthrq: TQRDBText;
    BTkrq: TQRDBText;
    GsLabel: TQRLabel;
    QRShape14: TQRShape;
    BBggs: TQRDBText;
    QRLabel3: TQRLabel;
    betd: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Bgzltj_bbform: TBgzltj_bbform;

implementation

{$R *.DFM}

procedure TBgzltj_bbform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=CaFree;
end;

end.
