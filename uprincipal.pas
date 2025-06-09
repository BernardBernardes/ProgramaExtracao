unit UPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Menus, Math, USelecionar, USobre;

type

  { TFPrincipal }

  TFPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    OpenDialog1: TOpenDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.lfm}

{ TFPrincipal }

procedure TFPrincipal.Button1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  LabeledEdit1.Text:=OpenDialog1.FileName;
  GroupBox2.Enabled:=true;
  GroupBox1.Enabled:=false;
end;

procedure TFPrincipal.Button2Click(Sender: TObject);
begin
  USelecionar.FormSelecionar.ShowModal;
  GroupBox2.Enabled:=false;
  GroupBox3.Enabled:=true;
end;

procedure TFPrincipal.RadioButton1Click(Sender: TObject);
begin
  GroupBox3.Enabled:=true;
  Button2.Enabled:=false;
end;

procedure TFPrincipal.RadioButton2Click(Sender: TObject);
begin
  GroupBox3.Enabled:=false;
  Button2.Enabled:=true;
end;

procedure TFPrincipal.Button3Click(Sender: TObject);
var
  Parametros: array of Real;
  Linha, Temporario, Temp: AnsiString;
  Arquivo, Saida: TStringList;
  k,j,w,posicao: integer;
begin
  GroupBox3.Enabled:=false;
  GroupBox2.Enabled:=false;

  Arquivo:= TStringList.Create;
  Arquivo.LoadFromFile(OpenDialog1.FileName);

  Saida:= TStringList.Create;

  Saida.Add('% Matriz Criada pelo Programa de Extração de Dados de Arquivos .PLT do ANATEM');
  Saida.Add('% Desenvolvido Pelo Eng. Me. Bernard Carvalho Bernardes em 03/10/2015');
  Saida.Add('% CEAMAZON - Centro de Excelência em Eficiência Energética da Amazônia');
  Saida.Add('% Itec - Institudo de Tecnologia');
  Saida.Add('% UFPA - Universidade Federal do Pará');
  Saida.Add('% ');
  Saida.Add('% Disposição dos Dados na Matriz:');

  SetLength(Parametros,StrToInt(Arquivo[0]));

  If( RadioButton1.Checked ) then
  begin
    For k:=1 To StrToInt(Arquivo[0]) do
    begin
      Temp:= '';
      Temp:= '% ' + IntToStr(k) + 'ª ' + 'Coluna ==> ' + Arquivo[k];
      Saida.Add(Temp);
      end;
  end;

  If( RadioButton2.Checked ) then
  begin
    j:=0;
    For k:=0 To ( USelecionar.FormSelecionar.CheckListBox1.Count-1 ) do
    begin
      If( USelecionar.FormSelecionar.CheckListBox1.Checked[k] ) Then
      begin
        j:= j+1;
        Temp:= '';
        Temp:= '% ' + IntToStr(j) + 'ª ' + 'Coluna ==> ' + USelecionar.FormSelecionar.CheckListBox1.Items[k];
        Saida.Add(Temp);
      end;
    end;
  end;

  Saida.Add('Dados = [');


  k:=(StrToInt(Arquivo[0])+1);

  While k <= (Arquivo.Count-1) do
  begin
    Temporario:= '';
    For w:=k To (Ceil(StrToInt(Arquivo[0])/6)+k-1) do
    begin
      Linha:= '';
      Linha:= Arquivo[w];
      Temporario:= Temporario + Linha;
    end;


    if( RadioButton1.Checked ) then
    begin
      Saida.Add(Temporario+';');
    end;

    if( RadioButton2.Checked ) then
    begin
      Temp:='';
      For j:=0 To (USelecionar.FormSelecionar.CheckListBox1.Count-1) do
      begin
        if( USelecionar.FormSelecionar.CheckListBox1.Checked[j] ) then
        begin
          posicao:= j*13 + 1;
          Temp:= Temp + Temporario[posicao] + Temporario[posicao+1] + Temporario[posicao+2];
          Temp:= Temp + Temporario[posicao+3] + Temporario[posicao+4] + Temporario[posicao+5];
          Temp:= Temp + Temporario[posicao+6] + Temporario[posicao+7] + Temporario[posicao+8];
          Temp:= Temp + Temporario[posicao+9] + Temporario[posicao+10] + Temporario[posicao+11];
          Temp:= Temp + Temporario[posicao+12];
        end;
      end;
      Saida.Add(Temp+';');
    end;

    k:= w+1;
  end;

  Saida.Add('];');

  Arquivo.Free;

  ShowMessage('Extração dos Dados Concluída. Salve o Arquivo Gerado');
  SaveDialog1.Execute;
  Saida.SaveToFile(SaveDialog1.FileName);
  Saida.Free;
  LabeledEdit2.Text:=SaveDialog1.FileName;
end;

procedure TFPrincipal.MenuItem1Click(Sender: TObject);
begin
   close;
end;

procedure TFPrincipal.MenuItem3Click(Sender: TObject);
begin
   USobre.FormSobre.ShowModal;
end;

procedure TFPrincipal.MenuItem4Click(Sender: TObject);
label
  Posicao1, Posicao2;
begin
  LabeledEdit1.Text:='';
  LabeledEdit2.Text:='';
  OpenDialog1.FileName:='';
  SaveDialog1.FileName:='';

  Posicao1:
  If (USelecionar.FormSelecionar.CheckListBox1.Count) <> 0 Then
  begin
    USelecionar.FormSelecionar.CheckListBox1.Items.Delete(0);
    GoTo Posicao1;
  end;

  Posicao2:
  If (USelecionar.FormSelecionar.ListBox1.Count) <> 0 Then
  begin
    USelecionar.FormSelecionar.ListBox1.Items.Delete(0);
    GoTo Posicao2;
  end;
  USelecionar.FormSelecionar.Edit1.Text:='';
  GroupBox1.Enabled:=true;
  GroupBox2.Enabled:=false;
  GroupBox3.Enabled:=false;
  RadioButton1.Checked:=false;
  RadioButton2.Checked:=false;
  ShowMessage('Programa Reiniciado');
end;

end.















