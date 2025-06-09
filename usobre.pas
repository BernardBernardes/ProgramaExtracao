unit usobre;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormSobre }

  TFormSobre = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormSobre: TFormSobre;

implementation

{$R *.lfm}

{ TFormSobre }

procedure TFormSobre.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFormSobre.FormActivate(Sender: TObject);
begin
  Button1.Left:=Round(FormSobre.Width/2 - Button1.Width/2);
  Label1.Left:=Round(FormSobre.Width/2 - Label1.Width/2);
  Label2.Left:=Round(FormSobre.Width/2 - Label2.Width/2);
  Label3.Left:=Round(FormSobre.Width/2 - Label3.Width/2);
  Label4.Left:=Round(FormSobre.Width/2 - Label4.Width/2);
  Label5.Left:=Round(FormSobre.Width/2 - Label5.Width/2);
  Label6.Left:=Round(FormSobre.Width/2 - Label6.Width/2);
  Label7.Left:=Round(FormSobre.Width/2 - Label7.Width/2);
  Label8.Left:=Round(FormSobre.Width/2 - Label8.Width/2);
end;

end.

