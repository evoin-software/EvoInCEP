program Samples;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  EvoinCEP.intf in '..\src\EvoinCEP.intf.pas',
  EvoInCEP in '..\src\EvoInCEP.pas',
  EvoinCEP.BrasilAPI in '..\src\EvoinCEP.BrasilAPI.pas',
  EvoinCEP.ViaCEP in '..\src\EvoinCEP.ViaCEP.pas',
  EvoinCEP.BrasilAberto in '..\src\EvoinCEP.BrasilAberto.pas',
  EvoinCEP.OpenCEP in '..\src\EvoinCEP.OpenCEP.pas',
  EvoinCEP.RepublicaVirtual in '..\src\EvoinCEP.RepublicaVirtual.pas',
  Pkg.Json.DTO in '..\src\Pkg.Json.DTO.pas',
  EvoOutCEP.Apis.OpenCEP in '..\src\EvoOutCEP.Apis.OpenCEP.pas',
  EvoOutCEP in '..\src\EvoOutCEP.pas',
  EvoOutCEP.intf in '..\src\EvoOutCEP.intf.pas',
  EvoOutCEP.Apis.BrasilApi in '..\src\EvoOutCEP.Apis.BrasilApi.pas',
  EvoOutCEP.Apis.ViaCEP in '..\src\EvoOutCEP.Apis.ViaCEP.pas',
  EvoOutCEP.Apis.BrasilAberto in '..\src\EvoOutCEP.Apis.BrasilAberto.pas',
  EvoOutCEP.Apis.RepublicaVirtual in '..\src\EvoOutCEP.Apis.RepublicaVirtual.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
