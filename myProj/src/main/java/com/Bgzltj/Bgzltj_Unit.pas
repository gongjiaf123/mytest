unit Bgzltj_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Grids, DBGrids, ExtCtrls, ComCtrls, Db, ADODB,
  ToolEdit, ToolWin, RxLookup, Menus, RXDBCtrl, DBGridEh;

type
  TBgzltj_form = class(TForm)
    tjd: TDataSource;
    Panel4: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Mksrq: TDateEdit;
    MJsrq: TDateEdit;
    Label4: TLabel;
    Mvoy: TEdit;
    Label5: TLabel;
    Mwjlx: TComboBox;
    Tj: TADODataSet;
    MainSBar: TStatusBar;
    PBar: TProgressBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Nwj: TRadioGroup;
    Label3: TLabel;
    Mwtr: TComboEdit;
    MVessel: TComboEdit;
    Label6: TLabel;
    MType: TComboBox;
    Nrq: TRadioGroup;
    DBGrid1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure MwtrButtonClick(Sender: TObject);
    procedure MksrqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MJsrqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MVesselKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MvoyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MwtrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGrid1GetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: String);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Bgzltj_form: TBgzltj_form;

implementation

uses ModalUnit, Bgzltj_bbUnit,DBCommandUnit, Cx_GsUnit;

{$R *.DFM}

procedure TBgzltj_form.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TBgzltj_form.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Action:=caFree;
end;

procedure TBgzltj_form.BitBtn1Click(Sender: TObject);
 Var
  TempSql:String;
begin
  Try
  Modal.PrintDBGridEh1.DBGridEh:= DBGrid1;
  Modal.PrintDBGridEh1.Preview;
  Finally
  Modal.PrintDBGridEh1.DBGridEh:=Nil;
  End;

  {ADODataSet1.Close;
  ADODataSet2.Close;
  TempSql:='select a.wtr,zps=count(b.dzlx),'+
           'wt=count(case when b.ghrq is null then b.dzlx end),'+
           'yt=count(case when b.ghrq is not null then b.dzlx end)'+
           ' from tdtable as a,bgzltable as b '+
           'where a.autobh=b.linkno and a.kcrq >= '+
           QuotedStr(DatetoStr(DateTimePicker1.date))+
           ' and a.kcrq <= '+QuotedStr(Datetostr(DateTimePicker2.Date))+
           ' Group by a.wtr order by a.wtr';
  ADOOpenSql(ADODataSet1,TempSql);
  IF ADODataSet1.RecordCount>0 Then
   ADODataSet1AfterScroll(ADODataSet1);
 DBGrid1.SetFocus;
end;

procedure TBgtj_Wtrform.DBGrid2DblClick(Sender: TObject);
var
TempSql:String;
MWtr:String;
MDzlx:String;
begin
IF Not ADODataSet1.Active Then Exit;
If ADODataSet1.IsEmpty Then Exit;
IF ADODataSet2.IsEmpty Then Exit;
MWtr:=ADODataSet1.Fields[0].Asstring;
MDzlx:=ADODataSet2.Fields[0].Asstring;
TempSql:='select kdybh = a.dybh,kcmhc= a.cm + '' V.''+a.hc,'+
         'ktdh = a.tdh,kdzh = b.dzh,kbggs = b.bggs,'+
         'ksdrq = b.sdrq,kfsrq = b.fsrq from tdtable as a,dztable as b '+
         'where a.tdzbh = b.tdzbh and a.kcrq >= '+
          QuotedStr(Datetostr(DateTimePicker1.Date))+' and a.kcrq <= '+
          QuotedStr(Datetostr(DateTimePicker2.Date))+' and b.dzlx = '+
          QuotedStr(MDzlx)+' and b.tkrq is null ';
 IF Trim(MWtr) = '' Then
 TempSql:=TempSql+' and ( a.wtr is null or a.wtr = '''' )'
 Else TempSql:=TempSql+' and a.wtr = '+QuotedStr(Mwtr);
 TempSql:=TempSql+' order by kdybh';

ADOOpenSql(Modal.Temp,TempSql);
With  TBgtj_Wtrbbform.Create(self) Do Begin
     BB.DataSet:=Modal.Temp;
     BKsrq.Caption:=Datetostr(DateTimePicker1.Date);
     BJsrq.Caption:=Datetostr(DateTimePicker2.Date);
     BKh.Caption:=Mwtr;
     BDzlx.Caption:=MDzlx;
     BDybh.DataSet:=Modal.Temp;
     BDybh.DataField:='kdybh';
     BCmhc.DataSet:=Modal.Temp;
     BCmhc.DataField:='kcmhc';
     BTdh.DataSet:=Modal.Temp;
     BTdh.DataField:='ktdh';
     BDzh.DataSet:=Modal.Temp;
     BDzh.DataField:='kdzh';
     BBggs.DataSet:=Modal.Temp;
     BBggs.DataField:='kbggs';
     BSdrq.DataSet:=Modal.Temp;
     BSdrq.DataField:='ksdrq';
     BFsrq.DataSet:=Modal.Temp;
     BFsrq.DataField:='kfsrq';
     Bb.Preview;
   //  Free;
End;
{  if DataModule1.bgtjqy1.Active=true then
     if DataModule1.bgtjqy1.RecordCount>=1 then
     begin
        DataModule1.BgzlReportQy.Close;
        DataModule1.BgzlReportQy.SQL.Clear;
        DataModule1.BgzlReportQy.SQL.Add('select tybh=a.dybh+a.bc,cmhc=a.cm+a.hc,a.tdh,b.dzbh,');
        DataModule1.BgzlReportQy.SQL.Add('b.bggs,b.sdrq,b.fsrq from tdtable as a,bgzltable as b');
        DataModule1.BgzlReportQy.SQL.Add('where a.autobh=b.linkno and a.kcrq>=:mmkcrq and a.kcrq<=:nnkcrq');
        DataModule1.BgzlReportQy.SQL.Add('and a.wtr=:mmwtr and b.dzlx=:mmdzlx and b.ghrq is null order by a.dybh');
        DataModule1.BgzlReportQy.ParamCheck:=true;
        DataModule1.BgzlReportQy.Parameters.ParamByName('mmkcrq').value:=Datetostr(DateTimePicker1.Date);
        DataModule1.BgzlReportQy.Parameters.paramByName('nnkcrq').value:=Datetostr(DateTimePicker2.Date);
        DataModule1.BgzlReportQy.Parameters.ParamByName('mmwtr').value:=
                          DataModule1.bgtjqy.FieldByName('wtr').asstring;
        DataModule1.BgzlReportQy.Parameters.ParamByName('mmdzlx').value:=
                          DataModule1.bgtjqy1.fieldbyname('dzlx').asstring;
        DataModule1.BgzlReportQy.Open;
        Bgzlprform:=TBgzlprform.Create(self);
        Bgzlprform.QuickRep1.DataSet:=DataModule1.BgzlReportQy;
        Bgzlprform.QRLabel10.Caption:=Datetostr(DateTimePicker1.Date);
        Bgzlprform.QRLabel12.Caption:=Datetostr(DateTimePicker2.Date);
        Bgzlprform.QRLabel14.Caption:=DataModule1.bgtjqy1.fieldbyname('dzlx').asstring;
        Bgzlprform.QRLabel17.Caption:=DataModule1.bgtjqy.Fieldbyname('wtr').asstring;
        Bgzlprform.QuickRep1.Preview;
     end;
}end;

procedure TBgzltj_form.FormCreate(Sender: TObject);
 Var
  TempSql:String;
begin
  PBar.Parent:=MainSBar;
  PBar.Left:=MainSBar.Panels[0].Width+MainSBar.Panels[1].Width+2;
  PBar.Top:=2;
  PBar.Width:=MainSBar.Panels[2].Width-2;
  PBar.Height:=MainSBar.Height-2;
  PBar.Visible:=False;
  PBar.Step:=1;
end;

procedure TBgzltj_form.N1Click(Sender: TObject);
Var
  TempSql:String;
  TempWtr,Tempwjlx,TempType:String;
  MPs:Integer;
begin
 If Not Tj.Active Then Exit;
 If Tj.IsEmpty Then Exit;
 IF Tj.FieldByName('kwt').Asinteger <= 0 Then Exit;
 Tempwtr:=Tj.FieldByName('kwtr').Asstring;
 TempWjlx:=Tj.FieldByName('kwjlx').Asstring;
 TempType:=Tj.FieldByName('ktype').Asstring;



 TempSql:= 'select kjobno = a.jobno,kwtno = a.wtno,'+
           'kcmhc = a.vessel + '' '' + a.voy,keta = a.eta,'+
           'ketd = a.etd,kmbl = a.mbl,'+
           'kmdg = a.mdg,klx = a.lx,kwjbh = b.wjbh,'+
           'kbggs = a.bggs,kqdrq = b.qdrq,kscrq = b.scrq,'+
           'kthrq = b.thrq,ktkrq = b.tkrq '+
           'from tab_job a,tab_wj b '+
           'where a.xtbh = b.xtbh and  '+P_Deptlike;

  Case Nwj.ItemIndex OF
    0: TempSql:=TempSql+'and b.qdrq is null';
    1: TempSql:=TempSql+'and b.scrq is null';
    2: TempSql:=TempSql+'and b.thrq is null';
    3: TempSql:=TempSql+'and b.tkrq is null';
  End;



 Case Nwj.ItemIndex OF
  0:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.eta >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.eta <= '+QuotedStr(Mjsrq.Text);
    End;
  1:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.etd >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.etd <= '+QuotedStr(Mjsrq.Text);
    End;
  2:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.rq_input >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.rq_input <= '+QuotedStr(Mjsrq.Text);
    End;

 End;

  If Trim(Tempwjlx)<>'' Then
    TempSql:=TempSql+' and b.wjlx like '+
           QuotedStr(Tempwjlx) else
    TempSql:=TempSql+' and (b.wjlx is null or a.wjlx = '''') ';

  If Trim(Temptype)<>'' Then
    TempSql:=TempSql+' and a.type like '+
           QuotedStr(TempType) else
    TempSql:=TempSql+' and (a.type is null or a.type = '''') ';

 If Trim(Tempwtr)<>'' Then
   TempSql:=TempSql+' and a.wtr like '+QuotedStr(TempWtr)
  Else
   TempSql:= TempSql+' and (a.wtr is null or a.wtr = '''' )';

 If  Trim(MVessel.Text) <> '' Then
 Tempsql:=Tempsql+' and a.vessel like '+QuotedStr(MVessel.Text+'%');
 If  Trim(MVoy.Text) <> '' Then
 Tempsql:=Tempsql+' and a.voy like '+QuotedStr(MVoy.Text+'%');



 TempSql:=TempSql+' order by kcmhc,kjobno';

 IF ADOOpenSql(Modal.Temp,TempSql) Then Begin
     If Modal.Temp.IsEmpty Then Begin
        Error('无数据！');
        Exit;
     End;
     Mps:=Modal.Temp.RecordCount;
      With TBgzltj_BbForm.Create(Self) Do Begin
           Bb.ReportTitle:={P_Bm_Chinese+}'单证资料未退'+'('+TempWjlx+')';
           Btitle.caption:={P_Bm_Chinese+}'单证资料未退'+'('+TempWjlx+')';
           BTitle.Left:=(PageHeaderBand1.Width - BTitle.Width) Div 2;
          IF (Trim(Mksrq.Text) <> '-  -') And
               (Trim(Mjsrq.Text)<> '-  -') Then
          BKcrqTitle.Caption:=Nrq.Items[Nrq.ItemIndex]+' '+Mksrq.Text+' 至 '+
             Mjsrq.Text Else
          BKcrqTitle.Caption:=Nrq.Items[Nrq.ItemIndex]+':全部';
          BWtrTitle.Caption:='委托人:'+TempWtr;
          GsLabel.Caption:='报关公司';
          BhjTitle.Caption:='票数:'+InttoStr(Mps);
          Bb.DataSet:=Modal.Temp;
          Bjobno.DataSet:=Modal.Temp;
          Bjobno.DataField:='kjobno';

          Bcmhc.DataSet:=Modal.Temp;
          Bcmhc.DataField:='kcmhc';
          Btdh.dataset:=Modal.Temp;
          Btdh.DataField:='kmbl';
          Beta.dataset:=Modal.Temp;
          Beta.DataField:='keta';
          Betd.dataset:=Modal.Temp;
          Betd.DataField:='ketd';
          Bmdg.dataset:=Modal.Temp;
          Bmdg.DataField:='kmdg';
          Blx.DataSet:=Modal.Temp;
          Blx.DataField:='klx';
          BDzh.DataSet:=Modal.Temp;
          BDzh.DataField:='kwjbh';
          BSdrq.DataSet:=Modal.Temp;
          BSdrq.DataField:='kqdrq';
          Bscrq.DataSet:=Modal.Temp;
          Bscrq.DataField:='kscrq';
          Bthrq.DataSet:=Modal.Temp;
          Bthrq.DataField:='kthrq';
          BTkrq.DataSet:=Modal.Temp;
          BTkrq.DataField:='ktkrq';
          BBggs.DataSet:=Modal.Temp;
          BBggs.DataField:='kbggs';
          Bb.PreviewModal;
        //  Free;
      End;

 End;

end;

procedure TBgzltj_form.N3Click(Sender: TObject);
Var
  TempSql:String;
  TempWtr,Tempwjlx,TempType:String;
  MPs:Integer;
begin
 If Not Tj.Active Then Exit;
 If Tj.IsEmpty Then Exit;
 IF Tj.FieldByName('kyt').Asinteger <= 0 Then Exit;
 Tempwtr:=Tj.FieldByName('kwtr').Asstring;
 TempWjlx:=Tj.FieldByName('kwjlx').Asstring;
 TempType:=Tj.FieldByName('ktype').Asstring;



 TempSql:= 'select kjobno = a.jobno,kwtno = a.wtno,'+
           'kcmhc = a.vessel + '' '' + a.voy,keta = a.eta,'+
           'ketd = a.etd,kmbl = a.mbl,'+
           'kmdg = a.mdg,klx = a.lx,kwjbh = b.wjbh,'+
           'kbggs = a.bggs,kqdrq = b.qdrq,kscrq = b.scrq,'+
           'kthrq = b.thrq,ktkrq = b.tkrq '+
           'from tab_job a,tab_wj b '+
           'where a.xtbh = b.xtbh and  '+P_Deptlike;;

  Case Nwj.ItemIndex OF
    0: TempSql:=TempSql+'and b.qdrq is not null';
    1: TempSql:=TempSql+'and b.scrq is not null';
    2: TempSql:=TempSql+'and b.thrq is not null';
    3: TempSql:=TempSql+'and b.tkrq is not null';
  End;



 Case Nwj.ItemIndex OF
  0:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.eta >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.eta <= '+QuotedStr(Mjsrq.Text);
    End;
  1:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.etd >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.etd <= '+QuotedStr(Mjsrq.Text);
    End;
  2:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.rq_input >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.rq_input <= '+QuotedStr(Mjsrq.Text);
    End;

 End;

  If Trim(Tempwjlx)<>'' Then
    TempSql:=TempSql+' and b.wjlx like '+
           QuotedStr(Tempwjlx) else
    TempSql:=TempSql+' and (b.wjlx is null or a.wjlx = '''') ';

  If Trim(Temptype)<>'' Then
    TempSql:=TempSql+' and a.type like '+
           QuotedStr(TempType) else
    TempSql:=TempSql+' and (a.type is null or a.type = '''') ';

 If Trim(Tempwtr)<>'' Then
   TempSql:=TempSql+' and a.wtr like '+QuotedStr(TempWtr)
  Else
   TempSql:= TempSql+' and (a.wtr is null or a.wtr = '''' )';

 If  Trim(MVessel.Text) <> '' Then
 Tempsql:=Tempsql+' and a.vessel like '+QuotedStr(MVessel.Text+'%');
 If  Trim(MVoy.Text) <> '' Then
 Tempsql:=Tempsql+' and a.voy like '+QuotedStr(MVoy.Text+'%');



 TempSql:=TempSql+' order by kcmhc,kjobno';

 IF ADOOpenSql(Modal.Temp,TempSql) Then Begin
     If Modal.Temp.IsEmpty Then Begin
        Error('无数据！');
        Exit;
     End;
     Mps:=Modal.Temp.RecordCount;
      With TBgzltj_BbForm.Create(Self) Do Begin
           Bb.ReportTitle:={P_Bm_Chinese+}'单证资料未退'+'('+TempWjlx+')';
           Btitle.caption:={P_Bm_Chinese+}'单证资料未退'+'('+TempWjlx+')';
           BTitle.Left:=(PageHeaderBand1.Width - BTitle.Width) Div 2;
          IF (Trim(Mksrq.Text) <> '-  -') And
               (Trim(Mjsrq.Text)<> '-  -') Then
          BKcrqTitle.Caption:=Nrq.Items[Nrq.ItemIndex]+' '+Mksrq.Text+' 至 '+
             Mjsrq.Text Else
          BKcrqTitle.Caption:=Nrq.Items[Nrq.ItemIndex]+':全部';
          BWtrTitle.Caption:='委托人:'+TempWtr;
          GsLabel.Caption:='报关公司';
          BhjTitle.Caption:='票数:'+InttoStr(Mps);
          Bb.DataSet:=Modal.Temp;
          Bjobno.DataSet:=Modal.Temp;
          Bjobno.DataField:='kjobno';

          Bcmhc.DataSet:=Modal.Temp;
          Bcmhc.DataField:='kcmhc';
          Btdh.dataset:=Modal.Temp;
          Btdh.DataField:='kmbl';
          Beta.dataset:=Modal.Temp;
          Beta.DataField:='keta';
          Betd.dataset:=Modal.Temp;
          Betd.DataField:='ketd';
          Bmdg.dataset:=Modal.Temp;
          Bmdg.DataField:='kmdg';
          Blx.DataSet:=Modal.Temp;
          Blx.DataField:='klx';
          BDzh.DataSet:=Modal.Temp;
          BDzh.DataField:='kwjbh';
          BSdrq.DataSet:=Modal.Temp;
          BSdrq.DataField:='kqdrq';
          Bscrq.DataSet:=Modal.Temp;
          Bscrq.DataField:='kscrq';
          Bthrq.DataSet:=Modal.Temp;
          Bthrq.DataField:='kthrq';
          BTkrq.DataSet:=Modal.Temp;
          BTkrq.DataField:='ktkrq';
          BBggs.DataSet:=Modal.Temp;
          BBggs.DataField:='kbggs';
          Bb.PreviewModal;
        //  Free;
      End;

 End;

end;
procedure TBgzltj_form.MwtrButtonClick(Sender: TObject);
 Var
  Temp:String;
begin
 Application.CreateForm(TCx_GsForm,Cx_GsForm);
 Cx_GsForm.PGslx:='委托人';
 If Cx_GsForm.ShowModal = mrok Then Begin
   Temp:=Cx_GsForm.pgs;
   IF Trim(Temp) <> '' Then Begin
    MWtr.Text:=Temp;
   End;
 End;

 FreeAndNil(Cx_GsForm);
end;





procedure TBgzltj_form.MksrqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key in [VK_RETURN] then
  mjsrq.setfocus;
end;

procedure TBgzltj_form.MJsrqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key in [VK_RETURN] then
  mvessel.setfocus;
end;

procedure TBgzltj_form.MVesselKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key in [VK_RETURN] then
  mvoy.setfocus;
end;

procedure TBgzltj_form.MvoyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key in [VK_RETURN] then
  mwtr.setfocus;
end;

procedure TBgzltj_form.MwtrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key in [VK_RETURN] then
  Mwjlx.setfocus;
end;

procedure TBgzltj_form.DBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
 if Not tj.Active Then Exit;
 If tj.IsEmpty Then exit;

 case Column.Title.SortMarker of
    smNoneEh: Begin
     Column.Title.SortMarker := smDownEh;
     tj.Sort:=Column.FieldName;
    End;
    smDownEh: Begin
    Column.Title.SortMarker := smUpEh;
    tj.Sort:=Column.FieldName+' DESC';
    End;
    smUpEh: Begin
    Column.Title.SortMarker:=smDownEh;
    tj.Sort:=Column.FieldName;
    End;
 end;
end;

procedure TBgzltj_form.DBGrid1GetFooterParams(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  If UpperCase(Trim(Column.FieldName)) = 'KWTR' Then
   Text:='共'+InttoStr(tj.RecordCount)+ '条';

 //If UpperCase(Trim(Column.FieldName)) = 'KJE' Then
  // Text:=FormatFloat('0.00',F_je);

end;

procedure TBgzltj_form.BitBtn3Click(Sender: TObject);
 Var
  TempSql:String;
begin


 Try
  PBar.Visible:=True;
  PBar.Max:=8;
  PBar.Position:=2;
  TempSql:='select ktype = a.type,kwtr = a.wtr,'+
           'kwjlx = b.wjlx,kzps = count(b.wjlx),';
  Case Nwj.ItemIndex OF
    0: TempSql:=TempSql+'kwt = count(case when b.qdrq is null '+
                'then b.wjlx end),kyt = count(case when '+
                'b.qdrq is not null then b.wjlx end)';
    1: TempSql:=TempSql+'kwt = count(case when b.scrq is null '+
                'then b.wjlx end),kyt = count(case when '+
                'b.scrq is not null then b.wjlx end)';
    2: TempSql:=TempSql+'kwt = count(case when b.thrq is null '+
                'then b.wjlx end),kyt = count(case when '+
                'b.thrq is not null then b.wjlx end)';
    3: TempSql:=TempSql+'kwt = count(case when b.tkrq is null '+
                'then b.wjlx end),kyt = count(case when '+
                'b.tkrq is not null then b.wjlx end)';
  End;

 Tempsql:=Tempsql+' from tab_job a,tab_wj b '+
           'where a.xtbh = b.xtbh and '+P_DeptLike;

 If  Trim(Mwjlx.Text) <> '' Then
 Tempsql:=Tempsql+' and b.wjlx like '+QuotedStr(Mwjlx.Text+'%');
 If  Trim(MType.Text) <> '' Then
 Tempsql:=Tempsql+' and a.type like '+QuotedStr(MType.Text+'%');

 Case Nwj.ItemIndex OF
  0:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.eta >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.eta <= '+QuotedStr(Mjsrq.Text);
    End;
  1:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.etd >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.etd <= '+QuotedStr(Mjsrq.Text);
    End;
  2:Begin If IsRightDate(Mksrq.Text) Then
      TempSql:=Tempsql+' and a.rq_input >= '+QuotedStr(Mksrq.Text);
         If IsRightDate(Mjsrq.Text) Then
      TempSql:=TempSql+' and a.rq_input <= '+QuotedStr(Mjsrq.Text);
    End;

 End;
 If  Trim(MVessel.Text) <> '' Then
 Tempsql:=Tempsql+' and a.vessel like '+QuotedStr(MVessel.Text+'%');
 If  Trim(MVoy.Text) <> '' Then
 Tempsql:=Tempsql+' and a.voy like '+QuotedStr(MVoy.Text+'%');



 IF  Trim(Mwtr.Text)<>'' Then
  TempSql:=TempSql+' and a.wtr like '+Quotedstr(Mwtr.Text+'%');

 TempSql:=TempSql+' group by a.type,a.wtr,b.wjlx '+
 'order by ktype,kwjlx,kwtr';

 PBar.Position:=3;
 IF ADOOpenSql(Tj,TempSql) Then Begin
     PBar.Position:=6;
 End;
 IF Tjd.DataSet = Nil Then Tjd.DataSet:=Tj;
 Finally
    PBar.Visible:=False;
    PBar.Position:=1;
    DBGrid1.SetFocus;
   // MainSBar.Panels[1].Text:=InttoStr(Tj.RecordCount);
 End;
end;

end.
