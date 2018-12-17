unit USPEDFiscal;

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows, Messages,
{$ENDIF}
  SysUtils, Variants, Classes, Graphics, Controls, Forms, ACBrEFDBlocos,
  Dialogs, StdCtrls, ACBrSpedFiscal, ExtCtrls, ComCtrls, ACBrUtil, ACBrTXTClass,
  Mask, ToolEdit, RzTabs, NxCollection, RxLookup, UDMSPEDFiscal, RzPanel;

type

  { TFrmSPEDFiscal }

  TfrmSPEDFiscal = class(TForm)
    RZPageControlDados: TRzPageControl;
    TS_Gerar: TRzTabSheet;
    TS_Exemplo: TRzTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    memoError: TMemo;
    memoTXT: TMemo;
    btnError: TButton;
    btnTXT: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtFile: TEdit;
    cbConcomitante: TCheckBox;
    edNotas: TEdit;
    Panel2: TPanel;
    Label4: TLabel;
    btnB_0: TButton;
    btnB_1: TButton;
    btnB_C: TButton;
    btnB_D: TButton;
    btnB_E: TButton;
    btnB_H: TButton;
    btnB_G: TButton;
    btnB_Completo: TButton;
    btnB_9: TButton;
    ProgressBar1: TProgressBar;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    edBufLinhas: TEdit;
    edBufNotas: TEdit;
    Panel3: TPanel;
    Label9: TLabel;
    DateEdit1: TDateEdit;
    Label10: TLabel;
    DateEdit2: TDateEdit;
    BtnBloco_0: TNxButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label11: TLabel;
    cbFinalidade: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    btnBloco_C: TNxButton;
    btnGravar_Txt: TNxButton;
    btnBloco_D: TNxButton;
    btnBloco_E: TNxButton;
    btnBloco_G: TNxButton;
    btnBloco_H: TNxButton;
    btnBloco_1: TNxButton;
    btnBloco_9: TNxButton;
    Label14: TLabel;
    ComboBox1: TComboBox;
    gbxVendedor: TRzGroupBox;
    Label15: TLabel;
    ComboBox2: TComboBox;
    Label16: TLabel;
    ComboBox3: TComboBox;
    Label17: TLabel;
    DateEdit3: TDateEdit;
    btnGerar: TNxButton;
    procedure btnB_0Click(Sender: TObject);
    procedure btnB_9Click(Sender: TObject);
    procedure btnTXTClick(Sender: TObject);
    procedure btnB_1Click(Sender: TObject);
    procedure btnB_CClick(Sender: TObject);
    procedure btnB_DClick(Sender: TObject);
    procedure btnB_EClick(Sender: TObject);
    procedure btnB_HClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure edtFileChange(Sender: TObject);
    procedure cbConcomitanteClick(Sender: TObject);
    procedure ACBrSPEDFiscal1Error(const MsnError: AnsiString);
    procedure btnB_CompletoClick(Sender: TObject);
    procedure btnB_GClick(Sender: TObject);
    procedure BtnBloco_0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBloco_CClick(Sender: TObject);
    procedure btnGravar_TxtClick(Sender: TObject);
    procedure btnBloco_DClick(Sender: TObject);
    procedure btnBloco_HClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    fDMSPEDFiscal: TDMSPEDFiscal;
    vContador_Reg_0 : Integer;
    vContador_Reg_C : Integer;
    vContador_Reg_D : Integer;
    vContador_Reg_H : Integer;
    ctNotaFiscal : String;

    function fnc_Valida_Campos(Tipo_Bloco : String = '') : Boolean;

    procedure prc_Movimento;
    procedure prc_Gravar_mPessoa;
    procedure prc_Gravar_mProduto;
    procedure prc_Gravar_mUnidade(Unidade : String);
    procedure prc_Gravar_mNatureza;
    procedure prc_Gravar_mC190;
    procedure prc_Consultar_cdsBalanco;

    procedure prc_Abrir_NotaFiscal(Bloco : String); 

    procedure LoadToMemo;
    procedure prc_Gerar_Bloco_0;
    procedure prc_Bloco_0_Reg_0000;
    procedure prc_Bloco_0_Reg_0001;
    procedure prc_Bloco_0_Reg_0005;
    procedure prc_Bloco_0_Reg_0015;
    procedure prc_Bloco_0_Reg_0100;
    procedure prc_Bloco_0_Reg_0150;
    procedure prc_Bloco_0_Reg_0175;
    procedure prc_Bloco_0_Reg_0190;
    procedure prc_Bloco_0_Reg_0200;
    procedure prc_Bloco_0_Reg_0205;
    procedure prc_Bloco_0_Reg_0206;
    procedure prc_Bloco_0_Reg_0220;
    procedure prc_Bloco_0_Reg_0300;
    procedure prc_Bloco_0_Reg_0305;
    procedure prc_Bloco_0_Reg_0400;
    procedure prc_Bloco_0_Reg_0450;
    procedure prc_Bloco_0_Reg_0460;
    procedure prc_Bloco_0_Reg_0500;
    procedure prc_Bloco_0_Reg_0600;
    procedure prc_Bloco_0_Reg_0990;

    procedure prc_Gerar_Bloco_C;
    procedure prc_Bloco_C_Reg_C100; //Falta gerar a NFCe 
    procedure prc_Bloco_C_Reg_C100_Inutilizadas;
    procedure prc_Bloco_C_Reg_C500;
    procedure prc_Bloco_C_Reg_C990;

    procedure prc_Gerar_Bloco_D;
    procedure prc_Bloco_D_Reg_D100;
    procedure prc_Bloco_D_Reg_D500;
    procedure prc_Bloco_D_Reg_D990;

    procedure prc_Gerar_Bloco_H;
    procedure prc_Bloco_H_Reg_H005;
    procedure prc_Bloco_H_Reg_H010;
    procedure prc_Bloco_H_Reg_H020;
    procedure prc_Bloco_H_Reg_H990;

    function Monta_Numero(Campo: String; Tamanho: Integer): String;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSPEDFiscal: TfrmSPEDFiscal;

implementation

uses uUtilPadrao, DB, ACBrEFDBloco_C, ACBrEFDBloco_C_Class,
  SqlExpr, ACBrEFDBloco_D_Class, ACBrEFDBloco_D, ACBrEFDBloco_H_Class,
  ACBrEFDBloco_H, DateUtils, rsDBUtils;

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TfrmSPEDFiscal.ACBrSPEDFiscal1Error(const MsnError: AnsiString);
begin
  memoError.Lines.Add(MsnError);
end;

procedure TfrmSPEDFiscal.btnB_0Click(Sender: TObject);

const
  strUNID: array [0 .. 4] of string = ('PC', 'UN', 'LT', 'PC', 'MT');

var
  int0150: integer;
  int0175: integer;
  int0300: integer;
  int0190: integer;
  int0500: Integer;
  int0600: Integer;

begin
  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco 0.

  cbConcomitante.Enabled := False;
  btnB_0.Enabled := False;
  btnB_C.Enabled := True;

  ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);
  ACBrSPEDFiscal1.Path         := DirectoryEdit1.Text;
  ACBrSPEDFiscal1.Arquivo      := edtFile.Text;

  //Definindo
  with ACBrSPEDFiscal1 do
  begin
    DT_INI := StrToDate('01/11/2011');
    DT_FIN := StrToDate('30/11/2011');
  end;

  if cbConcomitante.Checked then
  begin
    with ACBrSPEDFiscal1 do
    begin
      LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);

      IniciaGeracao;
    end;

    LoadToMemo;
  end;

  with ACBrSPEDFiscal1.Bloco_0 do
  begin
    // Dados da Empresa
    with Registro0000New do
    begin
      COD_VER := vlVersao103;
      COD_FIN := raOriginal;
      NOME := 'RAZ�O SOCIAL DA EMPRESA EMITENTE';
      CNPJ := '11111111111180';
      CPF := '';
      UF := 'RS';
      IE := '1111111119';
      COD_MUN := 4314902;
      IM := '';
      SUFRAMA := '';
      IND_PERFIL := pfPerfilA;
      IND_ATIV := atOutros;
    end;

    with Registro0001New do
    begin
      IND_MOV := imComDados;

      // FILHO - Dados complementares da Empresa
      with Registro0005New do
      begin
        FANTASIA := 'NOME FANTASSIA';
        CEP := '29900000';
        ENDERECO := 'ENDERE�O DA EMPRESA';
        NUM := 'S/N';
        COMPL := '';
        BAIRRO := 'BAIRRO';
        FONE := '';
        FAX := '';
        EMAIL := '171@171.COM.BR';
      end;
//
//      with Registro0015New do
//      begin
//        UF_ST := 'SC';
//        IE_ST := '254504230';
//      end;
//
      // FILHO - Dados do contador.
      with Registro0100New do
      begin
        NOME := 'SO CONFIE NO CONTADOR I';
        CPF := '12345678909'; // Deve ser uma informa��o valida
        CRC := '65924';
        CNPJ := '';
        CEP := '92420020';
        ENDERECO := 'R. NOME DA RUA';
        NUM := '450';
        COMPL := '';
        BAIRRO := 'BAIRRO CONTADORES';
        FONE := '';
        FAX := '';
        EMAIL := 'NOME@NOME.COM.BR';
        COD_MUN := 3200607;
      end;
      // Check(Reg0001.Registro0190.LocalizaRegistro(UNID), '(0-0190) UNIDADE MEDIDA: A unidade de medida "%s" foi duplicada na lista de registros 0190!', [UNID]);

      // FILHO
      for int0150 := 1 to 10 do
      begin
        // 10 Clientes
        with Registro0150New do
        begin
          COD_PART := IntToStr(int0150);
          NOME := 'CLIENTE DE TESTES ' + IntToStr(int0150);
          if int0150 = 9 then //um exemplo de cliente no exterior.
          begin
            COD_PAIS := '3131'; //GUAM
            CNPJ := '';
            CPF := '';
//            COD_MUN := 43140070 + int0150; //O c�digo do munic�pio � deixado de fora propositalmente. O componente vai faz�-lo ficar vazio
          end
          else
          begin
            CNPJ := '11111111111180';
            CPF := '12345678909';
            COD_PAIS := '1058';
          end;

          IE := '';
          COD_MUN := 43140070 + int0150;
          SUFRAMA := '';
          ENDERECO := 'ENDERECO CLIENTE' + IntToStr(int0150);
          NUM := '';
          COMPL := 'COMPLEMENTO'+ IntToStr(int0150);
          BAIRRO := 'BAIRRO CLIENTE' + IntToStr(int0150);
          //
          // FILHO - 1 Altera��o para cada cliente de 2 a 3
          if (int0150 = 2) or (int0150 = 3) then
          begin
            with Registro0175New do
            begin
              DT_ALT := DT_INI + 1;
              NR_CAMPO := '1';
              CONT_ANT := 'CAMPO ANTERIOR ' + '1';
            end;
          end;
        end;
      end;

      // FILHO
      // 4 Unidades de medida
      // Const strUNID, esta declarada no inicio deste evento.
      for int0190 := Low(strUNID) to High(strUNID) do
      begin
        if not Registro0190.LocalizaRegistro(strUNID[int0190]) then
        begin
          with Registro0190New do
          begin
            UNID := strUNID[int0190];
            DESCR := 'Descricao ' + strUNID[int0190];
          end;
        end;
      end;

      with Registro0200New do
      begin
        COD_ITEM := '000001';
        DESCR_ITEM := 'PRODUTO 1';
        COD_BARRA := '';
        UNID_INV := 'UN';
        TIPO_ITEM := tiMercadoriaRevenda;
        COD_NCM := '30049026';
        COD_GEN := '30';
        ALIQ_ICMS := 17.00;

        //REGISTRO 0206: C�DIGO DE PRODUTO CONFORME TABELA PUBLICADA PELA ANP (COMBUST�VEIS)
//        With Registro0206New do
//        begin
//          COD_COMB := '910101001';
//        end;
      end;

      // FILHO
      for int0300 := 1 to 10 do
      begin
        // 10 Bens Imobilizados
        with Registro0300New do
        begin
          COD_IND_BEM := FormatFloat('000000', int0300);
          IDENT_MERC := 1;
          DESCR_ITEM := 'DESCRI��O DO ITEM';
          COD_PRNC := '';
          COD_CTA := '';
          NR_PARC := 10;
          // FILHO
          with Registro0305New do
          begin
            COD_CCUS := '1';
//            FUNC := 'BREVE DESCRI��O DA FUN��O DO IMOBILIZADO ' +FormatFloat('000000', int0300);;
            VIDA_UTIL := 60;
          end;
        end;
      end;

      with Registro0400New do
      begin
        COD_NAT := '12020';
        DESCR_NAT := 'DESCRI��O DA NATUREZA DE OPERA��O 12020';
      end;

      with Registro0450New do
      begin
        COD_INF := '000001';
        TXT := 'INFORMA��O COMPLEMENTAR DO DOCUMENTO FISCAL';
      end;

      with Registro0460New do
      begin
        COD_OBS := '000001';
        TXT := 'TEXTO DE OBSERVA��O DO DOCUMENTO FISCAL ';
      end;

      for int0500 := 1 to 10 do
      begin
        with Registro0500New do
        begin
          DT_ALT := StrToDate('30/11/2011');
          COD_NAT_CC := '01';
          IND_CTA := 'A';
          NIVEL := '1';
          COD_CTA := IntToStr(int0500);
          NOME_CTA := 'CONTA CONT�BIL ' + IntToStr(int0500);
        end;
      end;

      for int0600 := 1 to 10 do
      begin
        with Registro0600New do
        begin
          DT_ALT := StrToDate('30/11/2011');
          COD_CCUS := IntToStr(int0600);
          CCUS := 'CENTRO DE CUSTOS ' + IntToStr(int0600);
        end;
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_0;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDFiscal.btnB_9Click(Sender: TObject);
begin
  btnB_9.Enabled := False;
  ACBrSPEDFiscal1.WriteBloco_9;
  LoadToMemo;

  // Habilita os bot�es
  btnB_0.Enabled := True;
  btnB_1.Enabled := True;
  btnB_C.Enabled := True;
  btnB_D.Enabled := True;
  btnB_E.Enabled := True;
  btnB_G.Enabled := True;
  btnB_H.Enabled := True;

  cbConcomitante.Enabled := True;
end;

procedure TfrmSPEDFiscal.btnTXTClick(Sender: TObject);
begin
  btnTXT.Enabled := False;

  ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);

  with ACBrSPEDFiscal1 do
  begin
    DT_INI := StrToDate('01/11/2011');
    DT_FIN := StrToDate('30/11/2011');
  end;

  // Limpa a lista de erros.
  memoError.Lines.Clear;
  // Informa o pata onde ser� salvo o arquivo TXT.
  // ACBrSpedFiscal1.Path := '.\Arquivo Sped TXT\';

  // M�todo que gera o arquivo TXT.
  ACBrSPEDFiscal1.SaveFileTXT;

  // Carrega o arquivo TXT no memo.
  LoadToMemo;

  // Habilita os bot�es
  btnB_0.Enabled := True;
  btnTXT.Enabled := True;
  cbConcomitante.Enabled := True;
end;

procedure TfrmSPEDFiscal.btnErrorClick(Sender: TObject);
begin
  with ACBrSPEDFiscal1 do
  begin
    DT_INI := StrToDate('01/07/2011');
    DT_FIN := StrToDate('01/07/2011');
  end;

  // Limpa a lista de erros.
  memoError.Lines.Clear;

  // M�todo que gera o arquivo TXT.
  ACBrSPEDFiscal1.SaveFileTXT;

  // Habilita os bot�es
  btnB_0.Enabled := True;
  btnB_1.Enabled := True;
  btnB_C.Enabled := True;
  btnB_D.Enabled := True;
  btnB_E.Enabled := True;
  btnB_H.Enabled := True;
end;

procedure TfrmSPEDFiscal.btnB_1Click(Sender: TObject);
begin
  btnB_1.Enabled := False;
  btnB_9.Enabled := cbConcomitante.Checked;

  // Alimenta o componente com informa��es para gerar todos os registros do Bloco 1.
  with ACBrSPEDFiscal1.Bloco_1 do
  begin
    with Registro1001New do
    begin
      IND_MOV := imComDados;

      with Registro1010New do
      begin
        IND_EXP   := 'N'; // Reg. 1100 - Ocorreu averba��o (conclus�o) de exporta��o no per�odo:
        IND_CCRF  := 'N'; // Reg. 1200 � Existem informa��es acerca de cr�ditos de ICMS a serem controlados, definidos pela Sefaz:
        IND_COMB  := 'N'; // Reg. 1300 � � comercio varejista de combust�veis:
        IND_USINA := 'N'; // Reg. 1390 � Usinas de a��car e/�lcool � O estabelecimento � produtor de a��car e/ou �lcool carburante:
        IND_VA    := 'N'; // Reg. 1400 � Existem informa��es a serem prestadas neste registro e o registro � obrigat�rio em sua Unidade da Federa��o:
        IND_EE    := 'N'; // Reg. 1500 - A empresa � distribuidora de energia e ocorreu fornecimento de energia el�trica para consumidores de outra UF:
        IND_CART  := 'N'; // Reg. 1600 - Realizou vendas com Cart�o de Cr�dito ou de d�bito:
        IND_FORM  := 'N'; // Reg. 1700 - � obrigat�rio em sua unidade da federa��o o controle de utiliza��o de documentos  fiscais em papel:
        IND_AER   := 'N'; // Reg. 1800 � A empresa prestou servi�os de transporte a�reo de cargas e de passageiros:
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_1;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDFiscal.btnB_CClick(Sender: TObject);
var
  INotas: integer;
  IItens: integer;
  NNotas: integer;
  BNotas: integer;
begin
  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco C.
  btnB_C.Enabled := False;
  btnB_D.Enabled := True;

  NNotas := StrToInt64Def(edNotas.Text, 1);
  BNotas := StrToInt64Def(edBufNotas.Text, 1);

  ProgressBar1.Visible := cbConcomitante.Checked;
  ProgressBar1.Max := NNotas;
  ProgressBar1.Position := 0;

  with ACBrSPEDFiscal1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      IND_MOV := imComDados;
      //
      for INotas := 1 to NNotas do
      begin
        with RegistroC100New do
        begin
          IND_OPER := tpEntradaAquisicao;
          //S� pra variar a emiss�o entre pr�pria e de terceiros
          if Odd(INotas) then IND_EMIT := edEmissaoPropria
          else IND_EMIT := edTerceiros;

          COD_PART := '001';
          COD_MOD := '';
          COD_SIT := sdRegular;
          SER := '';
          NUM_DOC := FormatFloat('11000000', INotas);
          CHV_NFE := '';
          DT_DOC := DT_INI + INotas;
          DT_E_S := DT_INI + INotas;
          VL_DOC := 0;
          IND_PGTO := tpSemPagamento;
          VL_DESC := 0;
          VL_ABAT_NT := 0;
          VL_MERC := 0;
          IND_FRT := tfSemCobrancaFrete;
          VL_SEG := 0;
          VL_OUT_DA := 0;
          VL_BC_ICMS := 0;
          VL_ICMS := 0;
          VL_BC_ICMS_ST := 0;
          VL_ICMS_ST := 0;
          VL_IPI := 0;
          VL_PIS := 0;
          VL_COFINS := 0;
          VL_PIS_ST := 0;
          VL_COFINS_ST := 0;


          { Gera registros espec�ficos para notas emitidas por terceiros }
          if IND_EMIT = edTerceiros then
          begin
            With RegistroC110New do
            begin
              COD_INF := '000001';
              TXT_COMPL := '';

              with RegistroC113New do
              begin
                IND_OPER := tpEntradaAquisicao;
                IND_EMIT := edEmissaoPropria;
                COD_PART := '001';
                COD_MOD := '1';
                SER := '1';
                SUB := '1';
                NUM_DOC := '333';
                DT_DOC := StrToDate('02/11/2011');
              end;
            end;
          end;

          { Gera o registro de importa��o apenas para notas de entrada }
          if IND_OPER = tpEntradaAquisicao then
          begin
            with RegistroC120New do
            begin
              COD_DOC_IMP := diSimplificadaImport;
              NUM_DOC__IMP := '1024879531';
              PIS_IMP := 0.00;
              COFINS_IMP := 0.00;
              NUM_ACDRAW := '';
            end;
          end;

          { Gera registros espec�ficos para notas emitidas por terceiros e de presta��o }
          if (IND_EMIT = edTerceiros) and (IND_OPER = tpSaidaPrestacao) then
          begin
            with RegistroC130New do
            begin
              VL_SERV_NT := 10.12;
              VL_BC_ISSQN := 10.12;
              VL_ISSQN := 10.12;
              VL_BC_IRRF := 10.12;
              VL_IRRF := 10.12;
              VL_BC_PREV := 10.12;
              VL_PREV := 10.12;
            end;
          end;


          // REGISTRO C170: ITENS DO DOCUMENTO (C�DIGO 01, 1B, 04 e 55).
          for IItens := 1 to 10 do
          begin
            with RegistroC170New do // Inicio Adicionar os Itens:
            begin
              NUM_ITEM := FormatFloat('000', IItens);
              COD_ITEM := FormatFloat('000000', StrToInt(NUM_ITEM));
              DESCR_COMPL := FormatFloat('11000000', INotas) + ' -> ITEM '
                + COD_ITEM;
              QTD := 1;
              UNID := 'UN';
              VL_ITEM := 0;
              VL_DESC := 0;
              IND_MOV := mfNao;
              CST_ICMS := '001';
              CFOP := '1252';
              COD_NAT := '64';
              VL_BC_ICMS := 0;
              ALIQ_ICMS := 0;
              VL_ICMS := 0;
              VL_BC_ICMS_ST := 0;
              ALIQ_ST := 0;
              VL_ICMS_ST := 0;
              IND_APUR := iaMensal;
              CST_IPI := ipiEntradaIsenta;
              COD_ENQ := '';
              VL_BC_IPI := 0;
              ALIQ_IPI := 0;
              VL_IPI := 0;
              CST_PIS := pisOutrasOperacoes;
              VL_BC_PIS := 0;
              ALIQ_PIS_PERC := 0;
              QUANT_BC_PIS := 0;
              ALIQ_PIS_R := 0;
              VL_PIS := 0;
              CST_COFINS := cofinsOutrasOperacoes;
              VL_BC_COFINS := 0;
              ALIQ_COFINS_PERC := 0;
              QUANT_BC_COFINS := 0;
              ALIQ_COFINS_R := 0;
              VL_COFINS := 0;
              COD_CTA := '000';

              //REGISTRO C171: ARMAZENAMENTO DE COMBUSTIVEIS (c�digo 01, 55)
              { S� gera para opera��es de aquisi��o }
//              if IND_OPER = tpEntradaAquisicao then
//              begin
//                with RegistroC171New do
//                begin
//                  NUM_TANQUE := '115';
//                  QTDE := 1.00;
//                end;
//              end;

              //REGISTRO C176: RESSARCIMENTO DE ICMS EM OPERA��ES COM
              //SUBSTITUI��O TRIBUT�RIA (C�DIGO 01, 55).
//              with RegistroC176New do
//              begin
//                COD_MOD_ULT_E := '55';
//                NUM_DOC_ULT_E := '124567';
//                SER_ULT_E := '1';
//                DT_ULT_E := Now;
//                COD_PART_ULT_E := '000001';
//                QUANT_ULT_E := 10.00;
//                VL_UNIT_ULT_E := 1.00;
//                VL_UNIT_BC_ST := 5.00;
//              end;
            end; // Fim dos Itens;
          end;

          // REGISTRO C190: REGISTRO ANAL�TICO DO DOCUMENTO (C�DIGO 01, 1B, 04 E 55).
          for IItens := 1 to 10 do
          begin
            with RegistroC190New do
            begin
              CST_ICMS := '040';
              CFOP := '1252';
              ALIQ_ICMS := 0;
              VL_OPR := 0;
              VL_BC_ICMS := 0;
              VL_ICMS := 0;
              VL_BC_ICMS_ST := 0;
              VL_ICMS_ST := 0;
              VL_RED_BC := 0;
              VL_IPI := 0;
              COD_OBS := '000';
            end; // Fim dos Itens;
          end;
        end;

        if cbConcomitante.Checked then
        begin
          if (INotas mod BNotas) = 0 then // Gravar a cada N notas
          begin
            // Grava registros na memoria para o TXT, e limpa memoria
            ACBrSPEDFiscal1.WriteBloco_C(False); // False, NAO fecha o Bloco
            ProgressBar1.Position := INotas;
            Application.ProcessMessages;
          end;
        end;
      end;

      //REGISTRO C400 - EQUIPAMENTO ECF (C�DIGO 02 e 2D).
      With RegistroC400New do
      begin
        COD_MOD := '2D';
        ECF_MOD := 'DARUMA FS600';
        ECF_FAB := '21098765432123456789';
        ECF_CX := '001';

        With RegistroC405New do
        begin
          DT_DOC := DT_FIN; //StrToDate('30/11/2011');
          CRO := 1;
          CRZ := 1;
          NUM_COO_FIN := 1;
          GT_FIN := 100.00;
          VL_BRT := 100.00;

          With RegistroC410New do
          begin
            VL_PIS := 0.00;
            VL_COFINS := 0.00;
          end;

          With RegistroC420New do
          begin
            COD_TOT_PAR := 'T1700';
            VLR_ACUM_TOT := 100.00;
            NR_TOT := 1;
            DESCR_NR_TOT := 'TOTALIZADOR T1700';

            { Gera este registro somente para empresas do pergil B de apresenta��o }
            if Bloco_0.Registro0000.IND_PERFIL = pfPerfilB then
            begin
              With RegistroC425New do
              begin
                COD_ITEM := '000001';
                QTD := 1;
                UNID := 'PC';
                VL_ITEM := 100.00;
                VL_PIS := 0.00;
                VL_COFINS := 0.00;
              end;
            end;
          end;

          if Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB then
          begin
            with REgistroC460New do
            begin
              COD_MOD := '2D';
              COD_SIT := sdRegular;
              NUM_DOC := '000001';
              DT_DOC := StrToDate('30/11/2011');
              VL_DOC := 100.00;
              VL_PIS := 0.00;
              VL_COFINS := 0.00;
              CPF_CNPJ := '33333333333';
              NOM_ADQ := 'TESTE';

              with RegistroC470New do
              begin
                COD_ITEM := '000001';
                QTD := 1;
                QTD_CANC := 0;
                UNID := 'UN';
                VL_ITEM := 100.00;
                CST_ICMS := '000';
                CFOP := '5102';
                ALIQ_ICMS := 17.00;
                VL_PIS := 0.00;
                VL_COFINS := 0.00;
              end;
            end;
          end;

          with RegistroC490New do
          begin
            CST_ICMS := '000';
            CFOP := '5102';
            ALIQ_ICMS := 17.00;
            VL_OPR := 100.00;
            VL_BC_ICMS := 100.00;
            VL_ICMS := 17.00;
            COD_OBS := '000001'
          end;

          { S� envia este registro se o contribuinte for da BA }
          if Bloco_0.Registro0000.UF = 'BA' then
          begin
            with RegistroC495New do
            begin
              ALIQ_ICMS := 17.00;
              COD_ITEM := '000001';
              QTD := 1.00;
              QTD_CANC := 0.00;
              UNID := 'UN';
              VL_ITEM := 100.00;
              VL_DESC := 0.00;
              VL_CANC := 0.00;
              VL_ACMO := 0.00;
              VL_BC_ICMS := 100.00;
              VL_ICMS := 17.00;
              VL_ISEN := 0.00;
              VL_ICMS_ST := 0.00;
            end;
          end;
        end;
      end;

    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_C(True); // True, fecha o Bloco
    LoadToMemo;
  end;

  ProgressBar1.Visible := False;

end;

procedure TfrmSPEDFiscal.btnB_CompletoClick(Sender: TObject);
begin
  btnB_0Click(Self);
  btnB_CClick(Self);
  btnB_DClick(Self);
  btnB_EClick(Self);
  btnB_GClick(Self);
  btnB_HClick(Self);
  btnB_1Click(Self);

end;

procedure TfrmSPEDFiscal.btnB_DClick(Sender: TObject);
begin
  btnB_D.Enabled := False;
  btnB_E.Enabled := True;

  // Alimenta o componente com informa��es para gerar todos os registros do Bloco D.
  with ACBrSPEDFiscal1.Bloco_D do
  begin
    with RegistroD001New do
    begin
      IND_MOV := imComDados;

      with RegistroD100New do
      begin
        IND_OPER := tpEntradaAquisicao;
        IND_EMIT := edTerceiros;
        COD_PART := '000001';
        COD_MOD := '57';
        COD_SIT := sdRegular;
        SER := '1';
        NUM_DOC := '012345';
        CHV_CTE := '';
        DT_DOC := DT_FIN - 1; //StrToDate('30/11/2011');
        DT_A_P := DT_FIN - 1; //StrToDate('30/11/2011');
        TP_CT_e := '1';
        VL_DOC := 100.00;
        VL_DESC := 0.00;
        IND_FRT := tfPorContaEmitente;
        VL_SERV := 100.00;
        VL_BC_ICMS := 100.00;
        VL_ICMS := 17.00;
        VL_NT := 10.10;
        COD_INF := '000001';
        COD_CTA := '111';
      end;

      with RegistroD190New do
      begin
        CST_ICMS := '000';
        CFOP := '1252';
        ALIQ_ICMS := 17.00;
        VL_OPR := 100.00;
        VL_BC_ICMS := 100.00;
        VL_ICMS := 17.00;
        VL_RED_BC := 0.00;
        COD_OBS := '000001';
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_D;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDFiscal.btnB_EClick(Sender: TObject);
const
  ESTADOS: array [0 .. 1] of String = ('RS', 'SC');
var
  I: Integer;
begin
  // Alimenta o componente com informa��es para gerar todos os registros do Bloco E.
  btnB_E.Enabled := False;
  btnB_G.Enabled := True;

  with ACBrSPEDFiscal1.Bloco_E do
  begin
    with RegistroE001New do
    begin
      IND_MOV := imComDados;

      with RegistroE100New do
      begin
        DT_INI := StrToDate('01/11/2011');
        DT_FIN := StrToDate('30/11/2011');

        with RegistroE110New do
        begin
          VL_TOT_DEBITOS := 17.00;
          VL_AJ_DEBITOS := 0.00;
          VL_TOT_AJ_DEBITOS := 0.00;
          VL_ESTORNOS_CRED := 0;
          VL_TOT_CREDITOS := 17.00;
          VL_AJ_CREDITOS := 0;
          VL_TOT_AJ_CREDITOS := 0;
          VL_ESTORNOS_DEB := 0;
          VL_SLD_CREDOR_ANT := 0;
          VL_SLD_APURADO := 0.00;
          VL_TOT_DED := 0.00;
          VL_ICMS_RECOLHER := 0.00;
          VL_SLD_CREDOR_TRANSPORTAR := 0;
          DEB_ESP := 0;

          // with RegistroE111New do begin
          // COD_AJ_APUR    := 'RS009999';
          // DESCR_COMPL_AJ := '';
          // VL_AJ_APUR     := 1.00;
          //
          // with RegistroE112New do begin
          // NUM_DA    := '123';
          // NUM_PROC  := '123';
          // IND_PROC  := opOutros;
          // PROC      := 'DESCRI��O RESUMIDA';
          // TXT_COMPL := 'COMPLEMENTO';
          // end;
          //
          // with RegistroE113New do begin
          // COD_PART := '000001';
          // COD_MOD  := '01';
          // SER      := 'SERI';
          // SUB      := '';
          // NUM_DOC  := '123456789';
          // DT_DOC   := Now;
          // COD_ITEM := '000001';
          // VL_AJ_ITEM := 0;
          // end;
          // end;

          { Rio Grande do Sul n�o possui as tabelas do registro E115, ent�o este n�o precisa ser gerado }
          // with RegistroE115New do begin
          // COD_INF_ADIC   := 'RS000001';
          // VL_INF_ADIC    := 0;
          // DESCR_COMPL_AJ := '';
          // end;

          with RegistroE116New do
          begin
            COD_OR := '000';
            VL_OR := 0;
            DT_VCTO := Now;
            COD_REC := '123';
            NUM_PROC := '10';
            IND_PROC := opSefaz;
            PROC := 'DESCRI��O DO PROCESSO';
            TXT_COMPL := '';
            MES_REF := '112011';
          end;
        end;
      end;

      { Gera um registro E200 e filhos para cada estado onde o contribuinte possui inscri��o estadual }
      for I := Low(ESTADOS) to High(ESTADOS) do
      begin
        with RegistroE200New do
        begin
          DT_INI := StrToDate('01/11/2011');
          DT_FIN := StrToDate('30/11/2011');
          UF := ESTADOS[I];

          with RegistroE210New do
          begin
            IND_MOV_ST := mstSemOperacaoST;
            VL_SLD_CRED_ANT_ST := 0;
            VL_DEVOL_ST := 0;
            VL_RESSARC_ST := 0;
            VL_OUT_CRED_ST := 0;
            VL_AJ_CREDITOS_ST := 0;
            VL_SLD_DEV_ANT_ST := 0.00;
            VL_DEDUCOES_ST := 0;
            VL_ICMS_RECOL_ST := 0.00;
            VL_SLD_CRED_ST_TRANSPORTAR := 0;
            VL_OUT_DEB_ST := 0.00;
            DEB_ESP_ST := 0;

            // with RegistroE220New do begin
            // COD_AJ_APUR    := 'RS109999';
            // DESCR_COMPL_AJ := '';
            // VL_AJ_APUR     := 0.00;
            //
            // with RegistroE230New do begin
            // NUM_DA    := '123';
            // NUM_PROC  := '123';
            // IND_PROC  := opOutros;
            // PROC      := 'DESCRI��O RESUMIDA';
            // TXT_COMPL := 'COMPLEMENTO';
            // end;
            //
            // with RegistroE240New do begin
            // COD_PART   := '000001';
            // COD_MOD    := '01';
            // SER        := 'SERI';
            // SUB        := '';
            // NUM_DOC    := '123456789';
            // DT_DOC     := Now;
            // COD_ITEM   := '000001';
            // VL_AJ_ITEM := 0;
            // end;
            // end;

            with RegistroE250New do
            begin
              COD_OR := '000';
              VL_OR := 0;
              DT_VCTO := Now;
              COD_REC := '123';
              NUM_PROC := '1020304050';
              IND_PROC := opOutros;
              PROC := 'DESCRI��O RESUMIDA';
              TXT_COMPL := '';
              MES_REF := '112011';
            end;
          end;
        end;
      end;

      with RegistroE500New do
      begin
        IND_APUR := iaMensal;
        DT_INI := StrToDate('01/11/2011');
        DT_FIN := StrToDate('30/11/2011');

        with RegistroE510New do
        begin
          CFOP := '5120';
          CST_IPI := '50';
          VL_CONT_IPI := 0;
          VL_BC_IPI := 0;
          VL_IPI := 0;
        end;

        with RegistroE520New do
        begin
          VL_SD_ANT_IPI := 0;
          VL_DEB_IPI := 0;
          VL_CRED_IPI := 0;
          VL_OD_IPI := 10.00;
          VL_OC_IPI := 0;
          VL_SC_IPI := 0;
          VL_SD_IPI := 10.00;

          with RegistroE530New do
          begin
            IND_AJ := ajDebito;
            VL_AJ := 10;
            COD_AJ := '001';
            IND_DOC := odOutros;
            NUM_DOC := '123';
            DESCR_AJ := 'DESCRI��O DETALHADA';
          end;
        end;
        { fim registro E500 }
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_E;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDFiscal.btnB_GClick(Sender: TObject);
begin
  btnB_G.Enabled := False;
  btnB_H.Enabled := True;

  // Alimenta o componente com informa��es para gerar todos os registros do Bloco G.
  with ACBrSPEDFiscal1.Bloco_G do
  begin
    with RegistroG001New do
    begin
      IND_MOV := imComDados;

      With RegistroG110New do
      begin
        DT_INI := Now;
        DT_FIN := Now;
        SALDO_IN_ICMS := 44.00;
        SOM_PARC := 4.40;
        VL_TRIB_EXP := 10.999;
        VL_TOTAL := 10.999;
        IND_PER_SAI := 1.00;
        ICMS_APROP := 4.40;
        SOM_ICMS_OC := 10.999;

        With RegistroG125New do
        begin
          COD_IND_BEM := '000001';
          DT_MOV := StrToDate('01/11/2011');
          TIPO_MOV := mbcSI;
          VL_IMOB_ICMS_OP := 10.999;
          VL_IMOB_ICMS_ST := 10.999;
          VL_IMOB_ICMS_FRT := 10.999;
          VL_IMOB_ICMS_DIF := 10.999;
          NUM_PARC := 10;
          VL_PARC_PASS := 4.40;

          With RegistroG126New do
          begin
            DT_INI := StrToDate('01/10/2011');;
            DT_FIN := StrToDate('30/10/2011');;
            NUM_PARC := 1234;
            VL_PARC_PASS := 10.999;
            VL_TRIB_OC := 10.999;
            VL_TOTAL := 10.999;
            IND_PER_SAI := 1.00;
            VL_PARC_APROP := 10.999;
          end;

          With RegistroG130New do
          begin
            IND_EMIT := edEmissaoPropria;
            COD_PART := '000001';
            COD_MOD := '55';
            SERIE := '1';
            NUM_DOC := '000068849';
            CHV_NFE_CTE := '35100260318797000100550010000688490882775007';
            DT_DOC := Now;

            With RegistroG140New do
            begin
              NUM_ITEM := '9999';
              COD_ITEM := '000001';
            end;
          end;
        end;
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_G;
    LoadToMemo;
  end;

end;

procedure TfrmSPEDFiscal.btnB_HClick(Sender: TObject);
var
  IInvent: integer;
begin
  btnB_H.Enabled := False;
  btnB_1.Enabled := True;

  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco H.
  with ACBrSPEDFiscal1.Bloco_H do
  begin
    with RegistroH001New do
    begin
      IND_MOV := imComDados;
      //
      with RegistroH005New do
      begin
        DT_INV := DT_FIN; //o valor informado no campo deve ser menor ou igual ao valor no campo DT_FIN do registro 0000
        VL_INV := 1000;
        // FILHO
        for IInvent := 1 to 10 do
        begin
          with RegistroH010New do
          begin
            COD_ITEM := FormatFloat('00000000000000', IInvent);
            UNID := 'UN';
            QTD := 1;
            VL_UNIT := 100;
            VL_ITEM := 100;
            IND_PROP := piInformante;
            COD_PART := '';
            TXT_COMPL := '';
            COD_CTA := '';

            with RegistroH020New do
            begin
              CST_ICMS := '00';
              BC_ICMS  := 1;
              VL_ICMS := 2;
            end;

          end;
        end;
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_H;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDFiscal.edtFileChange(Sender: TObject);
begin
  ACBrSPEDFiscal1.Arquivo := edtFile.Text;
end;

procedure TfrmSPEDFiscal.LoadToMemo;
begin
  memoTXT.Lines.Clear;
  if FileExists(ACBrSPEDFiscal1.Path + ACBrSPEDFiscal1.Arquivo) then
    memoTXT.Lines.LoadFromFile(ACBrSPEDFiscal1.Path + ACBrSPEDFiscal1.Arquivo);
end;

procedure TfrmSPEDFiscal.cbConcomitanteClick(Sender: TObject);
begin
  btnTXT.Enabled := not cbConcomitante.Checked;
  btnError.Enabled := btnTXT.Enabled;

  edBufNotas.Enabled := cbConcomitante.Checked;

  if not cbConcomitante.Checked then
  begin
    btnB_0.Enabled := True;
    btnB_C.Enabled := False;
    btnB_D.Enabled := False;
    btnB_E.Enabled := False;
    btnB_H.Enabled := False;
    btnB_1.Enabled := False;
    btnB_9.Enabled := False;
  end;
end;

procedure TfrmSPEDFiscal.BtnBloco_0Click(Sender: TObject);
begin
  if btnGerar.Tag <> 1 then
  begin
    if not fnc_Valida_Campos then
      exit;
    if MessageDlg('Deseja gerar o <Bloco 0>?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
  end;

  fDMSPEDFiscal.mPessoa.EmptyDataSet;
  fDMSPEDFiscal.mProduto.EmptyDataSet;
  fDMSPEDFiscal.mUnidade.EmptyDataSet;
  fDMSPEDFiscal.mNatureza.EmptyDataSet;

  if fDMSPEDFiscal.cdsFilialID.AsInteger <> RxDBLookupCombo1.KeyValue then
    fDMSPEDFiscal.cdsFilial.Locate('ID',RxDBLookupCombo1.KeyValue,([Locaseinsensitive]));
  fDMSPEDFiscal.qUF.Close;
  fDMSPEDFiscal.qUF.ParamByName('UF').AsString := fDMSPEDFiscal.cdsFilialUF.AsString;
  fDMSPEDFiscal.qUF.Open;

  prc_Movimento;

  if fDMSPEDFiscal.cdsMovimento.IsEmpty then
  begin
    MessageDlg('*** N�o existe movimento no per�odo!', mtError, [mbOk], 0);
    exit;
  end;

  prc_Gerar_Bloco_0;
end;

procedure TfrmSPEDFiscal.prc_Gerar_Bloco_0;
begin
  vContador_Reg_0 := 0;
  
  //Tirei no dia 18/03/2014
  //ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);
  //ACBrSPEDFiscal1.Path         := DirectoryEdit1.Text;
  //ACBrSPEDFiscal1.Arquivo      := edtFile.Text;
  //ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);
  //ACBrSPEDFiscal1.IniciaGeracao;

  prc_Bloco_0_Reg_0000;
  prc_Bloco_0_Reg_0001;
  prc_Bloco_0_Reg_0005;
  prc_Bloco_0_Reg_0015; //N�o vai ser gerado no momento
  prc_Bloco_0_Reg_0100;
  prc_Bloco_0_Reg_0150;
  prc_Bloco_0_Reg_0190;
  prc_Bloco_0_Reg_0200;
  //prc_Bloco_0_Reg_0205;
  //prc_Bloco_0_Reg_0206;
  prc_Bloco_0_Reg_0300;
  prc_Bloco_0_Reg_0400;
  prc_Bloco_0_Reg_0450;
  prc_Bloco_0_Reg_0460;
  prc_Bloco_0_Reg_0500;
  prc_Bloco_0_Reg_0600;
  prc_Bloco_0_Reg_0990;

  //tirei daqui 18/03/2014
  //ACBrSPEDFiscal1.SaveFileTXT;
  //LoadToMemo;

    {with Registro0001New do

      end;

      // FILHO

      with Registro0450New do
      begin
        COD_INF := '000001';
        TXT := 'INFORMA��O COMPLEMENTAR DO DOCUMENTO FISCAL';
      end;

      with Registro0460New do
      begin
        COD_OBS := '000001';
        TXT := 'TEXTO DE OBSERVA��O DO DOCUMENTO FISCAL ';
      end;


      end;
    end;}

end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0000;
begin
  if RxDBLookupCombo1.KeyValue = '' then
  begin
    MessageDlg('*** Filial n�o informada', mtError, [mbOk], 0);
    exit;
  end;

  ACBrSPEDFiscal1.DT_INI := DateEdit1.Date;
  ACBrSPEDFiscal1.DT_FIN := DateEdit2.Date;

  fDMSPEDFiscal.qSped_Versao.Close;
  fDMSPEDFiscal.qSped_Versao.ParamByName('DATA').AsDate := DateEdit2.Date;
  fDMSPEDFiscal.qSped_Versao.Open;

  //case fDMSPEDFiscal.qParametrosVERSAO_LEIAUTE_SPED.AsInteger of
  case fDMSPEDFiscal.qSped_VersaoCOD_LEIAUTE.AsInteger  of
    1 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao100;
    2 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao101;
    3 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao102;
    4 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao103;
    5 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao104;
    6 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao105;
    7 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao106;
    8 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao107;
    9 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao108;
    10 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao109;
  end;
  case cbFinalidade.ItemIndex of
    0 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_FIN := raOriginal;
    1 : ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_FIN := raSubstituto;
  end;
  ACBrSPEDFiscal1.Bloco_0.Registro0000New.NOME := TirarAcento(fDMSPEDFiscal.cdsFilialNOME.AsString);
  if fDMSPEDFiscal.cdsFilialPESSOA.AsString = 'F' then
  begin
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.CPF  := Monta_Numero(fDMSPEDFiscal.cdsFilialCNPJ_CPF.AsString,11);
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.CNPJ := '';
  end
  else
  begin
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.CNPJ := Monta_Numero(fDMSPEDFiscal.cdsFilialCNPJ_CPF.AsString,14);
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.CPF  := '';
  end;
  ACBrSPEDFiscal1.Bloco_0.Registro0000New.UF := fDMSPEDFiscal.cdsFilialUF.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0000New.IE := Monta_Numero(fDMSPEDFiscal.cdsFilialINSCR_EST.AsString,0);
  fDMSPEDFiscal.prc_Abrir_qCidade(fDMSPEDFiscal.cdsFilialID_CIDADE.AsInteger);
  if not fDMSPEDFiscal.qCidade.IsEmpty then
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_MUN := fDMSPEDFiscal.qCidadeCODMUNICIPIO.AsInteger;
  ACBrSPEDFiscal1.Bloco_0.Registro0000New.IM      := fDMSPEDFiscal.cdsFilialINSCMUNICIPAL.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0000New.SUFRAMA := fDMSPEDFiscal.cdsFilialINSCR_SUFRAMA.AsString;
  if fDMSPEDFiscal.cdsFilialSPED_PERFIL.AsString = 'A' then
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_PERFIL := pfPerfilA
  else
  if fDMSPEDFiscal.cdsFilialSPED_PERFIL.AsString = 'B' then
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_PERFIL := pfPerfilB
  else
  if fDMSPEDFiscal.cdsFilialSPED_PERFIL.AsString = 'C' then
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_PERFIL := pfPerfilC;
  if fDMSPEDFiscal.cdsFilialSPED_ATIVIDADE.AsString = '0' then
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_ATIV := atIndustrial
  else
  if fDMSPEDFiscal.cdsFilialSPED_ATIVIDADE.AsString = '1' then
    ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_ATIV := atOutros;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0001;
begin
  ACBrSPEDFiscal1.Bloco_0.Registro0001New.IND_MOV := imComDados;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0005;
begin
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.FANTASIA := fDMSPEDFiscal.cdsFilialNOME_INTERNO.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.CEP      := Monta_Numero(fDMSPEDFiscal.cdsFilialCEP.AsString,8);
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.ENDERECO := fDMSPEDFiscal.cdsFilialENDERECO.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.NUM      := copy(fDMSPEDFiscal.cdsFilialNUM_END.AsString,1,10);
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.COMPL    := fDMSPEDFiscal.cdsFilialCOMPLEMENTO_END.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.BAIRRO   := fDMSPEDFiscal.cdsFilialBAIRRO.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.FONE     := Monta_Numero(fDMSPEDFiscal.cdsFilialDDD1.AsString + fDMSPEDFiscal.cdsFilialFONE.AsString,0);
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.FAX      := Monta_Numero(fDMSPEDFiscal.cdsFilialDDDFAX.AsString + fDMSPEDFiscal.cdsFilialFAX.AsString,0);
  ACBrSPEDFiscal1.Bloco_0.Registro0005New.EMAIL    := fDMSPEDFiscal.cdsFilialEMAIL_NFE.AsString;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0015;
begin
      // FILHO - Dados complementares da Empresa
//
//      with Registro0015New do
//      begin
//        UF_ST := 'SC';
//        IE_ST := '254504230';
//      end;
//  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0100;
begin
  fDMSPEDFiscal.qContabilista.Close;
  fDMSPEDFiscal.qContabilista.ParamByName('ID').AsInteger := fDMSPEDFiscal.cdsFilialID_CONTABILISTA.AsInteger;
  fDMSPEDFiscal.qContabilista.Open;
  if fDMSPEDFiscal.qContabilista.IsEmpty then
    exit;
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.NOME := fDMSPEDFiscal.qContabilistaNOME.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.CPF  := Monta_Numero(fDMSPEDFiscal.qContabilistaCPF.AsString,11);
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.CRC  := fDMSPEDFiscal.qContabilistaCRC.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.CNPJ := Monta_Numero(fDMSPEDFiscal.qContabilistaCNPJ.AsString,14);
  if copy(ACBrSPEDFiscal1.Bloco_0.Registro0100New.CNPJ,1,6) = '000000' then
    ACBrSPEDFiscal1.Bloco_0.Registro0100New.CNPJ := '';
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.CEP      := Monta_Numero(fDMSPEDFiscal.qContabilistaCEP.AsString,8);
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.ENDERECO := fDMSPEDFiscal.qContabilistaENDERECO.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.NUM      := fDMSPEDFiscal.qContabilistaNUM_END.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.COMPL    := fDMSPEDFiscal.qContabilistaCOMPLEMENTO_END.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.BAIRRO   := fDMSPEDFiscal.qContabilistaBAIRRO.AsString;
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.FONE     := Monta_Numero(fDMSPEDFiscal.qContabilistaDDD_FONE.AsString + fDMSPEDFiscal.qContabilistaFONE.AsString,0);
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.FAX      := Monta_Numero(fDMSPEDFiscal.qContabilistaDDD_FAX.AsString + fDMSPEDFiscal.qContabilistaFAX.AsString,0);
  ACBrSPEDFiscal1.Bloco_0.Registro0100New.EMAIL    := fDMSPEDFiscal.qContabilistaEMAIL.AsString;
  fDMSPEDFiscal.prc_Abrir_qCidade(fDMSPEDFiscal.qContabilistaID_CIDADE.AsInteger);
  if not fDMSPEDFiscal.qCidade.IsEmpty then
    ACBrSPEDFiscal1.Bloco_0.Registro0100New.COD_MUN := fDMSPEDFiscal.qCidadeCODMUNICIPIO.AsInteger;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0150;
begin
  fDMSPEDFiscal.mPessoa.First;
  while not fDMSPEDFiscal.mPessoa.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0150New do
        begin
          COD_PART := fDMSPEDFiscal.mPessoaCodigo.AsString;
          NOME     := fDMSPEDFiscal.mPessoaNome.AsString;
          COD_PAIS := fDMSPEDFiscal.mPessoaCod_Pais.AsString;
          if fDMSPEDFiscal.mPessoaCNPJ.AsString <> '' then
            CNPJ := Monta_Numero(fDMSPEDFiscal.mPessoaCNPJ.AsString,14)
          else
            CPF := Monta_Numero(fDMSPEDFiscal.mPessoaCPF.AsString,11);
          IE := fDMSPEDFiscal.mPessoaInscr_Estadual.AsString;
          COD_MUN := fDMSPEDFiscal.mPessoaCod_Municipio.AsInteger;
          SUFRAMA := fDMSPEDFiscal.mPessoaSuframa.AsString;
          ENDERECO := fDMSPEDFiscal.mPessoaEndereco.AsString;
          NUM      := fDMSPEDFiscal.mPessoaNum_End.AsString;
          COMPL    := fDMSPEDFiscal.mPessoaComplemento_End.AsString;
          BAIRRO   := fDMSPEDFiscal.mPessoaBairro.AsString;
          vContador_Reg_0 := vContador_Reg_0 + 1;
        end
      end
    end;
    //prc_Bloco_0_Reg_0175 // No Momento n�o vai ser usado

    {ACBrSPEDFiscal1.Bloco_0.Registro0150New.COD_PART := fDMSPEDFiscal.mPessoaCodigo.AsString;
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.NOME     := fDMSPEDFiscal.mPessoaNome.AsString;
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.COD_PAIS := fDMSPEDFiscal.mPessoaCod_Pais.AsString;
    if fDMSPEDFiscal.mPessoaCNPJ.AsString <> '' then
      ACBrSPEDFiscal1.Bloco_0.Registro0150New.CNPJ := Monta_Numero(fDMSPEDFiscal.mPessoaCNPJ.AsString,14)
    else
      ACBrSPEDFiscal1.Bloco_0.Registro0150New.CNPJ := Monta_Numero(fDMSPEDFiscal.mPessoaCPF.AsString,11);
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.IE := fDMSPEDFiscal.mPessoaInscr_Estadual.AsString;
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.COD_MUN := fDMSPEDFiscal.mPessoaCod_Municipio.AsInteger;
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.SUFRAMA := fDMSPEDFiscal.mPessoaSuframa.AsString;
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.ENDERECO := fDMSPEDFiscal.mPessoaEndereco.AsString;
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.NUM      := fDMSPEDFiscal.mPessoaNum_End.AsString;
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.COMPL    := fDMSPEDFiscal.mPessoaComplemento_End.AsString;
    ACBrSPEDFiscal1.Bloco_0.Registro0150New.BAIRRO   := fDMSPEDFiscal.mPessoaBairro.AsString;
    vContador_Reg_0 := vContador_Reg_0 + 1;
    //prc_Bloco_0_Reg_0175 // No Momento n�o vai ser usado}
    fDMSPEDFiscal.mPessoa.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0175;
begin
  // FILHO - 1 Altera��o para cada cliente de 2 a 3
  {with Registro0175New do
  begin
    DT_ALT := DT_INI + 1;
    NR_CAMPO := '1';
    CONT_ANT := 'CAMPO ANTERIOR ' + '1';
  end;}
  //vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0190;
begin
  fDMSPEDFiscal.mUnidade.First;
  while not fDMSPEDFiscal.mUnidade.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0190New do
        begin
          UNID  := fDMSPEDFiscal.mUnidadeUnidade.AsString;
          DESCR := fDMSPEDFiscal.mUnidadeNome.AsString;
          vContador_Reg_0 := vContador_Reg_0 + 1;
        end
      end
    end;
    if StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.mUnidadeFator_Conversao.AsFloat)) <> 1 then
      prc_Bloco_0_Reg_0220;
    fDMSPEDFiscal.mUnidade.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Movimento;
var
  vTipo_Reg : String;
  vNumNota : Integer;
  vID_Natureza : Integer;
begin
  fDMSPEDFiscal.cdsMovimento.Close;
  fDMSPEDFiscal.sdsMovimento.ParamByName('DT_INICIAL').AsDate := DateEdit1.Date;
  fDMSPEDFiscal.sdsMovimento.ParamByName('DT_FINAL').AsDate   := DateEdit2.Date;
  fDMSPEDFiscal.sdsMovimento.ParamByName('FILIAL').AsInteger  := RxDBLookupCombo1.KeyValue;
  fDMSPEDFiscal.cdsMovimento.Open;
  fDMSPEDFiscal.cdsMovimento.IndexFieldNames := 'ID';
  vTipo_Reg    := '';
  vNumNota     := 0;
  vID_Natureza := 0;
  fDMSPEDFiscal.cdsMovimento.First;


  while not fDMSPEDFiscal.cdsMovimento.Eof do
  begin
    if (((fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTS') or (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTE'))
       and (fDMSPEDFiscal.cdsMovimentoID_NOTAFISCAL.AsInteger <> vNumNota)) or
       ((fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NSE') and (fDMSPEDFiscal.cdsMovimentoID_NOTASERVICO.AsInteger <> vNumNota)) then
      prc_Gravar_mPessoa;
      
    prc_Gravar_mProduto;
    prc_Gravar_mUnidade(fDMSPEDFiscal.cdsMovimentoUNIDADE.AsString);
    if fDMSPEDFiscal.cdsMovimentoUNIDADE.AsString <> fDMSPEDFiscal.cdsMovimentoUNIDADE_PRODUTO_CAD.AsString then
      prc_Gravar_mUnidade(fDMSPEDFiscal.cdsMovimentoUNIDADE_PRODUTO_CAD.AsString);
    if vID_Natureza <> fDMSPEDFiscal.cdsMovimentoID_CFOP.AsInteger then
      prc_Gravar_mNatureza;

    if (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTS') or (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTE') then
      vNumNota := fDMSPEDFiscal.cdsMovimentoID_NOTAFISCAL.AsInteger
    else
    if (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NSE') then
      vNumNota := fDMSPEDFiscal.cdsMovimentoID_NOTASERVICO.AsInteger
    else
    if (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'CFI') then
      vNumNota := fDMSPEDFiscal.cdsMovimentoID_CUPOMFISCAL.AsInteger;
    vID_Natureza := 0;
    fDMSPEDFiscal.cdsMovimento.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Gravar_mPessoa;
begin
  if fDMSPEDFiscal.mPessoa.FindKey([fDMSPEDFiscal.cdsMovimentoID_PESSOA.AsInteger]) then
    exit;
  fDMSPEDFiscal.qPessoa.Close;
  fDMSPEDFiscal.qPessoa.ParamByName('CODIGO').AsInteger := fDMSPEDFiscal.cdsMovimentoID_PESSOA.AsInteger;
  fDMSPEDFiscal.qPessoa.Open;

  fDMSPEDFiscal.mPessoa.Insert;
  fDMSPEDFiscal.mPessoaCodigo.AsInteger := fDMSPEDFiscal.cdsMovimentoID_PESSOA.AsInteger;
  fDMSPEDFiscal.mPessoaNome.AsString    := fDMSPEDFiscal.qPessoaNOME.AsString;
  fDMSPEDFiscal.mPessoaCod_Pais.AsString   := fDMSPEDFiscal.qPessoaCODPAIS.AsString;
  if fDMSPEDFiscal.qPessoaPESSOA.AsString = 'J' then
    fDMSPEDFiscal.mPessoaCNPJ.AsString := Monta_Numero(fDMSPEDFiscal.qPessoaCNPJ_CPF.AsString,14)
  else
    fDMSPEDFiscal.mPessoaCPF.AsString := Monta_Numero(fDMSPEDFiscal.qPessoaCNPJ_CPF.AsString,11);
  fDMSPEDFiscal.mPessoaInscr_Estadual.AsString := fDMSPEDFiscal.qPessoaINSCR_EST.AsString;
  fDMSPEDFiscal.mPessoaCod_Municipio.AsString   := fDMSPEDFiscal.qPessoaCODMUNICIPIO.AsString;
  fDMSPEDFiscal.mPessoaSuframa.AsString         := '';
  fDMSPEDFiscal.mPessoaEndereco.AsString        := fDMSPEDFiscal.qPessoaENDERECO.AsString;
  fDMSPEDFiscal.mPessoaNum_End.AsString         := fDMSPEDFiscal.qPessoaNUM_END.AsString;
  fDMSPEDFiscal.mPessoaComplemento_End.AsString := fDMSPEDFiscal.qPessoaCOMPLEMENTO_END.AsString;
  fDMSPEDFiscal.mPessoaBairro.AsString          := fDMSPEDFiscal.qPessoaBAIRRO.AsString;
  fDMSPEDFiscal.mPessoa.Post;
end;

procedure TfrmSPEDFiscal.prc_Gravar_mProduto;
var
  vCodigo : String;
begin
  //if trim(fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString) <> '' then
  //  vCodigo := vCodigo + 'T' + fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString;
  //if fDMSPEDFiscal.qParametrosIMP_NFE_REF_PROD.AsString = 'R' then
  //  vCodigo := fDMSPEDFiscal.cdsMovimentoREFERENCIA.AsString
  //else
  //  vCodigo := fDMSPEDFiscal.cdsMovimentoID_PRODUTO.AsString;
  if fDMSPEDFiscal.qParametrosIMP_NFE_REF_PROD.AsString = 'R' then
    vCodigo := fDMSPEDFiscal.cdsMovimentoREFERENCIA.AsString
  else
    vCodigo := fDMSPEDFiscal.cdsMovimentoID_PRODUTO.AsString;
  if fDMSPEDFiscal.cdsMovimentoID_COR.AsInteger > 0 then
    vCodigo := vCodigo + '.' + fDMSPEDFiscal.cdsMovimentoID_COR.AsString;
  if (trim(fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString) <> '') and (fDMSPEDFiscal.cdsMovimentoUSA_TAMANHO_AGRUPADO_NFE.AsString <> 'S') then
    vCodigo := vCodigo + '.' + fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString;

  if fDMSPEDFiscal.mProduto.FindKey([vCodigo]) then
    exit;
  fDMSPEDFiscal.mProduto.Insert;
  fDMSPEDFiscal.mProdutoID.AsInteger         := fDMSPEDFiscal.cdsMovimentoID_PRODUTO.AsInteger;
  fDMSPEDFiscal.mProdutoCod_Produto.AsString := vCodigo;
  if trim(fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString) <> '' then
    fDMSPEDFiscal.mProdutoTamanho.AsString     := fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString;
  fDMSPEDFiscal.mProdutoNome.AsString := fDMSPEDFiscal.cdsMovimentoNOME_PRODUTO_SERV.AsString;
  fDMSPEDFiscal.mProdutoCod_Barra.AsString := fDMSPEDFiscal.cdsMovimentoCOD_BARRA_CAD.AsString;
  fDMSPEDFiscal.mProdutoCod_Anterior.AsString := '';
  fDMSPEDFiscal.mProdutoUnidade.AsString      := fDMSPEDFiscal.cdsMovimentoUNIDADE_PRODUTO_CAD.AsString;
  fDMSPEDFiscal.mProdutoTipo_Item.AsString    := fDMSPEDFiscal.cdsMovimentoSPED_TIPO_ITEM.AsString;
  fDMSPEDFiscal.mProdutoNCM.AsString          := Monta_Numero(fDMSPEDFiscal.cdsMovimentoNCM.AsString,0);
  fDMSPEDFiscal.mProdutoNCM_EX.AsString       := fDMSPEDFiscal.cdsMovimentoNCM_EX.AsString;
  fDMSPEDFiscal.mProdutoEX_IPI.AsString       := fDMSPEDFiscal.cdsMovimentoNCM_EX.AsString;
  fDMSPEDFiscal.mProdutoCOD_SERVICO.AsInteger := 0;
  fDMSPEDFiscal.mProdutoPERC_ICMS.AsFloat     := StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.qUFPERC_ICMS_INTERNO.AsFloat));
  fDMSPEDFiscal.mProduto.Post;
end;

procedure TfrmSPEDFiscal.prc_Gravar_mUnidade(Unidade : String);
begin
  if fDMSPEDFiscal.mUnidade.FindKey([Unidade]) then
    exit;
  fDMSPEDFiscal.qUnidade.Close;
  fDMSPEDFiscal.qUnidade.ParamByName('UNIDADE').AsString := Unidade;
  fDMSPEDFiscal.qUnidade.Open;
  fDMSPEDFiscal.mUnidade.Insert;
  fDMSPEDFiscal.mUnidadeUnidade.AsString := Unidade;
  if fDMSPEDFiscal.qUnidadeUNIDADE.AsString <> fDMSPEDFiscal.qUnidadeNOME.AsString then
    fDMSPEDFiscal.mUnidadeNome.AsString := fDMSPEDFiscal.qUnidadeNOME.AsString;
  fDMSPEDFiscal.mUnidadeFator_Conversao.AsFloat := 1;
  fDMSPEDFiscal.mUnidade.Post;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0200;
begin
  fDMSPEDFiscal.mProduto.First;
  while not fDMSPEDFiscal.mProduto.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0200New do
        begin
          COD_ITEM     := fDMSPEDFiscal.mProdutoCod_Produto.AsString;
          DESCR_ITEM   := fDMSPEDFiscal.mProdutoNome.AsString;
          COD_BARRA    := fDMSPEDFiscal.mProdutoCod_Barra.AsString;
          COD_ANT_ITEM := '';
          UNID_INV     := fDMSPEDFiscal.mProdutoUnidade.AsString;
          case fDMSPEDFiscal.mProdutoTipo_Item.AsInteger of
            0 : TIPO_ITEM := tiMercadoriaRevenda;
            1 : TIPO_ITEM := tiMateriaPrima;
            2 : TIPO_ITEM := tiEmbalagem;
            3 : TIPO_ITEM := tiProdutoProcesso;
            4 : TIPO_ITEM := tiProdutoAcabado;
            5 : TIPO_ITEM := tiSubproduto;
            6 : TIPO_ITEM := tiProdutoIntermediario;
            7 : TIPO_ITEM := tiMaterialConsumo;
            8 : TIPO_ITEM := tiAtivoImobilizado;
            9 : TIPO_ITEM := tiServicos;
           10 : TIPO_ITEM := tiOutrosInsumos;
           99 : TIPO_ITEM := tiOutras;
          end;
          COD_NCM   := fDMSPEDFiscal.mProdutoNCM.AsString;
          EX_IPI    := fDMSPEDFiscal.mProdutoEX_IPI.AsString;
          COD_GEN   := copy(fDMSPEDFiscal.mProdutoNCM.AsString,1,2);
          COD_LST   := '';
          ALIQ_ICMS := StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.mProdutoPERC_ICMS.AsFloat));
          vContador_Reg_0 := vContador_Reg_0 + 1;
        end;
      end;
    end;
    fDMSPEDFiscal.mProduto.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0205;
begin
  //N�o foi feito este bloco
  //  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0206;
begin
  //N�o foi feito este bloco
        //REGISTRO 0206: C�DIGO DE PRODUTO CONFORME TABELA PUBLICADA PELA ANP (COMBUST�VEIS)
//        With Registro0206New do
//        begin
//          COD_COMB := '910101001';
//        end;
//    vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0220;
begin
  with ACBrSPEDFiscal1.Bloco_0 do
  begin
    with Registro0001New do
    begin
      with Registro0220New do
      begin
        UNID_CONV := fDMSPEDFiscal.mUnidadeUnidade.AsString;
        FAT_CONV  := fDMSPEDFiscal.mUnidadeFator_Conversao.AsFloat;
      end;
    end;
  end;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0300;
begin
  fDMSPEDFiscal.cdsAtivoImob.Close;
  fDMSPEDFiscal.cdsAtivoImob.Open;
  fDMSPEDFiscal.cdsAtivoImob.First;
  while not fDMSPEDFiscal.cdsAtivoImob.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0300New do
        begin
          COD_IND_BEM := fDMSPEDFiscal.cdsAtivoImobID.AsString;
          IDENT_MERC  := fDMSPEDFiscal.cdsAtivoImobTIPO_ATIVO.AsInteger;
          DESCR_ITEM  := fDMSPEDFiscal.cdsAtivoImobNOME_PRODUTO.AsString;
          if fDMSPEDFiscal.cdsAtivoImobID_PRODUTO_PRINCIPAL.AsInteger > 0 then
          begin
            if fDMSPEDFiscal.qParametrosIMP_NFE_REF_PROD.AsString = 'R' then
              COD_PRNC  := fDMSPEDFiscal.cdsAtivoImobREF_PRINCIPAL.AsString
            else
              COD_PRNC  := fDMSPEDFiscal.cdsAtivoImobID_PRODUTO_PRINCIPAL.AsString;
          end;
          COD_CTA := fDMSPEDFiscal.cdsAtivoImobCOD_PLANO_CONTAS.AsString;
          NR_PARC := fDMSPEDFiscal.cdsAtivoImobNUM_PARCELA_BEM.AsInteger;
        end;
      end;
    end;
    vContador_Reg_0 := vContador_Reg_0 + 1;
    prc_Bloco_0_Reg_0305;
    fDMSPEDFiscal.cdsAtivoImob.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0305;
begin
  with ACBrSPEDFiscal1.Bloco_0 do
  begin
    with Registro0001New do
    begin
      with Registro0305New do
      begin
        COD_CCUS := fDMSPEDFiscal.cdsAtivoImobCOD_CENTRO_CUSTO.AsString;
        FUNC     := fDMSPEDFiscal.cdsAtivoImobFUNCAO.AsString;
        VIDA_UTIL := fDMSPEDFiscal.cdsAtivoImobVIDA_UTIL.AsInteger;
      end;
    end;
  end;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDFiscal.prc_Gravar_mNatureza;
begin
  if fDMSPEDFiscal.mNatureza.FindKey([fDMSPEDFiscal.cdsMovimentoCODCFOP.AsString]) then
    exit;
  fDMSPEDFiscal.mNatureza.Insert;
  fDMSPEDFiscal.mNaturezaCod_Natureza.AsString  := fDMSPEDFiscal.cdsMovimentoCODCFOP.AsString;
  fDMSPEDFiscal.mNaturezaNome_Natureza.AsString := fDMSPEDFiscal.cdsMovimentoNOME_CFOP.AsString;
  fDMSPEDFiscal.mNatureza.Post;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0400;
begin
  fDMSPEDFiscal.mNatureza.First;
  while not fDMSPEDFiscal.mNatureza.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0400New do
        begin
          COD_NAT   := fDMSPEDFiscal.mNaturezaCod_Natureza.AsString;
          DESCR_NAT := fDMSPEDFiscal.mNaturezaNome_Natureza.AsString;
        end;
      end;
    end;
    vContador_Reg_0 := vContador_Reg_0 + 1;
    fDMSPEDFiscal.mNatureza.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0500;
begin
  fDMSPEDFiscal.cdsPlano_Contas.Close;
  fDMSPEDFiscal.cdsPlano_Contas.Open;
  fDMSPEDFiscal.cdsPlano_Contas.IndexFieldNames := 'CODIGO;ID';
  fDMSPEDFiscal.cdsPlano_Contas.First;
  while not fDMSPEDFiscal.cdsPlano_Contas.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0500New do
        begin
          DT_ALT := fDMSPEDFiscal.cdsPlano_ContasDT_CADASTRO.AsDateTime;
          COD_NAT_CC := fDMSPEDFiscal.cdsPlano_ContasCOD_NATUREZA.AsString;
          IND_CTA    := fDMSPEDFiscal.cdsPlano_ContasTIPO_REG.AsString;
          NIVEL      := fDMSPEDFiscal.cdsPlano_ContasNIVEL.AsString;
          COD_CTA    := fDMSPEDFiscal.cdsPlano_ContasCODIGO.AsString;
          NOME_CTA   := fDMSPEDFiscal.cdsPlano_ContasNOME.AsString;
        end;
      end;
    end;
    vContador_Reg_0 := vContador_Reg_0 + 1;
    fDMSPEDFiscal.cdsPlano_Contas.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0600;
begin
  fDMSPEDFiscal.cdsCentroCusto.Close;
  fDMSPEDFiscal.cdsCentroCusto.Open;
  fDMSPEDFiscal.cdsCentroCusto.First;
  while not fDMSPEDFiscal.cdsCentroCusto.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0600New do
        begin
          DT_ALT   := fDMSPEDFiscal.cdsCentroCustoDT_CADASTRO.AsDateTime;
          COD_CCUS := fDMSPEDFiscal.cdsCentroCustoCODIGO.AsString;
          CCUS     := fDMSPEDFiscal.cdsCentroCustoDESCRICAO.AsString;
        end;
      end;
    end;
    vContador_Reg_0 := vContador_Reg_0 + 1;
    fDMSPEDFiscal.cdsCentroCusto.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0990;
begin
  vContador_Reg_0 := vContador_Reg_0 + 1;
  //ACBrSPEDFiscal1.Bloco_0.Registro0990.QTD_LIN_0 := vContador_Reg_0;
  ACBrSPEDFiscal1.Bloco_0.Registro0990.QTD_LIN_0 := vContador_Reg_0;
end;

procedure TfrmSPEDFiscal.FormShow(Sender: TObject);
begin
  fDMSPEDFiscal := TDMSPEDFiscal.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMSPEDFiscal);
  TS_Exemplo.TabVisible := False;
  if fDMSPEDFiscal.cdsFilial.RecordCount = 1 then
    RxDBLookupCombo1.KeyValue := fDMSPEDFiscal.cdsFilialID.AsInteger;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0450;
begin
  fDMSPEDFiscal.m0450.First;
  while not fDMSPEDFiscal.m0450.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0450New do
        begin
          COD_INF := fDMSPEDFiscal.m0450Codigo.AsString;
          TXT     := fDMSPEDFiscal.m0450Obs.AsString;
        end;
      end;
    end;
    fDMSPEDFiscal.m0450.Next;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_0_Reg_0460;
begin
  fDMSPEDFiscal.m0460.First;
  while not fDMSPEDFiscal.m0460.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0460New do
        begin
          COD_OBS := fDMSPEDFiscal.m0460Codigo.AsString;
          TXT     := fDMSPEDFiscal.m0460Obs.AsString;
        end;
      end;
    end;
    fDMSPEDFiscal.m0460.Next;
  end;
end;

function TfrmSPEDFiscal.fnc_Valida_Campos(Tipo_Bloco : String = '') : Boolean;
var
  vMsg : String;
begin
  Result := False;
  vMsg   := '';
  if (DateEdit1.Date < 10) or (DateEdit2.Date < 10) or (DateEdit1.Date > DateEdit2.Date) then
    vMsg := vMsg + #13 + 'Per�odo informado inv�lido!';
  if RxDBLookupCombo1.Text = '' then
    vMsg := vMsg + #13 + '*** Filial n�o informada!';
  if fDMSPEDFiscal.cdsFilialID_CONTABILISTA.AsInteger <= 0 then
    vMsg := vMsg + #13 + '*** Filial n�o possui contabilista cadastrado!';
  if trim(vMsg) <> '' then
  begin
    MessageDlg(vMsg, mtError, [mbOk], 0);
    exit;
  end;
  Result := True;
end;

procedure TfrmSPEDFiscal.btnBloco_CClick(Sender: TObject);
begin
  if btnGerar.Tag <> 1 then
  begin
    if not fnc_Valida_Campos then
      exit;
    if MessageDlg('Deseja gerar o <Bloco C>?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
  end;
  prc_Gerar_Bloco_C;
end;

procedure TfrmSPEDFiscal.prc_Gerar_Bloco_C;
var
  vAux : String;
begin
  vContador_Reg_C := 0;
  prc_Abrir_NotaFiscal('C');

  fDMSPEDFiscal.cdsNFe_Inutilizadas.Close;
  fDMSPEDFiscal.sdsNFe_Inutilizadas.ParamByName('DT_INICIAL').AsDate := DateEdit1.Date;
  fDMSPEDFiscal.sdsNFe_Inutilizadas.ParamByName('DT_FINAL').AsDate   := DateEdit2.Date;
  fDMSPEDFiscal.sdsNFe_Inutilizadas.ParamByName('FILIAL').AsInteger  := RxDBLookupCombo1.KeyValue;
  fDMSPEDFiscal.cdsNFe_Inutilizadas.Open;

  //Abertura do Bloco C
  with ACBrSPEDFiscal1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      IND_MOV := imComDados;
      vContador_Reg_C := vContador_Reg_C + 1;
    end;
  end;

  prc_Bloco_C_Reg_C100_Inutilizadas;

  fDMSPEDFiscal.cdsNotaFiscal.First;
  while not fDMSPEDFiscal.cdsNotaFiscal.Eof do
  begin
    fDMSPEDFiscal.mC190.EmptyDataSet;
    if (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '06') or (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '29') or
      (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '28') then
      prc_Bloco_C_Reg_C500
    else
    //if (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '01') or (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '1B') or
      //  (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '04') or (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '55') then
      prc_Bloco_C_Reg_C100;
    fDMSPEDFiscal.cdsNotaFiscal.Next;
  end;

  prc_Bloco_C_Reg_C990;
  //ACBrSPEDFiscal1.WriteBloco_C(True); // False, NAO fecha o Bloco
end;

procedure TfrmSPEDFiscal.prc_Bloco_C_Reg_C100;
var
  i : Integer;
  vAux_Aliq : Real;
begin
  with ACBrSPEDFiscal1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      with RegistroC100New do
      begin
        if fDMSPEDFiscal.cdsNotaFiscalTIPO_NOTA.AsString = 'E' then
          IND_OPER := tpEntradaAquisicao
        else
          IND_OPER := tpSaidaPrestacao;
        //S� pra variar a emiss�o entre pr�pria e de terceiros
        if fDMSPEDFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE' then
          IND_EMIT := edTerceiros
        else
          IND_EMIT := edEmissaoPropria;
        COD_PART := fDMSPEDFiscal.cdsNotaFiscalID_CLIENTE.AsString;
        if fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '' then
          COD_MOD := '55'
        else
          COD_MOD  := fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString;
        if fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString = 'S' then
          COD_SIT  := sdCancelado
        else
        if fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString = 'S' then
          COD_SIT  := sdDoctoDenegado
        else
        if fDMSPEDFiscal.cdsNotaFiscalNFEFINALIDADE.AsString = '2' then
          COD_SIT  := sdFiscalCompl
        else
          COD_SIT  := sdRegular;
        SER     := fDMSPEDFiscal.cdsNotaFiscalSERIE.AsString;
        //NUM_DOC := FormatFloat('11000000', );
        NUM_DOC := fDMSPEDFiscal.cdsNotaFiscalNUMNOTA.AsString;
        CHV_NFE := fDMSPEDFiscal.cdsNotaFiscalNFECHAVEACESSO.AsString;
        DT_DOC := fDMSPEDFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime;
        if fDMSPEDFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime > 10 then
          DT_E_S := fDMSPEDFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime;
        if (fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString <> 'S') and (fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString <> 'S') then
        begin
          VL_DOC := fDMSPEDFiscal.cdsNotaFiscalVLR_NOTA.AsFloat;
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_PRAZO.AsString = 'N' then
            IND_PGTO := tpSemPagamento
          else
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_PRAZO.AsString = 'V' then
            IND_PGTO := tpVista
          else
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_PRAZO.AsString = 'P' then
            IND_PGTO := tpPrazo;
          VL_DESC    := fDMSPEDFiscal.cdsNotaFiscalVLR_DESCONTO.AsFloat;
          VL_ABAT_NT := 0;
          VL_MERC    := fDMSPEDFiscal.cdsNotaFiscalVLR_ITENS.AsFloat;
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_FRETE.AsString = '1' then
            IND_FRT := tfPorContaEmitente
          else
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_FRETE.AsString = '2' then
            IND_FRT := tfPorContaDestinatario
          else
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_FRETE.AsString = '3' then
            IND_FRT := tfPorContaTerceiros
          else
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_FRETE.AsString = '9' then
            IND_FRT := tfSemCobrancaFrete;
          VL_SEG := fDMSPEDFiscal.cdsNotaFiscalVLR_FRETE.AsFloat;
          VL_OUT_DA := fDMSPEDFiscal.cdsNotaFiscalVLR_OUTRASDESP.AsFloat;
          if StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscalBASE_ICMSSIMPLES.AsFloat)) > 0 then
            VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscalBASE_ICMSSIMPLES.AsFloat
          else
            VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscalBASE_ICMS.AsFloat;
          if StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscalVLR_ICMSSIMPLES.AsFloat)) > 0 then
            VL_ICMS := fDMSPEDFiscal.cdsNotaFiscalVLR_ICMSSIMPLES.AsFloat
          else
            VL_ICMS := fDMSPEDFiscal.cdsNotaFiscalVLR_ICMS.AsFloat;
          VL_BC_ICMS_ST := fDMSPEDFiscal.cdsNotaFiscalBASE_ICMSSUBST.AsFloat;
          VL_ICMS_ST    := fDMSPEDFiscal.cdsNotaFiscalVLR_ICMSSUBST.AsFloat;
          VL_IPI        := fDMSPEDFiscal.cdsNotaFiscalVLR_IPI.AsFloat;
          VL_PIS        := fDMSPEDFiscal.cdsNotaFiscalVLR_PIS.AsFloat;
          VL_COFINS     := fDMSPEDFiscal.cdsNotaFiscalVLR_COFINS.AsFloat;
          VL_PIS_ST     := 0;
          VL_COFINS_ST  := 0;
        end;
        vContador_Reg_C := vContador_Reg_C + 1;

        //Registro C105
        //D�vida se vai ou n�o gerar aqui

        { Gera registros espec�ficos para notas emitidas por terceiros }
        //D�vida
        //if IND_EMIT = edTerceiros then //tirei esse IF 17/03/2014
        //begin
          //With RegistroC110New do
          begin
            //Ver aqui
            //COD_INF   := '000001';
            //TXT_COMPL := '';
            //vContador_Reg_C := vContador_Reg_C + 1;

            fDMSPEDFiscal.cdsNotaFiscal_Ref.Close;
            fDMSPEDFiscal.sdsNotaFiscal_Ref.ParamByName('ID').AsInteger := fDMSPEDFiscal.cdsNotaFiscalID.AsInteger;
            fDMSPEDFiscal.cdsNotaFiscal_Ref.Open;
            while not fDMSPEDFiscal.cdsNotaFiscal_Ref.Eof do
            begin
              if (fDMSPEDFiscal.cdsNotaFiscal_RefTIPO.AsString = '13') or
                 (fDMSPEDFiscal.cdsNotaFiscal_RefTIPO.AsString = '14') or
                 (fDMSPEDFiscal.cdsNotaFiscal_RefTIPO.AsString = '20a') then
              begin
                With RegistroC110New do
                  begin
                    COD_INF   := '000001';
                    TXT_COMPL := '';
                    vContador_Reg_C := vContador_Reg_C + 1;
                    with RegistroC113New do
                    begin
                      IND_OPER := tpEntradaAquisicao;
                      IND_EMIT := edTerceiros;
                      if fDMSPEDFiscal.cdsNotaFiscal_RefTIPO.AsString = '13' then
                      begin
                        COD_PART := fDMSPEDFiscal.cdsNotaFiscal_RefCOD_PESSOA.AsString;
                        COD_MOD  := '55';
                        SER      := fDMSPEDFiscal.cdsNotaFiscal_RefSERIE_NFE.AsString;
                        SUB      := '';
                        NUM_DOC  := fDMSPEDFiscal.cdsNotaFiscal_RefNUMNOTA_NFE.AsString;
                        DT_DOC   := fDMSPEDFiscal.cdsNotaFiscal_RefDTEMISSAO_NFE.AsDateTime;
                      end
                      else
                      begin
                        COD_PART := fDMSPEDFiscal.cdsNotaFiscal_RefID_CLIENTE.AsString;
                        COD_MOD  := fDMSPEDFiscal.cdsNotaFiscal_RefMODELO_REF.AsString;
                        SER      := fDMSPEDFiscal.cdsNotaFiscal_RefSERIE_REF.AsString;
                        SUB      := '';
                        NUM_DOC  := fDMSPEDFiscal.cdsNotaFiscal_RefNUMNOTA_REF.AsString;
                        //DT_DOC   :=
                      end;
                      vContador_Reg_C := vContador_Reg_C + 1;
                    end;
                  end;
              end;
              fDMSPEDFiscal.cdsNotaFiscal_Ref.Next;
            end;
          end;
        //end;
        //Local da Coleta e/ou Entrega
        {if (fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString <> 'S') and (fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString <> 'S') then
        begin
          fDMSPEDFiscal.qPessoa.Close;
          fDMSPEDFiscal.qPessoa.ParamByName('CODIGO').AsInteger := fDMSPEDFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
          fDMSPEDFiscal.qPessoa.Open;
          if trim(fDMSPEDFiscal.qPessoaENDERECO_ENT.AsString) <> '' then
          begin
            With RegistroC110New do
            begin
              COD_INF   := '000001';
              TXT_COMPL := '';
              vContador_Reg_C := vContador_Reg_C + 1;
              with RegistroC115New do
              begin
                IND_CARGA   := ttRodoviario;
                CNPJ_COL    := '';
                IE_COL      := '';
                CPF_COL     := '';
                COD_MUN_COL := '';
                if fDMSPEDFiscal.qPessoaPESSOA_ENT.AsString = 'J' then
                  CNPJ_ENTG := Monta_Numero(fDMSPEDFiscal.qPessoaCNPJ_CPF.AsString,14)
                else
                if fDMSPEDFiscal.qPessoaPESSOA_ENT.AsString = 'F' then
                  CPF_COL   := Monta_Numero(fDMSPEDFiscal.qPessoaCNPJ_CPF.AsString,11);
                IE_ENTG      := fDMSPEDFiscal.qPessoaINSC_EST_ENT.AsString;
                COD_MUN_ENTG := fDMSPEDFiscal.qPessoaCODMUNICIPIO_ENT.AsString;
                vContador_Reg_C := vContador_Reg_C + 1;
              end;
            end;
          end;
        end;}

        { Gera o registro de importa��o apenas para notas de entrada }
        {if IND_OPER = tpEntradaAquisicao then
        begin
          with RegistroC120New do
          begin
            COD_DOC_IMP := diSimplificadaImport;
            NUM_DOC__IMP := '1024879531';
            PIS_IMP := 0.00;
            COFINS_IMP := 0.00;
            NUM_ACDRAW := '';
          end;
        end;}

        { Gera registros espec�ficos para notas emitidas por terceiros e de presta��o }
        //aqui
        {if (IND_EMIT = edTerceiros) and (IND_OPER = tpSaidaPrestacao) then
        begin
          with RegistroC130New do
          begin
            VL_SERV_NT := 10.12;
            VL_BC_ISSQN := 10.12;
            VL_ISSQN := 10.12;
            VL_BC_IRRF := 10.12;
            VL_IRRF := 10.12;
            VL_BC_PREV := 10.12;
            VL_PREV := 10.12;
          end;
        end;}
        //Ler as parcelas aqui
        if fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '01' then
        begin
          fDMSPEDFiscal.cdsNotaFiscal_Parc.Close;
          fDMSPEDFiscal.sdsNotaFiscal_Parc.ParamByName('ID').AsInteger := fDMSPEDFiscal.cdsNotaFiscalID.AsInteger;
          fDMSPEDFiscal.cdsNotaFiscal_Parc.Open;
          with RegistroC140New do
          begin
            if fDMSPEDFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE' then
              IND_EMIT := edTerceiros
            else
            if fDMSPEDFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS' then
              IND_EMIT := edEmissaoPropria;
            IND_TIT := tcDuplicata;
            DESC_TIT := '';
            NUM_TIT  := fDMSPEDFiscal.cdsNotaFiscalNUMNOTA.AsString;
            QTD_PARC := fDMSPEDFiscal.cdsNotaFiscal_Parc.RecordCount;
            VL_TIT   := fDMSPEDFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat;
            vContador_Reg_C := vContador_Reg_C + 1;
            //C141
            fDMSPEDFiscal.cdsNotaFiscal_Parc.First;
            while not fDMSPEDFiscal.cdsNotaFiscal_Parc.Eof do
            begin
              with RegistroC141New do
              begin
                NUM_PARC := fDMSPEDFiscal.cdsNotaFiscal_ParcITEM.AsString;
                DT_VCTO  := fDMSPEDFiscal.cdsNotaFiscal_ParcDTVENCIMENTO.AsDateTime;
                VL_PARC  := fDMSPEDFiscal.cdsNotaFiscal_ParcVLR_VENCIMENTO.AsFloat;
                vContador_Reg_C := vContador_Reg_C + 1;
              end;
              fDMSPEDFiscal.cdsNotaFiscal_Parc.Next;
            end;
          end;
        end;

        // REGISTRO C170: ITENS DO DOCUMENTO (C�DIGO 01, 1B, 04 e 55).
        //if fDMSPEDFiscal.cdsNotaFiscalNUMNOTA.AsInteger = 15330 then
        //  ShowMessage('aqui');
        fDMSPEDFiscal.cdsNotaFiscal_Itens.Close;
        fDMSPEDFiscal.sdsNotaFiscal_Itens.ParamByName('ID').AsInteger := fDMSPEDFiscal.cdsNotaFiscalID.AsInteger;
        fDMSPEDFiscal.cdsNotaFiscal_Itens.Open;
        fDMSPEDFiscal.cdsNotaFiscal_Itens.First;
        while not fDMSPEDFiscal.cdsNotaFiscal_Itens.Eof do
        begin
          with RegistroC170New do // Inicio Adicionar os Itens:
          begin
            NUM_ITEM := FormatFloat('000',fDMSPEDFiscal.cdsNotaFiscal_ItensITEM.AsInteger);
            if fDMSPEDFiscal.qParametrosIMP_NFE_REF_PROD.AsString = 'R' then
              COD_ITEM := fDMSPEDFiscal.cdsNotaFiscal_ItensREFERENCIA.AsString
            else
              COD_ITEM := fDMSPEDFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsString;
            if trim(fDMSPEDFiscal.cdsNotaFiscal_ItensTAMANHO.AsString) <> '' then
              COD_ITEM := COD_ITEM + 'T' + fDMSPEDFiscal.cdsNotaFiscal_ItensTAMANHO.AsString;
            DESCR_COMPL := fDMSPEDFiscal.cdsNotaFiscal_ItensOBS_COMPLEMENTAR.AsString;
            QTD := fDMSPEDFiscal.cdsNotaFiscal_ItensQTD.AsFloat;
            UNID := fDMSPEDFiscal.cdsNotaFiscal_ItensUNIDADE.AsString;
            VL_ITEM := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat;
            VL_DESC := (fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_DESCONTORATEIO.AsFloat);
            if fDMSPEDFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString = 'S' then
              IND_MOV := mfSim
            else
              IND_MOV := mfNao;
            CST_ICMS := fDMSPEDFiscal.cdsNotaFiscal_ItensCST_ICMS.AsString;
            CFOP     := fDMSPEDFiscal.cdsNotaFiscal_ItensCODCFOP.AsString;
            COD_NAT := fDMSPEDFiscal.cdsNotaFiscal_ItensCODCFOP.AsString;
            if StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMSSIMPLES.AsFloat)) > 0 then
              VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMSSIMPLES.AsFloat
            else
              VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMS.AsFloat;
            if StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsNotaFiscalPERC_ICMSSIMPLES.AsFloat)) > 0 then
              ALIQ_ICMS := fDMSPEDFiscal.cdsNotaFiscalPERC_ICMSSIMPLES.AsFloat
            else
              ALIQ_ICMS := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat;
            if StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMSSIMPLES.AsFloat)) > 0 then
              VL_ICMS := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMSSIMPLES.AsFloat
            else
              VL_ICMS := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMS.AsFloat;
            VL_BC_ICMS_ST := fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMSSUBST.AsFloat;
            ALIQ_ST       := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_MVA.AsFloat;
            VL_ICMS_ST    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMSSUBST.AsFloat;
            IND_APUR      := iaMensal;
            CST_IPI       := ipiEntradaIsenta;
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '00' then CST_IPI := ipiEntradaRecuperacaoCredito
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '01' then CST_IPI := ipiEntradaTributradaZero
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '02' then CST_IPI := ipiEntradaIsenta
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '03' then CST_IPI := ipiEntradaNaoTributada
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '04' then CST_IPI := ipiEntradaImune
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '05' then CST_IPI := ipiEntradaComSuspensao
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '49' then CST_IPI := ipiOutrasEntradas
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '50' then CST_IPI := ipiSaidaTributada
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '51' then CST_IPI := ipiSaidaTributadaZero
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '52' then CST_IPI := ipiSaidaIsenta
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '53' then CST_IPI := ipiSaidaNaoTributada
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '54' then CST_IPI := ipiSaidaImune
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '55' then CST_IPI := ipiSaidaComSuspensao
            else
            if fDMSPEDFiscal.cdsNotaFiscal_ItensCST_IPI.AsString = '99' then CST_IPI := ipiOutrasSaidas;
            COD_ENQ   := '';
            VL_BC_IPI := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat;
            ALIQ_IPI  := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat;
            VL_IPI    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_IPI.AsFloat;
            //CST_PIS := pisOutrasOperacoes;
            CST_PIS := fDMSPEDFiscal.cdsNotaFiscal_ItensCST_PIS.AsString;
            if StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_PIS.AsFloat)) > 0 then
            begin
              VL_BC_PIS     := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat;
              ALIQ_PIS_PERC := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat;
              QUANT_BC_PIS  := fDMSPEDFiscal.cdsNotaFiscal_ItensQTD.AsFloat;
              ALIQ_PIS_R    := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat;
              VL_PIS        := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_PIS.AsFloat;
            end;
            //CST_COFINS := cofinsOutrasOperacoes;
            CST_COFINS := fDMSPEDFiscal.cdsNotaFiscal_ItensCST_COFINS.AsString;
            if StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_COFINS.AsFloat)) > 0 then
            begin
              VL_BC_COFINS     := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat;
              ALIQ_COFINS_PERC := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat;
              QUANT_BC_COFINS  := fDMSPEDFiscal.cdsNotaFiscal_ItensQTD.AsFloat;
              ALIQ_COFINS_R    := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat;
              VL_COFINS        := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat;
            end;
            COD_CTA := '';
            vContador_Reg_C := vContador_Reg_C + 1;

            //REGISTRO C178
            //Ver este registro
              {with RegistroC178New do
              begin
                CL_ENQ    := fDMSPEDFiscal.cdsNotaFiscal_ItensCOD_ENQIPI.AsString;
                VL_UNID   := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat;
                QUANT_PAD := fDMSPEDFiscal.cdsNotaFiscal_ItensQTD.AsFloat;
                vContador_Reg_C := vContador_Reg_C + 1;
              end;}
          end;

          //Gravar a tabela auxiliar do registro C190
          prc_Gravar_mC190;

          fDMSPEDFiscal.cdsNotaFiscal_Itens.Next;
        end;

        // REGISTRO C190: REGISTRO ANAL�TICO DO DOCUMENTO (C�DIGO 01, 1B, 04 E 55).
        fDMSPEDFiscal.mC190.First;
        while not fDMSPEDFiscal.mC190.Eof do
        begin
          with RegistroC190New do
          begin
            CST_ICMS      := fDMSPEDFiscal.mC190CST_ICMS.AsString;
            CFOP          := fDMSPEDFiscal.mC190Cod_CFOP.AsString;
            ALIQ_ICMS     := fDMSPEDFiscal.mC190Perc_ICMS.AsFloat;
            VL_OPR        := fDMSPEDFiscal.mC190Vlr_Operacao.AsFloat;
            VL_BC_ICMS    := fDMSPEDFiscal.mC190Vlr_Base_ICMS.AsFloat;
            VL_ICMS       := fDMSPEDFiscal.mC190Vlr_ICMS.AsFloat;
            VL_BC_ICMS_ST := fDMSPEDFiscal.mC190Vlr_Base_ICMS_ST.AsFloat;
            VL_ICMS_ST    := fDMSPEDFiscal.mC190Vlr_ICMS_ST.AsFloat;
            VL_RED_BC     := fDMSPEDFiscal.mC190Vlr_Reducao_ICMS.AsFloat;
            VL_IPI        := fDMSPEDFiscal.mC190Vlr_IPI.AsFloat;
            COD_OBS       := fDMSPEDFiscal.mC190Cod_OBS.AsString;
            vContador_Reg_C := vContador_Reg_C + 1;
          end;
          fDMSPEDFiscal.mC190.Next;
        end;
        {with RegistroC195 do
        begin
          //fazer aqui
        end;
        with RegistroC197New do
        begin
          //fazer aqui
        end;}
      end;
    end;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_C_Reg_C100_Inutilizadas;
var
  i : Integer;
begin
  //Le as notas inutilizadas para gravar o registro C100
  fDMSPEDFiscal.cdsNFe_Inutilizadas.First;
  while not fDMSPEDFiscal.cdsNFe_Inutilizadas.Eof do
  begin
    i := fDMSPEDFiscal.cdsNFe_InutilizadasNUMNOTA_INI.AsInteger;
    while i <= fDMSPEDFiscal.cdsNFe_InutilizadasNUMNOTA_FIN.AsInteger do
    begin
      with ACBrSPEDFiscal1.Bloco_C do
      begin
        with RegistroC001New do
        begin
          with RegistroC100New do
          begin
            IND_OPER := tpSaidaPrestacao;
            IND_EMIT := edEmissaoPropria;
            COD_MOD  := fDMSPEDFiscal.cdsNFe_InutilizadasMODELO.AsString;
            COD_SIT  := sdDoctoNumInutilizada;
            SER      := fDMSPEDFiscal.cdsNFe_InutilizadasSERIE.AsString;
            NUM_DOC  := IntToStr(i);
            vContador_Reg_C := vContador_Reg_C + 1;
          end;
        end;
      end;
      i := i + 1;
    end;
    fDMSPEDFiscal.cdsNFe_Inutilizadas.Next;
  end;
  //*****************************
end;

procedure TfrmSPEDFiscal.prc_Bloco_C_Reg_C500;
begin
  with ACBrSPEDFiscal1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      with RegistroC500New do
      begin
        if fDMSPEDFiscal.cdsNotaFiscalTIPO_NOTA.AsString = 'E' then
          IND_OPER := tpEntradaAquisicao
        else
          IND_OPER := tpSaidaPrestacao;
        if fDMSPEDFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE' then
          IND_EMIT := edTerceiros
        else
          IND_EMIT := edEmissaoPropria;
        COD_PART := fDMSPEDFiscal.cdsNotaFiscalID_CLIENTE.AsString;
        COD_MOD  := fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString;
        if fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString = 'S' then
          COD_SIT  := sdCancelado
        else
        if fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString = 'S' then
          COD_SIT  := sdDoctoDenegado
        else
        if fDMSPEDFiscal.cdsNotaFiscalNFEFINALIDADE.AsString = '2' then
          COD_SIT  := sdFiscalCompl
        else
          COD_SIT  := sdRegular;
        SER     := fDMSPEDFiscal.cdsNotaFiscalSERIE.AsString;
        SUB     := '';
        NUM_DOC := fDMSPEDFiscal.cdsNotaFiscalNUMNOTA.AsString;
        DT_DOC := fDMSPEDFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime;
        if fDMSPEDFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime > 10 then
          DT_E_S := fDMSPEDFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime;
        if (fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString <> 'S') and (fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString <> 'S') then
        begin
          VL_DOC     := fDMSPEDFiscal.cdsNotaFiscalVLR_NOTA.AsFloat;
          VL_DESC    := fDMSPEDFiscal.cdsNotaFiscalVLR_DESCONTO.AsFloat;
          VL_FORN    := fDMSPEDFiscal.cdsNotaFiscalVLR_NOTA.AsFloat;
          VL_SERV_NT := 0;
          VL_TERC    := 0;
          VL_DA      := 0;
          VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscalBASE_ICMS.AsFloat;
          VL_ICMS    := fDMSPEDFiscal.cdsNotaFiscalVLR_ICMS.AsFloat;
          VL_BC_ICMS_ST := fDMSPEDFiscal.cdsNotaFiscalBASE_ICMSSUBST.AsFloat;
          VL_ICMS_ST    := fDMSPEDFiscal.cdsNotaFiscalVLR_ICMSSUBST.AsFloat;
          COD_INF       := '';//tratar esse campo 0450
          VL_PIS        := fDMSPEDFiscal.cdsNotaFiscalVLR_PIS.AsFloat;
          VL_COFINS     := fDMSPEDFiscal.cdsNotaFiscalVLR_COFINS.AsFloat;
          TP_LIGACAO    := tlTrifasico;
          COD_GRUPO_TENSAO := gtA1;
        end;
        vContador_Reg_C := vContador_Reg_C + 1;
        if (fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString <> 'S') and (fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString <> 'S') then
        begin
          fDMSPEDFiscal.cdsNotaFiscal_Itens.Close;
          fDMSPEDFiscal.sdsNotaFiscal_Itens.ParamByName('ID').AsInteger := fDMSPEDFiscal.cdsNotaFiscalID.AsInteger;
          fDMSPEDFiscal.cdsNotaFiscal_Itens.Open;
          fDMSPEDFiscal.cdsNotaFiscal_Itens.First;
          while not fDMSPEDFiscal.cdsNotaFiscal_Itens.Eof do
          begin
            with RegistroC510New do
            begin
              NUM_ITEM   := fDMSPEDFiscal.cdsNotaFiscal_ItensITEM.AsString;
              if fDMSPEDFiscal.qParametrosIMP_NFE_REF_PROD.AsString = 'R' then
                COD_ITEM   := fDMSPEDFiscal.cdsNotaFiscal_ItensREFERENCIA.AsString
              else
                COD_ITEM   := fDMSPEDFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsString;
              COD_CLASS  := '';//Ver aqui
              QTD        := fDMSPEDFiscal.cdsNotaFiscal_ItensQTD.AsFloat;
              UNID       := fDMSPEDFiscal.cdsNotaFiscal_ItensUNIDADE.AsString;
              VL_ITEM    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat;
              VL_DESC    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_DESCONTORATEIO.AsFloat;
              CST_ICMS   := fDMSPEDFiscal.cdsNotaFiscal_ItensCST_ICMS.AsString;
              CFOP       := fDMSPEDFiscal.cdsNotaFiscal_ItensCODCFOP.AsString;
              VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMS.AsFloat;
              ALIQ_ICMS  := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat;
              VL_ICMS    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMS.AsFloat;
              VL_BC_ICMS_ST := fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMSSUBST.AsFloat;
              ALIQ_ST       := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_MVA.AsFloat;
              VL_ICMS_ST    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMSSUBST.AsFloat;
              IND_REC       := trPropria;
              COD_PART      := fDMSPEDFiscal.cdsNotaFiscalID_CLIENTE.AsString;
              VL_PIS        := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_PIS.AsFloat;
              VL_COFINS     := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_COFINS.AsFloat;
              COD_CTA       := '';
              vContador_Reg_C := vContador_Reg_C + 1;
            end;
            prc_Gravar_mC190;
            fDMSPEDFiscal.cdsNotaFiscal_Itens.Next;
          end;
        end;
        //C590
        fDMSPEDFiscal.mC190.First;
        while not fDMSPEDFiscal.mC190.Eof do
        begin
          with RegistroC590New do
          begin
            CST_ICMS      := fDMSPEDFiscal.mC190CST_ICMS.AsString;
            CFOP          := fDMSPEDFiscal.mC190Cod_CFOP.AsString;
            ALIQ_ICMS     := fDMSPEDFiscal.mC190Perc_ICMS.AsFloat;
            VL_OPR        := fDMSPEDFiscal.mC190Vlr_Operacao.AsFloat;
            VL_BC_ICMS    := fDMSPEDFiscal.mC190Vlr_Base_ICMS.AsFloat;
            VL_ICMS       := fDMSPEDFiscal.mC190Vlr_ICMS.AsFloat;
            VL_BC_ICMS_ST := fDMSPEDFiscal.mC190Vlr_Base_ICMS_ST.AsFloat;
            VL_ICMS_ST    := fDMSPEDFiscal.mC190Vlr_ICMS_ST.AsFloat;
            VL_RED_BC     := fDMSPEDFiscal.mC190Vlr_Reducao_ICMS.AsFloat;
            COD_OBS       := ''; //Ver aqui 0450
            vContador_Reg_C := vContador_Reg_C + 1;
          end;
          fDMSPEDFiscal.mC190.Next;
        end;
        //Final da C590
      end;
    end;
  end;
end;

procedure TfrmSPEDFiscal.prc_Gravar_mC190;
var
  vAux_Aliq : Real;
  vAux : Real;
begin
  try
  vAux_Aliq := StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat));
  if fDMSPEDFiscal.mC190.FindKey([StrToFloat(FormatFloat('0',fDMSPEDFiscal.cdsNotaFiscal_ItensCST_ICMS.AsInteger)),fDMSPEDFiscal.cdsNotaFiscal_ItensCODCFOP.AsInteger,vAux_Aliq]) then
    fDMSPEDFiscal.mC190.Edit
  else
  begin
    fDMSPEDFiscal.mC190.Insert;
    fDMSPEDFiscal.mC190CST_ICMS.AsInteger := fDMSPEDFiscal.cdsNotaFiscal_ItensCST_ICMS.AsInteger;
    fDMSPEDFiscal.mC190Cod_CFOP.AsInteger := fDMSPEDFiscal.cdsNotaFiscal_ItensCODCFOP.AsInteger;
    fDMSPEDFiscal.mC190Perc_ICMS.AsFloat  := StrToFloat(FormatFloat('0.000',vAux_Aliq));
  end;
  fDMSPEDFiscal.mC190Vlr_Operacao.AsFloat := fDMSPEDFiscal.mC190Vlr_Operacao.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat
                                           + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_FRETE.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_SEGURO.AsFloat
                                           + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_OUTRASDESPESAS.AsFloat
                                           + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMSSUBST.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_IPI.AsFloat;
  fDMSPEDFiscal.mC190Vlr_Base_ICMS.AsFloat := fDMSPEDFiscal.mC190Vlr_Base_ICMS.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMS.AsFloat
                                            + fDMSPEDFiscal.cdsNotaFiscalBASE_ICMSSIMPLES.AsFloat;
  fDMSPEDFiscal.mC190Vlr_ICMS.AsFloat      := fDMSPEDFiscal.mC190Vlr_ICMS.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMS.AsFloat
                                            + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMSSIMPLES.AsFloat;
  fDMSPEDFiscal.mC190Vlr_Base_ICMS_ST.AsFloat := fDMSPEDFiscal.mC190Vlr_Base_ICMS_ST.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMSSUBST.AsFloat;
  fDMSPEDFiscal.mC190Vlr_ICMS_ST.AsFloat      := fDMSPEDFiscal.mC190Vlr_ICMS_ST.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMSSUBST.AsFloat;
  if (StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat)) < 100) and
     (StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat)) > 0) then
  begin
    vAux := StrToFloat(FormatFloat('0.0000',100 - fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat));
    vAux := StrToFloat(FormatFloat('0.00',((fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat * vAux) * fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat) / 100));
    fDMSPEDFiscal.mC190Vlr_Reducao_ICMS.AsFloat := StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.mC190Vlr_Reducao_ICMS.AsFloat + vAux));
  end;
  fDMSPEDFiscal.mC190Vlr_IPI.AsFloat          := fDMSPEDFiscal.mC190Vlr_IPI.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_IPI.AsFloat;
  fDMSPEDFiscal.mC190Cod_OBS.AsString         := '';
  fDMSPEDFiscal.mC190.Post;
  except
      on E: exception do
      begin
        raise Exception.Create('erro c190 ' + E.Message + #13 + ' N� Nota: ' + fDMSPEDFiscal.cdsNotaFiscalNUMNOTA.AsString + #13 +
                               'Classe: ' + E.ClassName + #13)
      end;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_C_Reg_C990;
begin
  vContador_Reg_C := vContador_Reg_C + 1;
  ACBrSPEDFiscal1.Bloco_C.RegistroC990.QTD_LIN_C := vContador_Reg_C;
end;

procedure TfrmSPEDFiscal.btnGravar_TxtClick(Sender: TObject);
var
  vArq : String;
begin
  ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);
  ACBrSPEDFiscal1.Path         := DirectoryEdit1.Text;
  vArq := 'SPED_Fiscal_' + FormatFloat('0000',YearOf(DateEdit3.Date)) + FormatFloat('00',MonthOf(DateEdit3.Date)) + '.txt';
  edtFile.Text := vArq;
  ACBrSPEDFiscal1.Arquivo      := edtFile.Text;

  ACBrSPEDFiscal1.SaveFileTXT;
  LoadToMemo;
end;

procedure TfrmSPEDFiscal.btnBloco_DClick(Sender: TObject);
begin
  if not fnc_Valida_Campos then
    exit;
  if MessageDlg('Deseja gerar o <Bloco D>?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Gerar_Bloco_D;
end;

procedure TfrmSPEDFiscal.prc_Gerar_Bloco_D;
begin
  vContador_Reg_C := 0;
  prc_Abrir_NotaFiscal('D');

  //Abertura do Bloco C
  with ACBrSPEDFiscal1.Bloco_D do
  begin
    with RegistroD001New do
    begin
      IND_MOV := imComDados;
      vContador_Reg_D := vContador_Reg_D + 1;
    end;
  end;

  fDMSPEDFiscal.cdsNotaFiscal.First;
  while not fDMSPEDFiscal.cdsNotaFiscal.Eof do
  begin
    fDMSPEDFiscal.mC190.EmptyDataSet;
    if (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '07') or (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '08') or
        (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '8B') or (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '09') or
        (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '10') or (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '11') or
        (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '26') or (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '27') or
        (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '57') then
      prc_Bloco_D_Reg_D100
    else
    if (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '21') or (fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString = '22') then
      prc_Bloco_D_Reg_D500;
    fDMSPEDFiscal.cdsNotaFiscal.Next;
  end;

  prc_Bloco_D_Reg_D990;
end;

procedure TfrmSPEDFiscal.prc_Abrir_NotaFiscal(Bloco: String);
begin
  fDMSPEDFiscal.cdsNotaFiscal.Close;
  fDMSPEDFiscal.sdsNotaFiscal.CommandText := fDMSPEDFiscal.ctNotaFiscal;
                            // + ' AND (((N.DTEMISSAO BETWEEN ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                            // + '    AND  ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date)) + ') AND (N.TIPO_REG = ' + QuotedStr('NTS') + '))'
                            // + '     OR (( N.DTSAIDAENTRADA BETWEEN ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                            // + '    AND  ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date)) + ') AND (N.TIPO_REG = ' + QuotedStr('NTE') + ')))'
                            // + ' AND N.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  fDMSPEDFiscal.sdsNotaFiscal.ParamByName('DT_INICIAL').AsDate := DateEdit1.Date;
  fDMSPEDFiscal.sdsNotaFiscal.ParamByName('DT_FINAL').AsDate   := DateEdit2.Date;
  fDMSPEDFiscal.sdsNotaFiscal.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;

  {if Bloco = 'C' then
    fDMSPEDFiscal.sdsNotaFiscal.CommandText := fDMSPEDFiscal.sdsNotaFiscal.CommandText
                                             + ' AND ((N.COD_MODELO = ' + QuotedStr('06') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('29') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('28') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('01') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('1B') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('04') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('55') + '))';}
  if Bloco = 'D' then
    fDMSPEDFiscal.sdsNotaFiscal.CommandText := fDMSPEDFiscal.sdsNotaFiscal.CommandText
                                             + ' AND ((N.COD_MODELO = ' + QuotedStr('07') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('08') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('8B') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('09') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('10') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('11') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('26') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('27') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('57') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('21') + ')'
                                             + ' OR   (N.COD_MODELO = ' + QuotedStr('22') + '))';
  fDMSPEDFiscal.cdsNotaFiscal.Open;
end;

procedure TfrmSPEDFiscal.prc_Bloco_D_Reg_D100;
var
  i : Integer;
  vAux_Aliq : Real;
begin
  with ACBrSPEDFiscal1.Bloco_D do
  begin
    with RegistroD001New do
    begin
      with RegistroD100New do
      begin
        if fDMSPEDFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE' then
          IND_OPER := tpEntradaAquisicao
        else
          IND_OPER := tpSaidaPrestacao;
        if fDMSPEDFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE' then
          IND_EMIT := edTerceiros
        else
          IND_EMIT := edEmissaoPropria;
        COD_PART := fDMSPEDFiscal.cdsNotaFiscalID_CLIENTE.AsString;
        COD_MOD  := fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString;
        if fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString = 'S' then
          COD_SIT  := sdCancelado
        else
        if fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString = 'S' then
          COD_SIT  := sdDoctoDenegado
        else
        if fDMSPEDFiscal.cdsNotaFiscalNFEFINALIDADE.AsString = '2' then
          COD_SIT  := sdFiscalCompl
        else
          COD_SIT  := sdRegular;
        SER     := fDMSPEDFiscal.cdsNotaFiscalSERIE.AsString;
        SUB     := '';
        NUM_DOC := fDMSPEDFiscal.cdsNotaFiscalNUMNOTA.AsString;
        CHV_CTE := fDMSPEDFiscal.cdsNotaFiscalNFECHAVEACESSO.AsString;
        DT_DOC := fDMSPEDFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime;
        DT_A_P := fDMSPEDFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime;
        TP_CT_e := '';
        CHV_CTE_REF := '';
        if (fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString <> 'S') and (fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString <> 'S') then
        begin
          VL_DOC := fDMSPEDFiscal.cdsNotaFiscalVLR_NOTA.AsFloat;
          VL_DESC    := fDMSPEDFiscal.cdsNotaFiscalVLR_DESCONTO.AsFloat;
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_FRETE.AsString = '1' then
            IND_FRT := tfPorContaEmitente
          else
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_FRETE.AsString = '2' then
            IND_FRT := tfPorContaDestinatario
          else
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_FRETE.AsString = '3' then
            IND_FRT := tfPorContaTerceiros
          else
          if fDMSPEDFiscal.cdsNotaFiscalTIPO_FRETE.AsString = '9' then
            IND_FRT := tfSemCobrancaFrete;
          VL_SERV   := fDMSPEDFiscal.cdsNotaFiscalVLR_ITENS.AsFloat;
          VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscalBASE_ICMS.AsFloat;
          VL_ICMS    := fDMSPEDFiscal.cdsNotaFiscalVLR_ICMS.AsFloat;
          VL_NT      := fDMSPEDFiscal.cdsNotaFiscalVLR_NOTA.AsFloat - fDMSPEDFiscal.cdsNotaFiscalBASE_ICMS.AsFloat;
          COD_INF    := ''; //mesmo do 0450 e 0460
          COD_CTA    := '';
        end;
        vContador_Reg_D := vContador_Reg_D + 1;

        fDMSPEDFiscal.cdsNotaFiscal_Itens.Close;
        fDMSPEDFiscal.sdsNotaFiscal_Itens.ParamByName('ID').AsInteger := fDMSPEDFiscal.cdsNotaFiscalID.AsInteger;
        fDMSPEDFiscal.cdsNotaFiscal_Itens.Open;
        fDMSPEDFiscal.cdsNotaFiscal_Itens.First;
        while not fDMSPEDFiscal.cdsNotaFiscal_Itens.Eof do
        begin
          //Gravar a tabela auxiliar do registro C190
          prc_Gravar_mC190;
          fDMSPEDFiscal.cdsNotaFiscal_Itens.Next;
        end;

        // REGISTRO C190: REGISTRO ANAL�TICO DO DOCUMENTO (C�DIGO 07, 08, 8B, 09, 10, 11, 26, 27 e 57)
        fDMSPEDFiscal.mC190.First;
        while not fDMSPEDFiscal.mC190.Eof do
        begin
          with RegistroD190New do
          begin
            CST_ICMS        := fDMSPEDFiscal.mC190CST_ICMS.AsString;
            CFOP            := fDMSPEDFiscal.mC190Cod_CFOP.AsString;
            ALIQ_ICMS       := fDMSPEDFiscal.mC190Perc_ICMS.AsFloat;
            VL_OPR          := fDMSPEDFiscal.mC190Vlr_Operacao.AsFloat;
            VL_BC_ICMS      := fDMSPEDFiscal.mC190Vlr_Base_ICMS.AsFloat;
            VL_ICMS         := fDMSPEDFiscal.mC190Vlr_ICMS.AsFloat;
            VL_RED_BC       := fDMSPEDFiscal.mC190Vlr_Reducao_ICMS.AsFloat;
            COD_OBS         := fDMSPEDFiscal.mC190Cod_OBS.AsString;
            vContador_Reg_D := vContador_Reg_D + 1;
          end;
          fDMSPEDFiscal.mC190.Next;
        end;
        {with RegistroD195 do
        begin
          //fazer aqui
        end;
        with RegistroD197New do
        begin
          //fazer aqui
        end;}
      end;
    end;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_D_Reg_D500;
begin
  with ACBrSPEDFiscal1.Bloco_D do
  begin
    with RegistroD001New do
    begin
      with RegistroD500New do
      begin
        if fDMSPEDFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE' then
          IND_OPER := tpEntradaAquisicao
        else
          IND_OPER := tpSaidaPrestacao;
        if fDMSPEDFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE' then
          IND_EMIT := edTerceiros
        else
          IND_EMIT := edEmissaoPropria;
        COD_PART := fDMSPEDFiscal.cdsNotaFiscalID_CLIENTE.AsString;
        COD_MOD  := fDMSPEDFiscal.cdsNotaFiscalCOD_MODELO.AsString;
        if fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString = 'S' then
          COD_SIT  := sdCancelado
        else
        if fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString = 'S' then
          COD_SIT  := sdDoctoDenegado
        else
        if fDMSPEDFiscal.cdsNotaFiscalNFEFINALIDADE.AsString = '2' then
          COD_SIT  := sdFiscalCompl
        else
          COD_SIT  := sdRegular;
        SER     := fDMSPEDFiscal.cdsNotaFiscalSERIE.AsString;
        SUB     := '';
        NUM_DOC := fDMSPEDFiscal.cdsNotaFiscalNUMNOTA.AsString;
        DT_DOC := fDMSPEDFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime;
        if fDMSPEDFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime > 10 then
          DT_A_P := fDMSPEDFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime;
        if (fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString <> 'S') and (fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString <> 'S') then
        begin
          VL_DOC     := fDMSPEDFiscal.cdsNotaFiscalVLR_NOTA.AsFloat;
          VL_DESC    := fDMSPEDFiscal.cdsNotaFiscalVLR_DESCONTO.AsFloat;
          VL_SERV    := fDMSPEDFiscal.cdsNotaFiscalVLR_ITENS.AsFloat;
          VL_SERV_NT := StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsNotaFiscalVLR_NOTA.AsFloat - fDMSPEDFiscal.cdsNotaFiscalBASE_ICMS.AsFloat));
          VL_TERC    := 0;
          VL_DA      := fDMSPEDFiscal.cdsNotaFiscalVLR_OUTRASDESP.AsFloat;
          VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscalBASE_ICMS.AsFloat;
          VL_ICMS    := fDMSPEDFiscal.cdsNotaFiscalVLR_ICMS.AsFloat;
          COD_INF       := '';//tratar esse campo 0450
          VL_PIS        := fDMSPEDFiscal.cdsNotaFiscalVLR_PIS.AsFloat;
          VL_COFINS     := fDMSPEDFiscal.cdsNotaFiscalVLR_COFINS.AsFloat;
          COD_CTA       := '';
          TP_ASSINANTE  := assComercialIndustrial;
        end;
        vContador_Reg_D := vContador_Reg_D + 1;
        if (fDMSPEDFiscal.cdsNotaFiscalCANCELADA.AsString <> 'S') and (fDMSPEDFiscal.cdsNotaFiscalNFEDENEGADA.AsString <> 'S') then
        begin
          fDMSPEDFiscal.cdsNotaFiscal_Itens.Close;
          fDMSPEDFiscal.sdsNotaFiscal_Itens.ParamByName('ID').AsInteger := fDMSPEDFiscal.cdsNotaFiscalID.AsInteger;
          fDMSPEDFiscal.cdsNotaFiscal_Itens.Open;
          fDMSPEDFiscal.cdsNotaFiscal_Itens.First;
          while not fDMSPEDFiscal.cdsNotaFiscal_Itens.Eof do
          begin
            with RegistroD510New do
            begin
              NUM_ITEM   := fDMSPEDFiscal.cdsNotaFiscal_ItensITEM.AsString;
              if fDMSPEDFiscal.qParametrosIMP_NFE_REF_PROD.AsString = 'R' then
                COD_ITEM   := fDMSPEDFiscal.cdsNotaFiscal_ItensREFERENCIA.AsString
              else
                COD_ITEM   := fDMSPEDFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsString;
              COD_CLASS  := '';//Ver aqui
              QTD        := fDMSPEDFiscal.cdsNotaFiscal_ItensQTD.AsFloat;
              UNID       := fDMSPEDFiscal.cdsNotaFiscal_ItensUNIDADE.AsString;
              VL_ITEM    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat;
              VL_DESC    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat + fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_DESCONTORATEIO.AsFloat;
              CST_ICMS   := fDMSPEDFiscal.cdsNotaFiscal_ItensCST_ICMS.AsString;
              CFOP       := fDMSPEDFiscal.cdsNotaFiscal_ItensCODCFOP.AsString;
              VL_BC_ICMS := fDMSPEDFiscal.cdsNotaFiscal_ItensBASE_ICMS.AsFloat;
              ALIQ_ICMS  := fDMSPEDFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat;
              VL_ICMS    := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_ICMS.AsFloat;
              VL_BC_ICMS_UF := 0;
              VL_ICMS_UF    := 0;
              IND_REC       := recServicoPrePago;
              COD_PART      := fDMSPEDFiscal.cdsNotaFiscalID_CLIENTE.AsString;
              VL_PIS        := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_PIS.AsFloat;
              VL_COFINS     := fDMSPEDFiscal.cdsNotaFiscal_ItensVLR_COFINS.AsFloat;
              COD_CTA       := '';
              vContador_Reg_D := vContador_Reg_D + 1;
            end;
            prc_Gravar_mC190;
            fDMSPEDFiscal.cdsNotaFiscal_Itens.Next;
          end;
        end;
        //C590                                                 
        fDMSPEDFiscal.mC190.First;
        while not fDMSPEDFiscal.mC190.Eof do
        begin
          with RegistroD590New do
          begin
            CST_ICMS      := fDMSPEDFiscal.mC190CST_ICMS.AsString;
            CFOP          := fDMSPEDFiscal.mC190Cod_CFOP.AsString;
            ALIQ_ICMS     := fDMSPEDFiscal.mC190Perc_ICMS.AsFloat;
            VL_OPR        := fDMSPEDFiscal.mC190Vlr_Operacao.AsFloat;
            VL_BC_ICMS    := fDMSPEDFiscal.mC190Vlr_Base_ICMS.AsFloat;
            VL_ICMS       := fDMSPEDFiscal.mC190Vlr_ICMS.AsFloat;
            VL_BC_ICMS_UF := 0;
            VL_ICMS_UF    := 0;
            VL_RED_BC     := fDMSPEDFiscal.mC190Vlr_Reducao_ICMS.AsFloat;
            COD_OBS       := ''; //Ver aqui 0450
            vContador_Reg_D := vContador_Reg_D + 1;
          end;
          fDMSPEDFiscal.mC190.Next;
        end;
        //Final da D590
      end;
    end;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_D_Reg_D990;
begin
  vContador_Reg_D := vContador_Reg_D + 1;
  ACBrSPEDFiscal1.Bloco_D.RegistroD990.QTD_LIN_D := vContador_Reg_D;
end;

procedure TfrmSPEDFiscal.prc_Consultar_cdsBalanco;
var
  vQtdAux: Integer;
  vComando, vComandoAux : WideString;
  i : Integer;
begin
  vQtdAux     := 0;
  vComando    := fDMSPEDFiscal.ctBalanco;
  {vComandoAux := '';
  i:= Pos('GROUP',vComando);
  if i > 0 then
  begin
    vComandoAux := copy(vComando,i,Length(vComando)-i);
    delete(vComando,i,Length(vComando)-i);
  end;}
  case ComboBox3.ItemIndex of
    0 : vComando := vComando + ' AND TIPO_REG = ' + QuotedStr('P');
    1 : vComando := vComando + ' AND TIPO_REG = ' + QuotedStr('M');
    2 : vComando := vComando + ' AND TIPO_REG = ' + QuotedStr('C');
    3 : vComando := vComando + ' AND TIPO_REG = ' + QuotedStr('S');
  end;
  //vComando := vComando + vComandoAux;
  fDMSPEDFiscal.cdsBalanco.Close;
  fDMSPEDFiscal.sdsBalanco.CommandText := vComando;
  fDMSPEDFiscal.sdsBalanco.ParamByName('FILIAL').AsInteger   := RxDBLookupCombo1.KeyValue;
  fDMSPEDFiscal.sdsBalanco.ParamByName('DTMOVIMENTO').AsDate := DateEdit3.Date;
  {case ComboBox3.ItemIndex of
    0: fDMSPEDFiscal.sdsBalanco.ParamByName('TIPO_REG').AsString  := 'P';
    1: fDMSPEDFiscal.sdsBalanco.ParamByName('TIPO_REG').AsString  := 'M';
    2: fDMSPEDFiscal.sdsBalanco.ParamByName('TIPO_REG').AsString  := 'C';
    3: fDMSPEDFiscal.sdsBalanco.ParamByName('TIPO_REG').AsString  := 'S';
  end;}
  fDMSPEDFiscal.cdsBalanco.Open;
end;

procedure TfrmSPEDFiscal.btnBloco_HClick(Sender: TObject);
begin
  if btnGerar.Tag <> 1 then
  begin
    if not fnc_Valida_Campos('H') then
      exit;
    if (DateEdit3.Date > DateEdit2.Date) or (DateEdit3.Date < 10) then
    begin
      MessageDlg('*** Data do invent�rio inv�lida' , mtError, [mbOk], 0);
      exit;
    end;
    if MessageDlg('Deseja gerar o <Bloco H>?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
  end;
  prc_Gerar_Bloco_H;
end;

procedure TfrmSPEDFiscal.prc_Bloco_H_Reg_H005;
var
  vVlrEstoque : Real;
begin
  vVlrEstoque := 0;
  fDMSPEDFiscal.cdsBalanco.First;
  while not fDMSPEDFiscal.cdsBalanco.Eof do
  begin
    vVlrEstoque := StrToCurr(FormatCurr('0.00',vVlrEstoque + fDMSPEDFiscal.cdsBalancoclVlr_Total.AsFloat));
    fDMSPEDFiscal.cdsBalanco.Next;
  end;

  with ACBrSPEDFiscal1.Bloco_H do
  begin
    with RegistroH005New do
    begin
        DT_INV := DT_FIN; //o valor informado no campo deve ser menor ou igual ao valor no campo DT_FIN do registro 0000
        VL_INV := StrToCurr(FormatCurr('0.00',vVlrEstoque));
    end;
    vContador_Reg_H := vContador_Reg_H + 1;
  end;
end;

procedure TfrmSPEDFiscal.prc_Bloco_H_Reg_H010;
begin
  fDMSPEDFiscal.cdsBalanco.First;
  while not fDMSPEDFiscal.cdsBalanco.Eof do
  begin
    with ACBrSPEDFiscal1.Bloco_H do
    begin
      with RegistroH010New do
      begin
        if fDMSPEDFiscal.qParametrosIMP_NFE_REF_PROD.AsString = 'R' then
          COD_ITEM   := fDMSPEDFiscal.cdsBalancoREFERENCIA.AsString
        else
          COD_ITEM   := fDMSPEDFiscal.cdsBalancoID_PRODUTO.AsString;
        UNID       := fDMSPEDFiscal.cdsBalancoUNIDADE.AsString;
        QTD        := StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsBalancoQTD_ESTOQUE.AsFloat));
        VL_UNIT    := StrToFloat(FormatFloat('0.000000',fDMSPEDFiscal.cdsBalancoclPreco_Medio.AsFloat));
        VL_ITEM    := StrToFloat(FormatFloat('0.00',fDMSPEDFiscal.cdsBalancoclVlr_Total.AsFloat));
        IND_PROP   := piInformante;
        COD_PART   := '';
        TXT_COMPL  := '';
        COD_CTA    := '';
        VL_ITEM_IR := 0;
        vContador_Reg_H := vContador_Reg_H + 1;

        prc_Bloco_H_Reg_H020;

        {with RegistroH020New do
        begin
          CST_ICMS := '00';
          BC_ICMS  := 1;
          VL_ICMS := 2;
          vContador_Reg_H := vContador_Reg_H + 1;
        end;}

      end;
    end;

    fDMSPEDFiscal.cdsBalanco.Next;
  end;

end;

procedure TfrmSPEDFiscal.prc_Bloco_H_Reg_H020;
begin

end;

procedure TfrmSPEDFiscal.prc_Bloco_H_Reg_H990;
begin
  vContador_Reg_H := vContador_Reg_H + 1;
  with ACBrSPEDFiscal1.Bloco_H do
  begin
    with RegistroH990 do
    begin
      QTD_LIN_H := vContador_Reg_H;
    end
  end;
end;

procedure TfrmSPEDFiscal.prc_Gerar_Bloco_H;
begin
  vContador_Reg_H := 0;
  prc_Consultar_cdsBalanco;

  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco H.
  with ACBrSPEDFiscal1.Bloco_H do
  begin
    with RegistroH001New do
    begin
      case ComboBox1.ItemIndex of
        0 : IND_MOV := imComDados;
        1 : IND_MOV := imSemDados;
      end;
      vContador_Reg_H := vContador_Reg_H + 1;
    end
  end;

  prc_Bloco_H_Reg_H005;
  prc_Bloco_H_Reg_H010;
  prc_Bloco_H_Reg_H990;

  //if cbConcomitante.Checked then
  //begin
  //  ACBrSPEDFiscal1.WriteBloco_H;
  //  LoadToMemo;
  //end;
end;

function TfrmSPEDFiscal.Monta_Numero(Campo: String;
  Tamanho: Integer): String;
var
  texto2: String;
  i: Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      Texto2 := Texto2 + Copy(Campo,i,1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

procedure TfrmSPEDFiscal.btnGerarClick(Sender: TObject);
begin
  if not fnc_Valida_Campos('H') then
    exit;
  if (DateEdit3.Date > DateEdit2.Date) or (DateEdit3.Date < 10) then
  begin
    MessageDlg('*** Data do invent�rio inv�lida' , mtError, [mbOk], 0);
    exit;
  end;
  if MessageDlg('Deseja gerar o <Bloco H>?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  btnGerar.Tag := 1;
  try
    BtnBloco_0Click(Sender);
    btnBloco_CClick(Sender);
    btnBloco_HClick(Sender);

    btnGravar_TxtClick(Sender);

    MessageDlg('*** Bloco H gerado!' , mtInformation, [mbOk], 0);
  finally
    btnGerar.Tag := 0;
  end;
end;

procedure TfrmSPEDFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 83) then //S
  begin
    TS_Exemplo.TabVisible := not(TS_Exemplo.TabVisible);
    BtnBloco_0.Visible    := not(BtnBloco_0.Visible);
    btnBloco_1.Visible    := not(btnBloco_1.Visible);
    btnBloco_9.Visible    := not(btnBloco_9.Visible);
    btnBloco_C.Visible    := not(btnBloco_C.Visible);
    btnBloco_D.Visible    := not(btnBloco_D.Visible);
    btnBloco_E.Visible    := not(btnBloco_E.Visible);
    btnBloco_G.Visible    := not(btnBloco_G.Visible);
    btnBloco_H.Visible    := not(btnBloco_H.Visible);
  end;
end;

end.