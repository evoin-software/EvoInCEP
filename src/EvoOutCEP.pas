unit EvoOutCEP;

interface

uses
  EvoOutCEP.intf,

  System.Rtti,
  System.SysUtils,
  System.TypInfo;

type
  TApis = (BrasilAberto, BrasilAPI, OpenCEP, RepublicaVirtual, ViaCEP);

  IEvoOutCEP = EvoOutCEP.intf.IEvoOutCEP;

  TEvoOutCEP = class(TInterfacedObject, IEvoOutCEP)
  private
    FJson : string;
    FEstado : string;
    FCidade : string;
    FBairro : string;
    FRua : string;
    FExtractApi : string;
    FExtractJson : string;
    function Json(AValue : string) : IEvoOutCEP;
    function Estado : string;
    function Cidade : string;
    function Bairro : string;
    function Rua : string;

    procedure ParseToCEP;
    procedure ParseAPIOpenCEP;
    procedure ParseAPIBrasilAPI;
    procedure ParseAPIViaCEP;
    procedure ParseAPIBrasilAberto;
    procedure ParseAPIRepublicaVirtual;
    function ExtractFrom(const AText : string; const ACharacter : Char) : string;
    function ExtractUntil(const AText : string; const ACharacter : Char) : string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IEvoOutCEP;
  end;


implementation

uses
  EvoOutCEP.Apis.ViaCEP,
  EvoOutCEP.Apis.OpenCEP,
  EvoOutCEP.Apis.BrasilApi,
  EvoOutCEP.Apis.BrasilAberto,
  EvoOutCEP.Apis.RepublicaVirtual;

{ TEvoOutCEP }

function TEvoOutCEP.Bairro: string;
begin
  Result := FBairro;
end;

function TEvoOutCEP.Cidade: string;
begin
  Result := FCidade;
end;

constructor TEvoOutCEP.Create;
begin

end;

destructor TEvoOutCEP.Destroy;
begin

  inherited;
end;

function TEvoOutCEP.Estado: string;
begin
  Result := FEstado;
end;

function TEvoOutCEP.ExtractFrom(const AText: string;
  const ACharacter: Char): string;
var
  LPosition : Integer;
begin
  Result := EmptyStr;
  LPosition := Pos(ACharacter, AText);
  if LPosition <= 0 then Exit;
  Result := Copy(AText, LPosition, Length(AText)).Trim;
end;

function TEvoOutCEP.ExtractUntil(const AText: string;
  const ACharacter: Char): string;
var
  LPosition : Integer;
begin
  Result := EmptyStr;
  LPosition := Pos(ACharacter, AText);
  if LPosition <= 0 then Exit;
  Result := Copy(AText, 1, LPosition -1).Trim;
end;

function TEvoOutCEP.Json(AValue: string): IEvoOutCEP;
begin
  Result := Self;
  FJson := AValue;
  if FJson.IsEmpty then
    raise Exception.Create('Json not Found!');
  FExtractApi := ExtractUntil(FJson, '{');
  if FExtractApi.IsEmpty then
    raise Exception.Create('Unrecognized API Type!');
  FExtractJson := ExtractFrom(AValue, '{');
  if FExtractJson.IsEmpty then
    raise Exception.Create('Unrecognized API Json!');
  ParseToCEP;
end;

class function TEvoOutCEP.New: IEvoOutCEP;
begin
  Result := Self.Create;
end;

procedure TEvoOutCEP.ParseAPIBrasilAberto;
var
  LApi : TApiBrasilAberto;
begin
  LApi := TApiBrasilAberto.Create;
  try
    LApi.AsJson := FExtractJson;

    FEstado := LApi.Result.State;
    FCidade := LApi.Result.City;
    FBairro := LApi.Result.District;
    FRua := LApi.Result.Street;
  finally
    LApi.Free;
  end;
end;

procedure TEvoOutCEP.ParseAPIBrasilAPI;
var
  LApi : TApiBrasilApi;
begin
  LApi := TApiBrasilApi.Create;
  try
    LApi.AsJson := FExtractJson;

    FEstado := LApi.State;
    FCidade := LApi.City;
    FBairro := LApi.Neighborhood;
    FRua := LApi.Street;
  finally
    LApi.Free;
  end;
end;

procedure TEvoOutCEP.ParseAPIOpenCEP;
var
  LApi : TApiOpenCEP;
begin
  LApi := TApiOpenCEP.Create;
  try
    LApi.AsJson := FExtractJson;

    FEstado := LApi.Uf;
    FCidade := LApi.Localidade;
    FBairro := LApi.Bairro;
    FRua := LApi.Logradouro;
  finally
    LApi.Free;
  end;
end;

procedure TEvoOutCEP.ParseAPIRepublicaVirtual;
var
  LApi : TApiRepublicaVirtual;
begin
  LApi := TApiRepublicaVirtual.Create;
  try
    LApi.AsJson := FExtractJson;

    FEstado := LApi.Uf;
    FCidade := LApi.Cidade;
    FBairro := LApi.Bairro;
    FRua := LApi.Logradouro;
  finally
    LApi.Free;
  end;
end;

procedure TEvoOutCEP.ParseAPIViaCEP;
var
  LApi : TApiViaCEP;
begin
  LApi := TApiViaCEP.Create;
  try
    LApi.AsJson := FExtractJson;

    FEstado := LApi.Uf;
    FCidade := LApi.Localidade;
    FBairro := LApi.Bairro;
    FRua := LApi.Logradouro;
  finally
    LApi.Free;
  end;
end;

procedure TEvoOutCEP.ParseToCEP;
var
  LTypeApi : TApis;
begin
  LTypeApi := TApis(GetEnumValue(TypeInfo(TApis), FExtractApi ));

  case LTypeApi of
    BrasilAberto: ParseAPIBrasilAberto;
    BrasilAPI: ParseAPIBrasilAPI;
    OpenCEP: ParseAPIOpenCEP;
    RepublicaVirtual: ParseAPIRepublicaVirtual;
    ViaCEP: ParseAPIViaCEP;
  end;
end;

function TEvoOutCEP.Rua: string;
begin
  Result := FRua;
end;

end.
