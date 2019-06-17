unit Dcxh_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Db, Grids, DBGrids, RxLookup,
  ExtCtrls, ToolWin, ImgList, ADODB, Mask, ToolEdit, DBGridEh, kbmMemTable,
  RM_dset, RM_dbset, RM_class;

type
  TDcxh_Form = class(TForm)
    dxqdd: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGridEh;
    dxqd: TkbmMemTable;
    dxqdklx: TStringField;
    dxqdkjobno: TStringField;
    dxqdkwtr: TStringField;
    dxqdkmbl: TStringField;
    dxqdkmdg: TStringField;
    dxqdketa: TDateTimeField;
    dxqdkyyr: TStringField;
    dxqdkxh: TStringField;
    Label3: TLabel;
    Mksrq: TDateEdit;
    Label4: TLabel;
    Mjsrq: TDateEdit;
    BitBtn1: TBitBtn;
    dxqdkvessel: TStringField;
    dxqdkvoy: TStringField;
    dxqdkywuser: TStringField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    t: TADODataSet;
    dxqdkxx: TStringField;
    dxqdkfw_ck: TBooleanField;
    dxqdkdlr: TStringField;
    dxqdkfw_ys: TBooleanField;
    RadioGroup1: TRadioGroup;
    dxqdkfw_bg: TBooleanField;
    mxh: TMemo;
    dxqdkxl: TStringField;
    Label1: TLabel;
    MVessel: TComboEdit;
    MVoy: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MCmButtonClick(Sender: TObject);
    procedure MCmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MVesselButtonClick(Sender: TObject);
  private
    F_Tj:String;
    MZGp20,MZSp20,MZGp40,MZHc40,MZSp40,MZGp45:Integer;
    MZTGp20,MZTSp20,MZTGp40,MZTHc40,MZTSp40,MZTGp45:Integer;
    Mjs,Mlf,Mzl:Real;
    Mtjs,Mtlf,Mtzl:Real;
    FReport:String;
    Procedure SetSql(Value:String);
    procedure OrderCol(DataSource : TDataSource);
    Function WriteXl:String;
     Procedure Copydata(Source,Dest: TDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dcxh_Form: TDcxh_Form;

implementation
          Uses
           ModalUnit,DBCommandUnit,OrderFieldUnit,
           Pcqdbb_Unit, Cx_CmUnit, Cx_GsUnit,Pcqdbb_xhUnit, Preview_Unit;
{$R *.DFM}

procedure TDcxh_Form.BitBtn1Click(Sender: TObject);
 Var
  Tempsql:String;
  I,K,L:Integer;
  Tempxtbh:String;
  templx:string;
  Tempjobno:String;
  Tempmbl:String;
  tempxh:String;
  Tempdlr:String;
  TempVessel:String;
begin

 K:=0;
 Tempdlr:=RadioGroup1.Items[RadioGroup1.Itemindex];

 if Msg_Flag then
IF Confirm('真的要查看吗？',False) <> IDYES Then Exit;


 TempSql:='select kxtbh = a.xtbh,klx = a.lx,kjobno = a.jobno,'+
 'kywuser = a.ywuser,'+
 'kfw_ck = a.fw_ck,kfw_ys = a.fw_ys,kfw_bg= a.fw_bg,'+
 'kwtr = a.wtr,kmbl = a.mbl,'+
 'kmdg = a.mdg,keta = a.eta,'+
 'kvessel = a.vessel,kvoy = a.voy,'+
 'kxx1 = a.xx1,ksl1 = a.sl1,kxx2 = a.xx2,ksl2 = a.sl2,'+
 'kxx3 = a.xx3,ksl3 = a.sl3,kxl = a.xl,'+
 'kdlr = a.dlr,kyyr = a.yyr,kxh_text = a.xh_text  '+
 'from tab_job a  where a.type = '+QuotedStr('海运出口')+
 ' and a.tg = 0 and a.vessel <> '''' and a.vessel is not null '+
// 'and a.lx in ( '+Flag_lx+' )'+
 ' and a.lx in (''整箱'',''整主'',''拼柜'')  and '+
 P_DeptLike;

 IF Tempdlr = '不包括新鉴真苏州号' Then Begin
    TempSql:=TempSql+' and (a.dlr <> ''中日轮渡'' and a.dlr <> ''国际轮渡'') ';
 End Else if Tempdlr = '新鉴真苏州号' Then Begin
    TempSql:=TempSql+' and (a.dlr = ''中日轮渡'' or a.dlr = ''国际轮渡'') ';
 End;

 IF Trim(MVessel.Text) <> '' Then Begin
   Tempsql:=tempsql+' and a.vessel like '+QuotedStr('%'+Mvessel.Text+'%');
   Inc(K);
 End;

 IF Trim(MVoy.Text) <> '' Then Begin
   Tempsql:=tempsql+' and a.voy like '+QuotedStr('%'+Mvoy.Text+'%');
   Inc(K);
 End;

 If IsRightDate(Mksrq.Text) Then Begin
  TempSql:=TempSql+' and a.eta >= '+QuotedStr(Mksrq.Text);
  Inc(K);
 End;

 If IsRightDate(Mjsrq.Text) Then Begin
  TempSql:=TempSql+' and a.eta <= '+QuotedStr(Mjsrq.Text);
  Inc(K);
 End;

 Tempsql:=Tempsql+' order by a.eta,a.vessel,a.voy ';

 IF K = 0 Then Begin
    IF Confirm('您未输入任何查询条件,如果查询需要大量时间,确定查询吗？') <>
       IDYES Then Exit;
 End;


 If  ADOOpenSql(Modal.Temp,TempSql)= False Then Exit;
 dxqd.Close;
 dxqd.Open;
 IF dxqdd.DataSet = Nil Then dxqdd.DataSet:=dxqd;

 With Modal.Temp DO Begin
   First;
   L:=0;
   TempVessel:=Trim(FieldByName('kvessel').Asstring)+' '+
                  Trim(FieldByName('kvoy').Asstring);
    While Not Eof Do Begin
      tempxtbh:=FieldByName('kxtbh').AsString;
      templx:=FieldByName('klx').Asstring;
      Tempjobno:=FieldByName('kjobno').asstring;

      IF templx = '拼柜' Then Begin
         Tempsql:='select mbl from tab_job where lx <> ''拼柜'' and lx = ''自拼'' and tg = 0 and '+
         'zpno = '+
         QuotedStr(TempJobno)+' order by mbl';
         ADOOpenSql(t,TempSql);
         Tempmbl:='';
         t.First;
         While NOt t.Eof Do Begin
           tempmbl:=tempmbl+trim(t.FieldByName('mbl').AsString)+#13#10;
           t.Next;
         End;
      End Else If (Templx = '整主') or (Templx = '整箱') Then Begin
         Tempsql:='select mbl from tab_job where lx in (''整主'',''整箱'',''整拼'') '+
         'and tg = 0 and jobno like '+
         QuotedStr(TempJobno+'%')+' order by mbl';
         ADOopenSql(t,TempSql);
         Tempmbl:='';
         t.First;
         While NOt t.Eof Do Begin
            tempmbl:=tempmbl+trim(t.FieldByName('mbl').AsString)+#13#10;
            t.Next;
         End;
      End Else Begin
         Tempmbl:=FieldByName('kmbl').asstring;
      End;
      TempSql:='select xx,xh from tab_xh where xtbh = '+QuotedStr(Tempxtbh);
      ADOOpenSql(t,TempSql);
      Tempxh:='';
      t.First;
      While Not t.Eof Do Begin
          If Trim(t.FieldByName('xh').AsString) <> '' Then
           tempxh:=tempxh+trim(t.FieldByName('xh').AsString)+#13#10;
         { If Trim(t.FieldByName('fh').AsString) <> '' Then
           tempxh:=tempxh+trim(t.FieldByName('fh').AsString)+'/';

          tempxh:=tempxh+trim(t.FieldByName('xx').AsString);  }
          t.Next;
      End;
      If Trim(Tempxh) = '' Then   Begin
        Mxh.Lines.Clear;
        Mxh.Lines.Text:=FieldByName('kxh_text').asstring;
        For I:= 0 to Mxh.Lines.Count - 1 Do Begin
          Tempxh:=Tempxh+Copy(Mxh.Lines[I],1,11)+#13#10;
        End;

      End;

        dxqd.Append;
        dxqd.FieldByName('kywuser').AsString:=
                FieldByName('kywuser').AsString;
        dxqd.FieldByName('kwtr').AsString:=
                FieldByName('kwtr').AsString;
        dxqd.FieldByName('klx').AsString:=
                FieldByName('klx').AsString;
        dxqd.FieldByName('kjobno').AsString:=
                FieldByName('kjobno').AsString;
        dxqd.FieldByName('kmbl').AsString:=Tempmbl;
        dxqd.FieldByName('kxh').Asstring:=tempxh;

        dxqd.FieldByName('kxl').AsString:=
                FieldByName('kxl').AsString;
        dxqd.FieldByName('kmdg').AsString:=
                FieldByName('kmdg').AsString;
        dxqd.FieldByName('kdlr').AsString:=
                FieldByName('kdlr').AsString;
        dxqd.FieldByName('kyyr').AsString:=
                FieldByName('kyyr').AsString;
        dxqd.FieldByName('kfw_ck').AsBoolean:=
                FieldByName('kfw_ck').AsBoolean;
        dxqd.FieldByName('kfw_ys').AsBoolean:=
                FieldByName('kfw_ys').AsBoolean;
        dxqd.FieldByName('kfw_bg').AsBoolean:=
                FieldByName('kfw_bg').AsBoolean;
        If L = 0 Then
        dxqd.FieldByName('kvessel').AsString:=TempVessel;
        {        FieldByName('kvessel').AsString;
        dxqd.FieldByName('kvoy').AsString:=
                FieldByName('kvoy').AsString;
        dxqd.FieldByName('keta').Asdatetime:=
                FieldByName('keta').Asdatetime;}

      Next;
      Inc(L);
     IF TempVessel <> Trim(FieldByName('kvessel').Asstring)+' '+
                      Trim(FieldByName('kvoy').Asstring) Then Begin
         TempVessel:=Trim(FieldByName('kvessel').Asstring)+' '+
                      Trim(FieldByName('kvoy').Asstring);
          L:=0;
      End;
      
    End;

  End;



End;


procedure TDcxh_Form.SetSql(Value: String);
  Var
  TempXl:String;
  MGp20,MSp20,MGp40,MHc40,MSp40,MGp45:Integer;
  I:Integer;
begin




  MZGp20:=0;
  MZSp20:=0;
  MZGp40:=0;
  MZHc40:=0;
  MZSp40:=0;
  MZGp45:=0;
  MZTGp20:=0;
  MZTSp20:=0;
  MZTGp40:=0;
  MZTHc40:=0;
  MZTSp40:=0;
  MZTGp45:=0;

  Mjs:=0;
  Mlf:=0;
  Mzl:=0;
  Mtjs:=0;
  Mtlf:=0;
  Mtzl:=0;


{ If  ADOOpenSql(dxqd,Value) Then Begin

    With Pcqd Do Begin
       FieldByName('kjobno').DisplayLabel:='工作编号';
       FieldByName('kpzno').DisplayLabel:='拼票号';
       FieldByName('klx').DisplayLabel:='类型';
       FieldByName('kwtr').DisplayLabel:='委托人';
       FieldByName('kwtno').DisplayLabel:='委托编号';
       FieldByName('kmbl').DisplayLabel:='MB/L';
       FieldByName('khbl').DisplayLabel:='HB/L';
       FieldByName('khwmc').DisplayLabel:='中文货名';
       FieldByName('kjs').DisplayLabel:='件数';
       FieldByName('kbzdw').DisplayLabel:='包装单位';
       FieldByName('kdlr').DisplayLabel:='订舱公司';
       FieldByName('kyyr').DisplayLabel:='船公司';
       FieldByName('klf').DisplayLabel:='立方';
       FieldByName('kzl').DisplayLabel:='重量';
       FieldByName('kxl').DisplayLabel:='箱量';
       FieldByName('ktg').DisplayLabel:='属性';
     //  FieldByName('kzp').DisplayLabel:='主';
       FieldByName('kzzg').DisplayLabel:='中转港';
       FieldByName('kmdg').DisplayLabel:='目的港';
       FieldByName('kxh').DisplayLabel:='箱号';
       FieldByName('kjobno').DisplayWidth:=14;
       FieldByName('kwtno').DisplayWidth:=10;
       FieldByName('kmbl').DisplayWidth:=18;
       FieldByName('khbl').DisplayWidth:=16;
       FieldByName('kpzno').DisplayWidth:=14;
       FieldByName('kwtr').DisplayWidth:=20;
       FieldByName('kdlr').DisplayWidth:=20;
       FieldByName('kyyr').DisplayWidth:=20;
       FieldByName('kjs').DisplayWidth:=8;
       FieldByName('kbzdw').DisplayWidth:=10;
       FieldByName('klf').DisplayWidth:=10;
       FieldByName('kzl').DisplayWidth:=10;
       FieldByName('khwmc').DisplayWidth:=10;
       FieldByName('kxl').DisplayWidth:=20;
       FieldByName('kzzg').DisplayWidth:=10;
       FieldByName('kmdg').DisplayWidth:=10;
       FieldByName('kxh').DisplayWidth:=30;
       FieldByName('keta').Visible:=False;
       FieldByName('kxx1').Visible:=False;
       FieldByName('ksl1').Visible:=False;
       FieldByName('kxx2').Visible:=False;
       FieldByName('ksl2').Visible:=False;
       FieldByName('kxx3').Visible:=False;
       FieldByName('ksl3').Visible:=False;
       //FieldByName('kzp').Visible:=False;
       TFLoatField(FieldByName('klf')).DisplayFormat:='0.0000';
       TFLoatField(FieldByName('kzl')).DisplayFormat:='0.000';
       First;
     While Not Eof Do begin
        If (FieldByName('klx').AsString = '整拼')  Then
        Tempxl := '' Else
        TempXl:=WriteXl;

            If Tempxl <> '' Then  Begin

                 If CntTypeNumber(Tempxl,MGp20,MSp20,MGp40,
                    MHc40,MSp40,MGp45) = True Then Begin
                    MZGp20:=MZGp20+MGP20;;
                    MZSp20:=MZSp20+MSp20;
                    MZGp40:=MZGp40+MGp40;
                    MZHc40:=MZHc40+MHc40;
                    MZSp40:=MZSp40+MSp40;
                    MZGp45:=MZGp45+MGp45;
                  End;
                IF FieldByName('ktg').AsBoolean = True Then Begin
                    MZTGp20:=MZTGp20+MGP20;;
                    MZTSp20:=MZTSp20+MSp20;
                    MZTGp40:=MZTGp40+MGp40;
                    MZTHc40:=MZTHc40+MHc40;
                    MZTSp40:=MZTSp40+MSp40;
                    MZTGp45:=MZTGp45+MGp45;
                 End;

            End;
            Mjs:=Mjs+FieldByName('kjs').AsFloat;
            Mlf:=Mlf+FieldByName('klf').AsFloat;
            Mzl:=Mzl+FieldByName('kzl').AsFloat;
           IF FieldByName('ktg').AsBoolean = True Then Begin
                  Mtjs:=Mtjs+FieldByName('kjs').AsFloat;
                  Mtlf:=Mtlf+FieldByName('klf').AsFloat;
                  Mtzl:=Mtzl+FieldByName('kzl').AsFloat;
           End;
        Next;
     End;
   First;
  End;


 End;
  StatusBar1.SimpleText:='箱量预配 '+
   '20''*'+InttoStr(MZGp20+MZSp20)+' 40''*'+
   InttoStr(MZGp40+MZSp40)+' 40H*'+InttoStr(MZHc40)+
   ' 45*'+InttoStr(MZGp45)+' TEU*'+
   InttoStr(MZGp20+MZSp20+(MZGp40+MZSp40)*2+MZHc40*2+MZGp45*2)+
   ' 实计 '+
   '20''*'+InttoStr(MZGp20+MZSp20-MZTGp20-MZTSp20)+' 40''*'+
   InttoStr(MZGp40+MZSp40-MZTGp40-MZTSp40)+' 40H*'+InttoStr(MZHc40-MZTHc40)+
   ' 45*'+InttoStr(MZGp45-MZTGp45)+' TEU*'+
   InttoStr(MZGp20+MZSp20+(MZGp40+MZSp40)*2+MZHc40*2+MZTGp45*2
   -(MZTGp20+MZTSp20+(MZTGp40+MZTSp40)*2+MZTHc40*2+MZTGp45*2));
  StatusBar2.SimpleText:='预配 '+
   '件数:'+FormatFloat('0',Mjs)+' 立方:'+
   FormatFloat('0.0000',Mlf)+
   ' 重量:'+FormatFloat('0.000',Mzl)+
   ' 实计 '+
   '件数:'+FormatFloat('0',Mjs-mtjs)+' 立方:'+
   FormatFloat('0.0000',Mlf-mtlf)+
   ' 重量:'+
   FormatFloat('0.000',Mzl-mtzl);
   For I:= 0 To DBGrid1.Columns.Count - 1 Do Begin
      DBGrid1.Columns[I].Title.TitleButton:=True;

   End; }

end;

procedure TDcxh_Form.OrderCol(DataSource: TDataSource);
Var
 I:Integer;
begin
if (DataSource = nil) or (DataSource.DataSet=nil) or
  (not DataSource.DataSet.Active) then exit;
   with TOrderFieldForm.Create(self) do begin
       DataSource.DataSet.DisableControls;
       CreateIt;
       ExCludeFieldNames.Add('kkcrq');
       ExCludeFieldNames.add('mbj');
       ExCludeFieldNames.add('ksx');

       ExCludeFieldNames.Add('kid');




       SetDataSource(DataSource);
       try
           if ShowModal = mrOK then begin
               ApplyIt;
           end;
       finally
           DataSource.DataSet.EnableControls;
           DestroyIt;
           Free;
       end;
    end;
end;

procedure TDcxh_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=CaFree;
end;

procedure TDcxh_Form.MCmButtonClick(Sender: TObject);
 Var
  MTemp:String;
begin
{  Application.CreateForm(TCx_CmForm,Cx_CmForm);

  IF Cx_CmForm.ShowModal = mrok Then Begin
    MTemp:=Cx_CmForm.PString;
  End;

  FreeAndNil(Cx_CmForm);
  IF Trim(MTemp) <> '' Then Begin

    Mcm.Text:=MTemp;
  End;
 }
End;
procedure TDcxh_Form.MCmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 {if key in [VK_RETURN] then
    mhc.setfocus; }
end;

function TDcxh_Form.WriteXl: String;
 Var
  TempXl:String;
begin
 {TempXl:='';
    IF (Trim(pcqd.FieldByName('kxx1').AsString) <> '')
       and (pcqd.FieldByName('ksl1').Asinteger <> 0) Then
    TempXl:=TempXl+pcqd.FieldByName('kxx1').AsString+'*'+
        pcqd.FieldByName('ksl1').Asstring+'+';
    IF (Trim(pcqd.FieldByName('kxx2').AsString) <> '')
     and (pcqd.FieldByName('ksl2').Asinteger <> 0) Then
    TempXl:=TempXl+pcqd.FieldByName('kxx2').AsString+'*'+
        pcqd.FieldByName('ksl2').Asstring+'+';
    IF (Trim(pcqd.FieldByName('kxx3').AsString) <> '')
     and (pcqd.FieldByName('ksl3').Asinteger <> 0) Then
    TempXl:=TempXl+pcqd.FieldByName('kxx3').AsString+'*'+
        pcqd.FieldByName('ksl3').Asstring+'+';

 IF Trim(TempXl) <> '' Then
 Delete(TempXl,Length(Tempxl),1);

 Result:=TempXl; }

end;
procedure TDcxh_Form.DBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
 {if Not pcqd.Active Then Exit;
 If pcqd.IsEmpty Then exit;

 case Column.Title.SortMarker of
    smNoneEh: Begin
     Column.Title.SortMarker := smDownEh;
     pcqd.SortOn(Column.FieldName,[]);
    End;
    smDownEh: Begin
    Column.Title.SortMarker := smUpEh;
    pcqd.SortOn(Column.FieldName,[mtcoDescending]);
    End;
    smUpEh: Begin
    Column.Title.SortMarker:=smDownEh;
    pcqd.SortOn(Column.FieldName,[]);
    End;
 end;   }
end;

procedure TDcxh_Form.Copydata(Source, Dest: TDataSet);
Var
  I,J,K:Integer;
  ss:String;
  Temp:String;
begin
  If (Source =Nil) or (Dest = Nil) Or (Source.Active = false) Or
    (Dest.Active = False) Then Exit;
 // FInserted:=True;

  Source.First;

 While Not Source.Eof Do Begin

    Dest.Append;
     For I:=0 To Source.Fields.Count - 1 Do Begin
       ss:=Source.Fields[I].FieldName;

       J:=Dest.FieldList.Indexof(ss);
       If  J >= 0 Then
       Dest.Fields[J].Assign(Source.Fields[I]);
     End;

     Dest.FieldByName('kxh').AsString:='';
     K:=0;
     If  Source.FieldByName('klx').Asstring = '整箱' Then
        Inc(K);
     If  Source.FieldByName('klx').Asstring = '整主' Then
        Inc(K);
     If  Source.FieldByName('klx').Asstring = '拼柜' Then
        Inc(K);
     IF K > 0  Then Begin
        Mxh.Lines.Clear;
        Mxh.Lines.Text:=Source.FieldByName('kxh').Asstring;
        Temp:='';
        For I:=0 to MXh.Lines.Count - 1 Do Begin
          Temp:=Temp+Trim(Mxh.Lines[I])+' ';
        End;
       If Trim(Temp) <> '' Then
       Dest.FieldByName('kxh').AsString:=Temp;
      //

       IF (Trim(Source.FieldByName('kxx1').AsString) <> '')
           and (Source.FieldByName('ksl1').Asinteger <> 0) Then Begin
           IF Copy(Source.FieldByName('kxx1').AsString,1,2) = '20' Then Begin
             Dest.FieldByName('k20').AsInteger:=
                   Dest.fieldByname('k20').AsInteger+
                   Source.FieldByname('ksl1').AsInteger
           End  Else IF Copy(Source.FieldByName('kxx1').AsString,1,2) = '40' Then Begin
             If (Copy(Source.FieldByName('kxx1').AsString,3,2) = 'HC') or
                (Copy(Source.FieldByName('kxx1').AsString,3,2) = 'HQ') Then
                 Dest.FieldByName('k40h').AsInteger:=
                   Dest.fieldByname('k40h').AsInteger+
                   Source.FieldByname('ksl1').AsInteger
             Else Dest.FieldByName('k40').AsInteger:=
                   Dest.fieldByname('k40').AsInteger+
                   Source.FieldByname('ksl1').AsInteger;

           End  Else IF Copy(Source.FieldByName('kxx1').AsString,1,2) = '45' Then Begin
             Dest.FieldByName('k45').AsInteger:=
                   Dest.fieldByname('k45').AsInteger+
                   Source.FieldByname('ksl1').AsInteger
           End;
       End;
        //
       IF (Trim(Source.FieldByName('kxx2').AsString) <> '')
          and (Source.FieldByName('ksl2').Asinteger <> 0) Then Begin
           IF Copy(Source.FieldByName('kxx2').AsString,1,2) = '20' Then  Begin
             Dest.FieldByName('k20').AsInteger:=
                   Dest.fieldByname('k20').AsInteger+
                   Source.FieldByname('ksl2').AsInteger
           End  Else IF Copy(Source.FieldByName('kxx2').AsString,1,2) = '40' Then Begin
             If (Copy(Source.FieldByName('kxx2').AsString,3,2) = 'HC') or
                (Copy(Source.FieldByName('kxx2').AsString,3,2) = 'HQ') Then
                 Dest.FieldByName('k40h').AsInteger:=
                   Dest.fieldByname('k40h').AsInteger+
                   Source.FieldByname('ksl2').AsInteger
             Else Dest.FieldByName('k40').AsInteger:=
                   Dest.fieldByname('k40').AsInteger+
                   Source.FieldByname('ksl2').AsInteger;

           End  Else IF Copy(Source.FieldByName('kxx2').AsString,1,2) = '45' Then Begin
             Dest.FieldByName('k45').AsInteger:=
                   Dest.fieldByname('k45').AsInteger+
                   Source.FieldByname('ksl2').AsInteger
          End;
       End;
       //

        IF (Trim(Source.FieldByName('kxx3').AsString) <> '')
          and (Source.FieldByName('ksl3').Asinteger <> 0) Then Begin
           IF Copy(Source.FieldByName('kxx3').AsString,1,2) = '20' Then  Begin
             Dest.FieldByName('k20').AsInteger:=
                   Dest.fieldByname('k20').AsInteger+
                   Source.FieldByname('ksl3').AsInteger
           End  Else IF Copy(Source.FieldByName('kxx3').AsString,1,2) = '40' Then Begin
             If (Copy(Source.FieldByName('kxx3').AsString,3,2) = 'HC') or
                (Copy(Source.FieldByName('kxx3').AsString,3,2) = 'HQ') Then
                 Dest.FieldByName('k40h').AsInteger:=
                   Dest.fieldByname('k40h').AsInteger+
                   Source.FieldByname('ksl3').AsInteger
             Else Dest.FieldByName('k40').AsInteger:=
                   Dest.fieldByname('k40').AsInteger+
                   Source.FieldByname('ksl3').AsInteger;

           End  Else IF Copy(Source.FieldByName('kxx3').AsString,1,2) = '45' Then Begin
             Dest.FieldByName('k45').AsInteger:=
                   Dest.fieldByname('k45').AsInteger+
                   Source.FieldByname('ksl3').AsInteger
          End;
        End;  


    End;


  Dest.Post;
  Source.Next;
 End;
 //FInserted:=False;
end;

procedure TDcxh_Form.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TDcxh_Form.FormActivate(Sender: TObject);
begin
 FReport:=ExtractFilePath(Application.ExeName)+
   '\template\report\';
end;

procedure TDcxh_Form.BitBtn3Click(Sender: TObject);
 Var
  TempTitle,RQTitle:String;
begin
 IF dxqd.Active = False Then Exit;

 TempTitle:='订舱箱号清单';
 RqTitle:='开船日期:';

 IF  IsRightDate(mKsrq.Text) Then
  RqTitle:=RqTitle+mKsrq.Text
 Else  RqTitle:=RqTitle+'全部';

 IF  IsRightDate(mJsrq.Text) Then
  RqTitle:=RqTitle+' 至 '+mJsrq.Text
 Else  RqTitle:=RqTitle+' 至 全部';


  Try
   Modal.PrintDBGridEh1.Title.Text:=TempTitle;
   Modal.PrintDBGridEh1.PageHeader.LeftText.Text:=
     Rqtitle;

   Modal.PrintDBGridEh1.DBGridEh:= DBGrid1;
   Modal.PrintDBGridEh1.SetSubstitutes(['%[today]',DatetimeToStr(Now)]);
   Modal.PrintDBGridEh1.Preview;
  Finally
   Modal.PrintDBGridEh1.DBGridEh:=Nil;
  End;

end;

procedure TDcxh_Form.MVesselButtonClick(Sender: TObject);
 Var
  MTemp:String;
begin
  Application.CreateForm(TCx_CmForm,Cx_CmForm);

  IF Cx_CmForm.ShowModal = mrok Then Begin
    MTemp:=Cx_CmForm.PString;
  End;

  FreeAndNil(Cx_CmForm);
  IF Trim(MTemp) <> '' Then Begin

    Mvessel.Text:=MTemp;
  End;

End;

end.
