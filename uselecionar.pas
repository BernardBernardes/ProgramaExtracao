unit USelecionar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, CheckLst;

type

  { TFormSelecionar }

  TFormSelecionar = class(TForm)
    Button1: TButton;
    CheckListBox1: TCheckListBox;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormSelecionar: TFormSelecionar;

implementation
uses UPrincipal;

{$R *.lfm}

{ TFormSelecionar }

procedure TFormSelecionar.FormActivate(Sender: TObject);
var
  Arquivo: TStringList;
  k: integer;
begin
  Arquivo:= TStringList.Create;
  Arquivo.LoadFromFile(UPrincipal.FPrincipal.OpenDialog1.FileName);
  for k:=1 to StrToInt(Arquivo[0]) do
  begin
    CheckListBox1.Items.Add(Arquivo[k]);
  end;
  Arquivo.Free;
  Button1.Left:= Round(FormSelecionar.Width/2 - Button1.Width/2);
end;

procedure TFormSelecionar.CheckListBox1ClickCheck(Sender: TObject);
var
  k,j,checando: integer;

begin

  for k:=0 to CheckListBox1.Count-1 do
  begin

    if CheckListBox1.Checked[k] then
    begin

      checando:=0;
      for j:=0 to ListBox1.Count-1 do
      begin

        if CheckListBox1.Items[k] = ListBox1.Items[j] then
        begin
          checando:=1;
        end;
      end;

      if checando = 0 then
      begin
        ListBox1.Items.Add(CheckListBox1.Items[k]);
      end;
    end;
  end;

  for k:=0 to CheckListBox1.Count-1 do
  begin

    if Not(CheckListBox1.Checked[k]) then
    begin
      checando:=0;
      for j:=0 to ListBox1.Count-1 do
      begin
        if CheckListBox1.Items[k] = ListBox1.Items[j] then
        begin
          checando:=1;
          break;
        end;
      end;
      if checando = 1 then
      begin
        ListBox1.Items.Delete(j);
      end;
    end;

  end;
  Edit1.Text:=IntToStr(ListBox1.Count);
end;

procedure TFormSelecionar.Button1Click(Sender: TObject);
begin
  close;
end;

end.

