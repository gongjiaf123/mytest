 unit Account_air_jUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ToolEdit, RXDBCtrl, Mask, Grids, DBGridEh,
  Buttons, DB, ADODB,DBGrids, RM_dset, RM_dbset;


type
  TAccount_air_jForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MFph: TRxDBComboEdit;
    Mzdlx: TDBEdit;
    Label4: TLabel;
    Msfdw: TRxDBComboEdit;
    Label5: TLabel;
    Mfptt: TRxDBComboEdit;
    DBDateEdit1: TDBDateEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBDateEdit4: TDBDateEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBDateEdit3: TDBDateEdit;
    Label15: TLabel;
    RxDBComboEdit4: TRxDBComboEdit;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    BitBtn1: TBitBtn;
    DBGrid6: TDBGridEh;
    Sr_add: TBitBtn;
    Sp_Edit: TBitBtn;
    Sp_Del: TBitBtn;
    DataSource1: TDataSource;
    account_fy: TADODataSet;
    account_fyd: TDataSource;
    BitBtn2: TBitBtn;
    Sp_cancel: TBitBtn;
    DB_account_fy: TRMDBDataSet;
    DB_Account: TRMDBDataSet;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    BitPost: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox3: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Calc: TBitBtn;
    Mflag_fresh: TDBCheckBox;
    Nhb: TDBComboBox;
    Mje: TDBEdit;
    Label22: TLabel;
    DBEdit2: TDBEdit;
    Label23: TLabel;
    DBEdit9: TDBEdit;
    Label27: TLabel;
    DBEdit14: TDBEdit;
    Label28: TLabel;
    DBEdit15: TDBEdit;
    Label29: TLabel;
    DBEdit16: TDBEdit;
    MDEPT: TRxDBComboEdit;
    Label24: TLabel;
    Label30: TLabel;
    edthl: TDBEdit;
    Ds_hl: TADODataSet;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitPostClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure account_fydStateChange(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MsfdwButtonClick(Sender: TObject);
    procedure MfpttButtonClick(Sender: TObject);
    procedure RxDBComboEdit4ButtonClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure account_fyNewRecord(DataSet: TDataSet);
    procedure Sr_addClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Sp_DelClick(Sender: TObject);
    procedure DBGrid6ColEnter(Sender: TObject);
    procedure DBGrid6ColExit(Sender: TObject);
    procedure DBGrid6Columns2EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure DBGrid6Columns3EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure Sp_EditClick(Sender: TObject);
    procedure Sp_cancelClick(Sender: TObject);
    procedure CalcClick(Sender: TObject);
    procedure DBGrid6DblClick(Sender: TObject);
    procedure account_fyBeforeDelete(DataSet: TDataSet);
    procedure account_fyBeforeInsert(DataSet: TDataSet);
    procedure NhbExit(Sender: TObject);
    procedure MFphButtonClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MDEPTButtonClick(Sender: TObject);
    procedure NhbChange(Sender: TObject);
  private
    FXtbh:String;
    FAccount:String;
    FDataSet:TDataSet;
    FDeleted,FInserted:Boolean;
    Change_Fy:Boolean;
    Procedure DjExit(Value:TDataSet);
    { Private declarations }
  public
    sDlr:string;
    Procedure SetTable(Value:TDataSet);
    Function  GetHl(Value,hb:string):String;
    { Public declarations }
  end;

var
  Account_air_jForm: TAccount_air_jForm;

implementation
         uses
          ModalUnit,DBCommandUnit, Cx_GsUnit, Report_Unit, Cx_fyUnit,
  Cx_FpttUnit, Cx_DeptUnit;

{$R *.dfm}

{ TAccount_Form }

procedure TAccount_air_jForm.SetTable(Value: TDataSet);
 Var
  TempSql:String;
begin
//
  FDataSet:=Value;
  Datasource1.DataSet:=FDataSet;
  FAccount:=FDataSet.FieldByName('account').Asstring;
  Fxtbh:=FDataSet.FieldByName('xtbh').Asstring;

  TempSql:='select * from tab_account_fy where account = '+
  QuotedStr(FAccount)+' order by sf,hb';

  If ADOOpenSql(account_fy,TempSql) = True Then
  TFloatField(Account_fy.FieldByName('jhje')).DisplayFormat:='0.00';

  IF Account_fyd.DataSet = NIl Then
     Account_fyd.DataSet:=Account_fy;

end;

procedure TAccount_air_jForm.BitBtn4Click(Sender: TObject);
begin
 Close;
end;

procedure TAccount_air_jForm.BitPostClick(Sender: TObject);
 Var
  Tempsql:String;
  TempSf,ihl:String;
begin

 IF Trim(MFph.Text) = '' Then Begin
    Error('帐单号不能为空！');
    Exit;

 End;
 IF Trim(Msfdw.Text) = '' Then Begin
   Error('结算单位不能为空！');
   Exit;
 End;

 {IF Trim(Mfy.Text) = '' Then Begin
   Error('我司相关费用名称不能为空！');
   Exit;
 End;    }

 IF Trim(Nhb.Text) = '' Then Begin
   Error('我司相关费用货币名称不能为空！');
   Exit;
 End;

  //DBgrid6的费用明细不能为空
 if DBgrid6.Columns[0].DisplayText= '' Then Begin
   Error('我司相关费用P/C不能为空！');
   Exit;
 End;
 if DBgrid6.Columns[1].DisplayText= '' Then Begin
   Error('我司相关费用收付不能为空！');
   Exit;
 End;
  if DBgrid6.Columns[2].DisplayText= '' Then Begin
   Error('我司相关费用代码不能为空！');
   Exit;
 End;
  if DBgrid6.Columns[3].DisplayText= '' Then Begin
   Error('我司相关费用名称不能为空！');
   Exit;
 End;
 if DBgrid6.Columns[4].DisplayText= '' Then Begin
   Error('我司相关费用货币不能为空！');
   Exit;
 End;
 if DBgrid6.Columns[6].DisplayText= '' Then Begin
   Error('我司相关费用我司金额不能为空！');
   Exit;
 End;

{  if DBgrid6.Columns[6].DisplayText= '' Then Begin
   Error('我司相关费用我司汇率不能为空！');
   Exit;
 End;   }

 if DBgrid6.Columns[8].DisplayText= '' Then Begin
   Error('我司相关费用英文费用不能为空！');
   Exit;
 End;
 if DBgrid6.Columns[9].DisplayText= '' Then Begin
   Error('请先填写结算单位，我司相关费用到付单位不能为空！');
   Exit;
 End;
 if DBgrid6.Columns[10].DisplayText= '' Then Begin
   Error('我司相关费用录入员不能为空！');
   Exit;
 End;
  if DBgrid6.Columns[11].DisplayText= '' Then Begin
   Error('我司相关费用录入日期不能为空！');
   Exit;
 End;

 IF account_fy.IsEmpty Then Begin
   Error('帐单明细不能为空！');
   Exit;
 End;

 IF Mflag_fresh.Checked = True Then
    CalcClick(Self);

 If Mzdlx.Text = '我方应收' Then
    TempSf:='收入'
 Else  TempSf:='支出';
 CalcClick(Self);

{IF Confirm('确定要保存并更新相关明细费用吗？此帐单金额为'+
  FloattoStr(FDataSet.FieldByName('je').AsFloat)+#13#10+
    '保存代理帐单时，系统自动针对整张帐单生成一条费用明细，其货币'+
    #13#10+'和金额与帐单对应，此费用能参与实际的收付核销',False) <> IDYES Then
    Exit;  }

 IF Change_Fy = True Then Begin
   Account_fy.UpdateBatch;
   Change_fy:=False;
 End;
 // If Modal.Hb.Locate('hb',Account_Fy.FieldByName('hb').Asstring,[]) Then
   // ihl:=Modal.Hb.FieldByName('hl').asstring;
    ihl:=edthl.Text ;
    
 IF FDataSet.State in [dsInsert] Then Begin
    TempSql:='insert into tab_fy (xtbh,account,fph,fptt,sfdw,fydm,fy,jhje,'+
    'hb,sf,pc,rq_input,input_user,sx,flag_dl,hl,fylb,kprq) values ('+
    QuotedStr(Fxtbh)+','+QuotedStr(Faccount)+','+
    QuotedStr(Mfph.Text)+','+
    QuotedStrNil(Mfptt.Text)+','+
    QuotedStr(Msfdw.Text)+','+QuotedStr('DLTY')+','+
    QuotedStr('代理退佣')+','+
    Mje.Text+','+QuotedStr(Nhb.Text)+','+
    QuotedStr(Tempsf)+','+QuotedStr('CC')+','+
    QuotedStr(DateTimetoStr(Now))+','+
    QuotedStr(P_User)+',''Y'',1 '+','+ihl+','+
    Quotedstr('退佣')+','+Quotedstr(Datetostr(now))+')';
    If ADOExcSql(Modal.Command,TempSql) = True Then
     FDataSet.Post;
 End;

 IF FDataSet.State in [dsEdit] Then Begin
    TempSql:='update tab_fy set sfdw = '+
        QuotedStr(Msfdw.Text)+',fph = '+
        QuotedStr(MFph.Text)+
        ',fptt = '+QuotedStrNil(Mfptt.Text)+
        ',sf = '+
        QuotedStr(TempSf)+',hb = '+
        QuotedStr(Nhb.Text)+',jhje = '+
        Mje.Text+',hl='+ihl+',flag_dl = 1 where account = '+
        QuotedStr(FAccount)+' and xtbh = '+
        QuotedStr(FXtbh);
    If ADOExcSql(Modal.Command,TempSql) = True Then
        FDataSet.Post;
 End;


 {IF Confirm('确定要保存并更新相关明细费用吗？此帐单金额为'+
    FloattoStr(FDataSet.FieldByName('je').AsFloat),False) <> IDYES Then
    Exit;
 BitBtn5Click(Self);

 If FDataSet.State in [dsEdit,dsInsert] Then FDataSet.Post;

                       }
 BitPost.Enabled:=False;
 InForm('相关资料保存成功，请继续...');
end;

procedure TAccount_air_jForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 IF FDataSet <> Nil Then Begin
  IF FDataSet.State in [dsedit,dsinsert] Then
     FDataSet.Cancel;
 End;
end;

procedure TAccount_air_jForm.account_fydStateChange(Sender: TObject);
begin
  IF account_fy.State in [dsEdit,dsInsert] Then Begin
    Change_Fy:=True;
    BitPost.Enabled:=True;
  End;
end;

procedure TAccount_air_jForm.DataSource1StateChange(Sender: TObject);
begin

 If FDataSet.State in [dsEdit,dsInsert] Then Begin
   If BitPost.Enabled = True Then Exit;
    BitPost.Enabled:=True;
 End;
end;

procedure TAccount_air_jForm.FormActivate(Sender: TObject);
begin
 Change_Fy:=False;
 FDeleted:=False;
 FInserted:=False;
 
{ If Modal.Hb.Active Then Begin
    Modal.Hb.First;
    While Not Modal.Hb.Eof Do Begin
       DBGrid6.Columns[5].PickList.Add(
         Modal.Hb.FieldByName('hb').Asstring);
       Nhb.Items.Add(Modal.Hb.FieldByName('hb').Asstring);
      Modal.Hb.Next;
    End;
 End;    }

 Nhb.Items.CommaText:=P_Hb;
 {DBGrid6.Columns[4].PickList.CommaText:=P_hb;   }
end;

procedure TAccount_air_jForm.MsfdwButtonClick(Sender: TObject);
 Var
  MTemp,Mtemp_nxr,Mtemp_dh,Mtemp_cz,MTemp_dz:String;
  Mtc:Integer;
  TempSql:string;
begin
  MTc:=0;
  Application.CreateForm(TCx_GsForm,Cx_GsForm);


  Cx_GsForm.PGslx:='海外代理';
  IF Cx_GsForm.ShowModal = mrok Then Begin
    MTemp:=Cx_GsForm.PGs;
    MTemp_nxr:=Cx_GsForm.PGs_nxr;
    MTemp_dh:=Cx_GsForm.PGs_dh;
    MTemp_cz:=Cx_GsForm.PGs_cz;

    MTemp_dz:=Cx_GsForm.PGs_Dz;
  End;

  FreeAndNil(Cx_GsForm);
  IF Trim(MTemp) <> '' Then Begin
     IF FDataSet.State = dsBrowse Then
        FDataSet.Edit;
     FDataSet.FieldByName('sfdw').Asstring:=MTemp;
     FDataSet.FieldByName('nxr').Asstring:=MTemp_nxr;
     FDataSet.FieldByName('tel').Asstring:=MTemp_dh;
     FDataSet.FieldByName('fax').Asstring:=MTemp_cz;
    // FDataSet.FieldByName('address').Asstring:=MTemp_Dz;
    // FDataSet.FieldByName('xstc').AsInteger:=MTc;
    try
     TempSql:='select fptt from code_fptt where SUBSTRING(gsqc, 1, CHARINDEX('','', gsqc) - 1)='+Quotedstr(MTemp);
     ADOOpenSql(modal.Temp,TempSql);
     FDataSet.FieldByName('fptt').AsString:=Modal.Temp.fieldbyname('fptt').AsString;
     except
     TempSql:='select fptt from code_fptt where gsqc='+Quotedstr(MTemp);
     ADOOpenSql(modal.Temp,TempSql);
     FDataSet.FieldByName('fptt').AsString:=Modal.Temp.fieldbyname('fptt').AsString;
     end;
  End;

End;



procedure TAccount_air_jForm.MfpttButtonClick(Sender: TObject);
 Var
  MTemp,Mtemp_nxr,Mtemp_dh,Mtemp_cz,MTemp_dz:String;
  Mtc:Integer;
begin
  MTc:=0;
  Application.CreateForm(TCx_fpttForm,Cx_fpttForm);
  Cx_fpttForm.SetTable(Msfdw.Text);

  //Cx_GsForm.PGslx:='委托人';
  IF Cx_fpttForm.ShowModal = mrok Then Begin
    MTemp:=Cx_fpttForm.PString;
  End;

  FreeAndNil(Cx_fpttForm);
  IF Trim(MTemp) <> '' Then Begin
     IF FDataSet.State = dsBrowse Then
        FDataSet.Edit;
     FDataSet.FieldByName('fptt').Asstring:=MTemp;
   
  End;

End;


procedure TAccount_air_jForm.RxDBComboEdit4ButtonClick(Sender: TObject);
 Var
  MTemp,Mtemp_nxr,Mtemp_dh,Mtemp_cz,MTemp_dz:String;
  Mtc:Integer;
begin
  MTc:=0;
  Application.CreateForm(TCx_GsForm,Cx_GsForm);


  Cx_GsForm.PGslx:='船公司';
  IF Cx_GsForm.ShowModal = mrok Then Begin
    MTemp:=Cx_GsForm.PGs;
  End;

  FreeAndNil(Cx_GsForm);
  IF Trim(MTemp) <> '' Then Begin
     IF FDataSet.State = dsBrowse Then
        FDataSet.Edit;
     FDataSet.FieldByName('yyr').Asstring:=MTemp;
     FDataSet.FieldByName('nxr').Asstring:=MTemp_nxr;
    
  End;

End;


procedure TAccount_air_jForm.BitBtn3Click(Sender: TObject);
Var
  TempDir:String;
begin
   If mzdlx.text = '我方应收' Then
   TempDir:='import_air_debit'
   Else TempDir:='import_air_credit';

   IF (FDataSet.State in [dsInsert,dsEdit]) or (Change_fy = True) Then Begin
         Inform('请在输出前保存数据...');
         Exit;
    End;
   Application.CreateForm(TReport_Form,Report_Form);

   Report_Form.HlUSD:=edthl.Text;
   Report_Form.PFilePath:=ExtractFilePath(Application.ExeName)+'template\'+
   TempDir+'\';
   Report_Form.Label1.Caption:=TempDir;
   Report_Form.settable(FDataSet);
   Report_Form.ShowModal;
   FreeAndNil(Report_Form);

end;

procedure TAccount_air_jForm.BitBtn1Click(Sender: TObject);
 Var
  TempSql:String;
  Temp_Xh:String;
begin
{  TempSql:='select xh,fh,xx from tab_xh where xtbh = '+
         QuotedStr(FXtbh);
  Temp_Xh:='';
  ADOOpenSql(Modal.Temp,TempSql);
  Modal.Temp.First;
  While Not Modal.Temp.Eof Do Begin
   Temp_Xh:=Temp_Xh+Modal.Temp.FieldByName('xh').Asstring+'/'+
   Modal.Temp.FieldByName('fh').Asstring+'/'+
   Modal.Temp.FieldByName('xx').Asstring+' ';
   Modal.Temp.Next;
  End;
 If Trim(Temp_Xh) <> '' Then
  Delete(Temp_Xh,Length(Temp_xh),1);
 Modal.Temp.Close; }

 TempSql:='select vessel,voy,mbl,nbl,jobno,eta,etd,'+
   'js,bzdw,zl,xzl,lf,'+
  'qyg,zzg,mdg,yyr '+
  'from tab_job where xtbh = '+
  QuotedStr(FXtbh);
  ADOOpenSql(Modal.Temp,Tempsql);
  If FDataSet.State = dsBrowse Then
    FDataSet.Edit;

  With FDataSet Do Begin
    FieldByName('vessel').Asstring:=
      Modal.Temp.FieldByName('vessel').Asstring;
   // FieldByName('voy').Asstring:=
    //  Modal.Temp.FieldByName('voy').Asstring;

    FieldByName('jobno').Asstring:=
      Modal.Temp.FieldByName('jobno').Asstring;

    FieldByName('mbl').Asstring:=
      Modal.Temp.FieldByName('mbl').Asstring;

    FieldByName('hbl').Asstring:=
      Modal.Temp.FieldByName('nbl').Asstring;

    FieldByName('eta').AsDatetime:=
      Modal.Temp.FieldByName('eta').Asdatetime;
    FieldByName('etd').AsDatetime:=
      Modal.Temp.FieldByName('etd').Asdatetime;

    FieldByName('yyr').Asstring:=
      Modal.Temp.FieldByName('yyr').Asstring;

    FieldByName('qyg').Asstring:=
      Modal.Temp.FieldByName('qyg').Asstring;
    FieldByName('zzg').Asstring:=
      Modal.Temp.FieldByName('zzg').Asstring;
    FieldByName('mdg').Asstring:=
      Modal.Temp.FieldByName('mdg').Asstring;

    FieldByName('js').AsInteger:=
      Modal.Temp.FieldByName('js').Asinteger;
    FieldByName('bzdw').Asstring:=
      Modal.Temp.FieldByName('bzdw').Asstring;
    FieldByName('zl').Asfloat:=
      Modal.Temp.FieldByName('zl').Asfloat;
    FieldByName('zl_jf').Asfloat:=
      Modal.Temp.FieldByName('xzl').Asfloat;
    FieldByName('lf').Asfloat:=
      Modal.Temp.FieldByName('lf').Asfloat;

   // FieldByName('ywhm_text').Asstring:=
    //  Modal.Temp.FieldByName('ywhm_text').Asstring;
   // FieldByName('xh_text').Asstring:=Temp_Xh;


  End;


end;

procedure TAccount_air_jForm.account_fyNewRecord(DataSet: TDataSet);
begin
 DataSet.FieldByName('xtbh').Asstring:=
   FXtbh;
 DataSet.FieldByName('account').Asstring:=
   FAccount;
 DataSet.FieldByName('pc').Asstring:='CC';
 DataSet.FieldByName('hb').Asstring:='USD';
 DataSet.FieldByName('flag_dl').AsBoolean:=True;
 DataSet.FieldByName('input_user').Asstring:=
   P_User;
 DataSet.FieldByName('rq_input').AsDateTime:=Now;
 DataSet.FieldByName('sfdw').AsString:=Msfdw.Text;
 DataSet.FieldByName('fph').AsString:=Mfph.Text;
 DataSet.FieldByName('sx').AsString:='Y';


end;

procedure TAccount_air_jForm.Sr_addClick(Sender: TObject);
begin

 IF Account_fy.Active = False Then Exit;
 {IF Trim(MFph.Text) = '' Then Begin
    Error('帐单号不能为空！');
    Exit;

 End;
 IF Trim(Msfdw.Text) = '' Then Begin
   Error('结算单位不能为空！');
   Exit;
 End;   }
 FInserted:=True;
 Account_fy.Append;
 Account_fy.FieldByName('sf').AsString:='收入';
 Account_fy.FieldByName('hl').AsString:=edthl.Text;
 FInserted:=False;
end;

procedure TAccount_air_jForm.BitBtn2Click(Sender: TObject);
begin
 IF Account_fy.Active = False Then Exit;

 {IF Trim(MFph.Text) = '' Then Begin
    Error('帐单号不能为空！');
    Exit;

 End;
 IF Trim(Msfdw.Text) = '' Then Begin
   Error('结算单位不能为空！');
   Exit;
 End;     }
 FInserted:=True;
 Account_fy.Append;
 Account_fy.FieldByName('sf').AsString:='支出';
 Account_fy.FieldByName('hl').AsString:=edthl.Text;
 FInserted:=False;
end;

procedure TAccount_air_jForm.Sp_DelClick(Sender: TObject);
begin
 IF Account_fy.Active = False Then Exit;
 IF Account_fy.IsEmpty  Then Exit;
 if Account_fy.State=dsinsert then
 begin
   ACcount_fy.Cancel;
   exit;
 end;  
 If Confirm('确定要删除吗？',False) =IDYES Then Begin
     FDeleted:=True;
     Account_Fy.DeleteRecords(arCurrent);
     FDeleted:=False;
     Change_fy:=True;
     BitPost.Enabled:=True;
  End;

end;

procedure TAccount_air_jForm.DBGrid6ColEnter(Sender: TObject);
begin
 if UpperCase(DBGrid6.SelectedField.FieldName) = 'HB' then
     DBGrid6.Options:=DBGrid6.Options + [dgAlwaysShowEditor];
  if UpperCase(DBGrid6.SelectedField.FieldName) = 'PC' then
      DBGrid6.Options:=DBGrid6.Options + [dgAlwaysShowEditor];
  if UpperCase(DBGrid6.SelectedField.FieldName)='SF' then
     DBGrid6.Options:=DBGrid6.Options + [dgAlwaysShowEditor];
  if UpperCase(DBGrid6.SelectedField.FieldName)='SFDW' then
     DBGrid6.Options:=DBGrid6.Options + [dgAlwaysShowEditor];

  if UpperCase(DBGrid6.SelectedField.FieldName)='FYDM' then
     DBGrid6.Options:=DBGrid6.Options + [dgAlwaysShowEditor];

end;

procedure TAccount_air_jForm.DBGrid6ColExit(Sender: TObject);
var
  TempSql:String;
  sFy:string;
  MTemp,Mtemp_Detail,MTemp_ywfy,Mtemp_hb,Mtemp_nbjs,MTemp_fylb:String;
  MTemp_Dj:Real;
  MTemp_df,Mtemp_yj,MTemp_dl:Boolean;
begin
 if UpperCase(DBGrid6.SelectedField.FieldName) = 'HB' then
     DBGrid6.Options:=DBGrid6.Options - [dgAlwaysShowEditor];
  if UpperCase(DBGrid6.SelectedField.FieldName) = 'PC' then
      DBGrid6.Options:=DBGrid6.Options - [dgAlwaysShowEditor];
  if UpperCase(DBGrid6.SelectedField.FieldName)='SF' then
     DBGrid6.Options:=DBGrid6.Options - [dgAlwaysShowEditor];
  if UpperCase(DBGrid6.SelectedField.FieldName)='SFDW' then
     DBGrid6.Options:=DBGrid6.Options - [dgAlwaysShowEditor];

  if UpperCase(DBGrid6.SelectedField.FieldName)='FYDM' then
     DBGrid6.Options:=DBGrid6.Options - [dgAlwaysShowEditor];

   //if UpperCase(DBGrid6.SelectedField.FieldName) = 'HB' then
 { begin
  Account_Fy.Edit;
    If Modal.Hb.Locate('hb',Account_Fy.FieldByName('hb').Asstring,[]) Then
    Account_Fy.FieldByName('hl').AsFloat:=Modal.Hb.FieldByName('hl').asfloat;
  end; }

//****************************fy离开事件**************************************//
  if UpperCase(DBGrid6.SelectedField.FieldName)='FYDM' then
  begin
    sFy:=trim(Account_fy.fieldbyname('fydm').AsString);
    TempSql:='select * from code_fy where dm like '+Quotedstr(sFy);
    Modal.Temp.Close;
    Modal.Temp.CommandText:=TempSql;
    Modal.Temp.Open;

    if Modal.Temp.RecordCount=0 then
    begin
      error('费用不存在,请到费用建档中建档');
      Abort;
    end;

    if Modal.Temp.RecordCount=1 then
    begin
       Account_fy.FieldByName('fydm').AsString:=Modal.Temp.fieldbyname('dm').AsString;
       Account_fy.FieldByName('fy').AsString:=Modal.Temp.fieldbyname('fy').AsString;
       Account_fy.FieldByName('ywfy').AsString:=Modal.Temp.FieldByName('ywfy').Asstring;
       Account_fy.FieldByName('hb').AsString:=Modal.Temp.FieldByName('hb').Asstring;
       //Account_fy.FieldByName('jhje').AsFloat:=Modal.Temp.FieldByName('je').AsFloat;
       Account_fy.FieldByName('flag_df').AsBoolean:=Modal.Temp.FieldByName('flag_df').AsBoolean;
       Account_fy.FieldByName('flag_yj').AsBoolean:=Modal.Temp.FieldByName('flag_yj').AsBoolean;
       Account_fy.FieldByName('flag_dl').AsBoolean:=Modal.Temp.FieldByName('flag_dl').AsBoolean;
       //Account_fy.FieldByName('fylb').AsString:=Modal.Temp.fieldbyname('fylb').AsString;
    end;
    if Modal.Temp.RecordCount>1 then
    begin
      PFy:=sFy;
      Application.CreateForm(TCx_FyForm,Cx_FyForm);
      IF Cx_FyForm.ShowModal = mrok Then
      Begin
        MTemp:=Cx_Fyform.PString;
        MTemp_Detail:=Cx_Fyform.PString_Detail;
        MTemp_Ywfy:=Cx_Fyform.PString_ywfy;
        MTemp_hb:=Cx_Fyform.PString_hb;
       // MTemp_nbjs:=Cx_Fyform.PString_nbjs;
        MTemp_Dj:=Cx_FyForm.PString_Dj;
        MTemp_Df:=Cx_FyForm.PString_Df;
        MTemp_Yj:=Cx_FyForm.PString_Yj;
        MTemp_Dl:=Cx_FyForm.PString_dl;
        MTemp_fylb:=Cx_FyForm.PString_fylb;
      End;
     FreeAndNil(Cx_FyForm);
      IF Trim(MTemp) <> '' Then
      Begin
         IF Account_fy.State = dsBrowse Then
            Account_fy.Edit;
         Account_fy.FieldByName('fydm').Asstring:=MTemp;
         Account_fy.FieldByName('fy').Asstring:=MTemp_Detail;
         Account_fy.FieldByName('ywfy').Asstring:=MTemp_ywfy;
         If   Trim(Account_fy.FieldByName('hb').Asstring) = '' Then
         Account_fy.FieldByName('hb').Asstring:=MTemp_hb;
       //  FDataSet_Detail.FieldByName('dj').AsFloat:=MTemp_dj;
        // FDataSet_Detail.FieldByName('nbjs').Asstring:=MTemp_nbjs;

         Account_fy.FieldByName('flag_df').AsBoolean:=MTemp_df;
         Account_fy.FieldByName('flag_yj').AsBoolean:=MTemp_yj;
         Account_fy.FieldByName('flag_dl').AsBoolean:=MTemp_dl;
         //Account_fy.FieldByName('fylb').Asstring:=MTemp_fylb;
        // MdjExit(Self);
        If Account_fy.State = dsInsert Then Begin
           Account_fy.FieldByName('dj').AsFloat:=MTemp_dj;
           djExit(Account_fy);
        End;
     end;
     end; //if modal.temp.recordcount>1
  end;
//****************************************************************************//
    
end;

procedure TAccount_air_jForm.DBGrid6Columns2EditButtonClick(Sender: TObject;
  var Handled: Boolean);
Var
  MTemp:String;
begin
  Application.CreateForm(TCx_GsForm,Cx_GsForm);

  IF Cx_GsForm.ShowModal = mrok Then Begin
    MTemp:=Cx_GsForm.PGs;
  End;

  FreeAndNil(Cx_GsForm);
  IF Trim(MTemp) <> '' Then Begin
      IF account_fy.IsEmpty Then Account_Fy.Append Else Begin
       IF account_fy.State = dsBrowse Then
        account_fy.Edit;
      End;
     account_fy.FieldByName('sfdw').Asstring:=MTemp;
  End;

End;

procedure TAccount_air_jForm.DBGrid6Columns3EditButtonClick(Sender: TObject;
  var Handled: Boolean);
Var
  MTemp,Mtemp_Detail,MTemp_ywfy,Mtemp_hb,Mtemp_nbjs:String;
  MTemp_Dj:Real;
  MTemp_df,Mtemp_yj,MTemp_dl:Boolean;
begin

  Application.CreateForm(TCx_FyForm,Cx_FyForm);

  IF Cx_FyForm.ShowModal = mrok Then Begin
    MTemp:=Cx_Fyform.PString;
    MTemp_Detail:=Cx_Fyform.PString_Detail;
    MTemp_Ywfy:=Cx_Fyform.PString_ywfy;
   { MTemp_hb:=Cx_Fyform.PString_hb;
    MTemp_nbjs:=Cx_Fyform.PString_nbjs;
    MTemp_Dj:=Cx_FyForm.PString_Dj;
    MTemp_Df:=Cx_FyForm.PString_Df;
    MTemp_Yj:=Cx_FyForm.PString_Yj;
    MTemp_Dl:=Cx_FyForm.PString_dl;}
  End;

  FreeAndNil(Cx_FyForm);
  IF Trim(MTemp) <> '' Then Begin
   IF Account_Fy.IsEmpty Then Account_Fy.Append Else Begin
       IF Account_Fy.State = dsBrowse Then
        Account_Fy.Edit;
   End;
     Account_Fy.FieldByName('fydm').Asstring:=MTemp;
     Account_Fy.FieldByName('fy').Asstring:=MTemp_Detail;
     Account_Fy.FieldByName('ywfy').Asstring:=MTemp_Ywfy;
    { If Modal.Hb.Locate('hb',Account_Fy.FieldByName('hb').Asstring,[]) Then
    Account_Fy.FieldByName('hl').AsFloat:=Modal.Hb.FieldByName('hl').asfloat; }
  End;

End;

procedure TAccount_air_jForm.Sp_EditClick(Sender: TObject);
begin
  If Account_fy.IsEmpty Then Exit;
    Account_fy.Edit;
end;

procedure TAccount_air_jForm.Sp_cancelClick(Sender: TObject);
begin
  IF Account_fy.State in [dsEdit,dsInsert] Then
    Account_fy.Cancel;
end;

procedure TAccount_air_jForm.CalcClick(Sender: TObject);
Var
  BookMark:TBookMark;
  I,J,K:Integer;
  F_Bwb:Real;
  MHb:String;
begin
 F_Bwb:=0;
 Mhb:=Nhb.Text;

 IF Not Account_fy.Active Then Exit;
 If Account_fy.IsEmpty Then Exit;


 Try

  BookMark:=Account_fy.GetBookmark;
  Account_fy.DisableControls;
  With Account_fy Do Begin
   First;

    While Not Eof Do Begin
         If FieldByName('sf').Asstring = '收入' Then Begin
            IF Modal.Hb.Locate('hb',FieldByName('hb').AsString,[]) Then
             F_Bwb:=F_Bwb+FieldByName('jhje').AsFloat*
                   Modal.Hb.FieldByName('hl').AsFloat;
         End;

         If FieldByName('sf').Asstring = '支出' Then Begin
            IF Modal.Hb.Locate('hb',FieldByName('hb').AsString,[]) Then
             F_Bwb:=F_Bwb-FieldByName('jhje').AsFloat*
                   Modal.Hb.FieldByName('hl').AsFloat;
         End;
        

       Next;
     End;
       //while
  End;   //with

 Finally
   Account_fy.GotoBookmark(BookMark);
   Account_fy.FreeBookMark(BookMark);
   Account_fy.EnableControls;
   IF Modal.Hb.Locate('hb',Mhb,[]) Then  Begin
      If FDataSet.State = dsBrowse Then
         FDataSet.Edit;
      FDataSet.FieldByName('je').AsFloat:=
      abs(F_Bwb/Modal.Hb.FieldByName('hl').AsFloat);
      {(1-FDataSet.FieldByName('fc_dl').AsFloat/100)); }
      IF F_Bwb >= 0 Then
        FDataSet.FieldByName('zdlx').AsString:=
          '我方应收'
     Else  FDataSet.FieldByName('zdlx').AsString:=
          '我方应付';

   End;


 End;


End;

procedure TAccount_air_jForm.DBGrid6DblClick(Sender: TObject);
 Var
  A:Boolean;
begin
 If Account_fy.Active = False Then Exit;
// If Account_fy.IsEmpty Then Exit;
 If UpperCase(DBGrid6.SelectedField.FieldName) = 'SFDW' Then Begin
    DBGrid6Columns2EditButtonClick(Self,A);
    Exit;
 End;
 If UpperCase(DBGrid6.SelectedField.FieldName) = 'FYDM' Then Begin
    DBGrid6Columns3EditButtonClick(Self,A);
    Exit;
 End;

end;

procedure TAccount_air_jForm.account_fyBeforeDelete(DataSet: TDataSet);
begin

 If FDeleted = False Then Abort;
end;

procedure TAccount_air_jForm.account_fyBeforeInsert(DataSet: TDataSet);
begin
 IF FInserted = False Then Abort;
end;

procedure TAccount_air_jForm.NhbExit(Sender: TObject);
begin
 CalcClick(Self);
end;

procedure TAccount_air_jForm.MFphButtonClick(Sender: TObject);
Var
  TempSql:String;
  Fbh:String;
  FRq:String;
  FChinese:String;
  FID:String;
  Temp_rq:String;    //当前库中日期
  TempSys_Rq:String;  //系统日期
  Temp_bh,Temp_bhw:Integer;  //当前库中编号
  Temp_tt,Temp_tt_gs:String;
  Temp_Rq_Current:String;
  TempSqldl,fph:string;
begin
   If Trim(MSfdw.Text) = '' Then Exit;
   If Trim(MFph.Text) <> '' Then Exit;
   If Not (FDataSet.State in [dsEdit,dsInsert]) Then Exit;

   FChinese:=MSfdw.Text;
 {  TempSql:='select getdate(),id,dltt,dlbh,dlrq,dlbhw from code_gs where gsqc = '+
            QuotedStr(FChinese);
   ADOOpenSql(Modal.Temp,TempSql);
   IF Modal.Temp.IsEmpty Then Exit;

   FID:=Modal.Temp.FieldByName('id').Asstring;
   TempSys_Rq:=Formatdatetime('yymm',
               Modal.Temp.Fields[0].Asdatetime);
   Temp_tt_gs:=Modal.Temp.FieldByName('dltt').Asstring;
   Temp_Rq:=Modal.Temp.FieldByname('dlrq').Asstring;
   Temp_bh:=Modal.Temp.FieldByname('dlbh').AsInteger;
   Temp_bhw:=Modal.Temp.FieldByname('dlbhw').AsInteger;

   If UpperCase(Temp_Rq) <> UpperCase(TempSys_Rq) Then Begin
       FRq:=TempSys_Rq;
       FBh:=Format('%.'+InttoStr(Temp_bhw)+'d',[1]);
       TempSql:='update code_gs set dlrq = '+QuotedStr(Tempsys_Rq)+','+
                'dlbh = 1 where id = '+QuotedStr(FID);
   end Else Begin
      FRq:=Temp_rq;
      Fbh:=Format('%.'+InttoStr(Temp_bhw)+'d',[Temp_bh+1]);
      TempSql:='update code_gs set dlbh = '+Inttostr(Temp_Bh+1)+
      ' where id = '+QuotedStr(FID);

   End;

 ADOExcSql(Modal.Command,TempSql);

 FDataSet.FieldByName('fph').Asstring:=Temp_tt_Gs+
        Copy(FRq,1,2)+Copy(Frq,3,2)+Fbh;  }

  begin
    TempSqldl:='select * from sys_hwfpno ';
    ADOOpenSql(Modal.Temp,TempSqldl);
    IF Modal.Temp.IsEmpty Then
      Begin
         Error('发票号未定义,不能生成！');
         Exit;
      End;
   Temp_bhw:=Modal.Temp.FieldByname('bhw').AsInteger;
   Temp_bh:=Modal.Temp.FieldByname('bh').AsInteger;
   Fph:=Format('%.'+InttoStr(Temp_bhw)+'d',[Temp_bh+1]);

   TempSqldl:='update sys_fpno set bh = '+Inttostr(Temp_Bh+1);
   ADOExcSql(Modal.Command,TempSqldl);
   FDataSet.FieldByName('fph').Asstring:=Fph;
 end;

end;

procedure TAccount_air_jForm.BitBtn5Click(Sender: TObject);
Var
  BookMark:TBookMark;
  I,J,K:Integer;
  F_Bwb:Real;
  MHb:String;
begin


 IF Not Account_fy.Active Then Exit;
 If Account_fy.IsEmpty Then Exit;


 Try

  BookMark:=Account_fy.GetBookmark;
  Account_fy.DisableControls;
  With Account_fy Do Begin
   First;

    While Not Eof Do Begin
       If (FieldByName('fph').Asstring <> MFph.Text) or
          (FieldByName('sfdw').Asstring <> MSfdw.Text) Then Begin
         If State = dsBrowse Then
         Edit;
         FieldByName('fph').AsString:=MFph.Text;
         FieldByName('sfdw').AsString:=MSfdw.Text;
         Post;
         Change_Fy:=True;
       End;


       Next;
     End;
       //while
  End;   //with

 Finally
   Account_fy.GotoBookmark(BookMark);
   Account_fy.FreeBookMark(BookMark);
   Account_fy.EnableControls;

 End;


End;


procedure TAccount_air_jForm.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key in [VK_F5] Then
  DBGrid6DblClick(Self);

end;

procedure TAccount_air_jForm.MDEPTButtonClick(Sender: TObject);
var
  MTemp:string;
begin
  Application.CreateForm(TCx_DeptForm,Cx_DeptForm);
  Cx_DeptForm.showmodal;
  if Cx_DeptForm.ModalResult=idok then
     MTemp:= Cx_DeptForm.stDept;
   FreeandNil(Cx_DeptForm);
  IF Trim(MTemp) <> '' Then Begin
  IF FDataSet.State = dsBrowse Then
     FDataSet.Edit;
  FDataSet.FieldByName('dept').Asstring:=MTemp;
   end;
end;

procedure TAccount_air_jForm.NhbChange(Sender: TObject);
begin
  edthl.Text :=GetHL(sDlr,nhb.Text);
end;

function TAccount_air_jForm.GetHl(Value, hb: string): String;
var
  TempSql:string;
begin
  //当给定的国内代理在代理汇率中存在则用代理汇率.
  TempSql:='SELECT HL FROM CODE_DLHL WHERE 1>0 AND GSJC='+Quotedstr(Value)+' AND HB='+Quotedstr(hb);
  if ADOOpenSQL(ds_hl,Tempsql)then
  begin
    if ds_hl.FieldByName('hl').AsString<>'' then
      Result:=Ds_hl.FieldByName('hl').AsString
   else //否则
    begin
      TempSql:='SELECT HL FROM CODE_HB WHERE HB='+Quotedstr(hb);
      if ADOOpenSQL(DS_HL,tempsql) then
        Result:=Ds_hl.FieldByName('hl').AsString;
    end;
  end;
end;

procedure TAccount_air_jForm.DjExit(Value: TDataSet);
begin
 IF Not (Value.State in [dsEdit,dsInsert]) Then exit;

   Value.FieldByName('jhje').AsFloat:=
   StrtoFloat(FormatFloat('0.00',Value.FieldByName('dj').AsFloat*
   Value.FieldByName('sl').AsFloat));
   If Modal.Hb.Locate('hb',Value.FieldByName('hb').Asstring,[]) Then
   Value.FieldByName('hl').AsFloat:=Modal.Hb.FieldByName('hl').asfloat;
end;

end.
