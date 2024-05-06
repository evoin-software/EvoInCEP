program Samples;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  EvoinCEP.Intf in '..\src\EvoinCEP.Intf.pas',
  EvoInCEP in '..\src\EvoInCEP.pas',
  EvoinCEP.BrasilAPI in '..\src\EvoinCEP.BrasilAPI.pas',
  EvoinCEP.ViaCEP in '..\src\EvoinCEP.ViaCEP.pas',
  EvoinCEP.BrasilAberto in '..\src\EvoinCEP.BrasilAberto.pas',
  EvoinCEP.OpenCEP in '..\src\EvoinCEP.OpenCEP.pas',
  EvoInCEP.Response in '..\src\EvoInCEP.Response.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
