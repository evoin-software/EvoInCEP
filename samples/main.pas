unit main;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses EvoInCEP;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  var LCEP := TEvoInCEP.New(TAPIDefault.All).Get(Edit1.Text);

  Memo1.Clear;
  Memo1.Lines.Add('CEP: ' + LCEP.CEP);
  Memo1.Lines.Add('BAIRRO: ' + LCEP.Bairro);
  Memo1.Lines.Add('LOGRADOURO: ' + LCEP.Logradouro);
  Memo1.Lines.Add('CIDADE: ' + LCEP.Cidade);
  Memo1.Lines.Add('IBGE: ' + LCEP.IBGE);
  Memo1.Lines.Add('UF: ' + LCEP.UF);
  Memo1.Lines.Add('COMPLEMENTO: ' + LCEP.Complemento);
  Memo1.Lines.Add('DDD: ' + LCEP.DDD);
  Memo1.Lines.Add('GIA: ' + LCEP.GIA);
  Memo1.Lines.Add('SIAFI: ' + LCEP.SIAFI);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
