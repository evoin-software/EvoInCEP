unit EvoInCEP;

interface

uses EvoinCEP.Intf;

type
{$SCOPEDENUMS ON}
  TAPIDefault = (All, ViaCep, BrasilAPI, OpenCEP, BrasilAberto);
{$SCOPEDENUMS OFF}

  TEvoInCEP = class(TInterfacedObject, ICEPRequest)
  private
    FAPIDefault: TAPIDefault;
    function Get(const AValue: string): ICEPResponse;
    function OnlyNumbers(const AValue: string): string;
    function GetAll(const AValue: string): ICEPResponse;
    function GetViaCep(const AValue: string): ICEPResponse;
    function GetBrasilApi(const AValue: string): ICEPResponse;
    function GetOpenCep(const AValue: string): ICEPResponse;
    function GetBrasilAberto(const AValue: string): ICEPResponse;
    function MakeRequest(const AAPIDefault: TAPIDefault): Boolean;
  public
    class function New(const AAPIDefault: TAPIDefault = TAPIDefault.All): ICEPRequest;
    constructor Create(const AAPIDefault: TAPIDefault); overload;
  end;

implementation

uses System.Threading, System.SysUtils, System.Generics.Collections, EvoInCEP.ViaCEP, EvoinCEP.BrasilAPI, EvoinCEP.OpenCEP,
  EvoinCEP.BrasilAberto;


constructor TEvoInCEP.Create(const AAPIDefault: TAPIDefault);
begin
  inherited Create;
  FAPIDefault := AAPIDefault;
end;

function TEvoInCEP.Get(const AValue: string): ICEPResponse;
var
  LCEP: string;
begin
  LCEP := OnlyNumbers(AValue).PadLeft(8, '0');
  case FAPIDefault of
    TAPIDefault.ViaCep:
      Result := GetViaCep(LCEP);
    TAPIDefault.BrasilAPI:
      Result := GetBrasilApi(LCEP);
    TAPIDefault.OpenCEP:
      Result := GetOpenCep(LCEP);
    TAPIDefault.BrasilAberto:
      Result := GetBrasilAberto(LCEP);
    else
      Result := GetAll(LCEP);
  end;
end;

function TEvoInCEP.GetAll(const AValue: string): ICEPResponse;
var
  LList: TList<ITask>;
begin
  LList := TList<ITask>.Create;
  try
    if MakeRequest(TAPIDefault.ViaCep) then
      LList.Add(TTask.Future<ICEPResponse>(
        function: ICEPResponse
        begin
          Result := TViaCEP.New.Get(AValue);
          if not Assigned(Result) then
            Sleep(4000);
        end));

    if MakeRequest(TAPIDefault.BrasilAPI) then
      LList.Add(TTask.Future<ICEPResponse>(
        function: ICEPResponse
        begin
          Result := TBrasilAPI.New.Get(AValue);
          if not Assigned(Result) then
            Sleep(4000);
        end));

    if MakeRequest(TAPIDefault.BrasilAberto) then
      LList.Add(TTask.Future<ICEPResponse>(
        function: ICEPResponse
        begin
          Result := TBrasilAberto.New.Get(AValue);
          if not Assigned(Result) then
            Sleep(4000);
        end));

    if MakeRequest(TAPIDefault.OpenCEP) then
      LList.Add(TTask.Future<ICEPResponse>(
        function: ICEPResponse
        begin
          Result := TOpenCEP.New.Get(AValue);
          if not Assigned(Result) then
            Sleep(4000);
        end));

    TFuture<ICEPResponse>.WaitForAny(LList.ToArray);

    for var LTask in LList do
    begin
      if LTask.Status = TTaskStatus.Completed then
        Result := IFuture<ICEPResponse>(LTask).Value;
      if Assigned(Result) then
        Break;
    end;
  finally
    LList.Free;
  end;
end;

function TEvoInCEP.GetBrasilAberto(const AValue: string): ICEPResponse;
begin
  Result := TBrasilAberto.New.Get(AValue);
  if not Assigned(Result) then
    Result := GetAll(AValue);
end;

function TEvoInCEP.GetBrasilApi(const AValue: string): ICEPResponse;
begin
  Result := TBrasilAPI.New.Get(AValue);
  if not Assigned(Result) then
    Result := GetAll(AValue);
end;

function TEvoInCEP.GetOpenCep(const AValue: string): ICEPResponse;
begin
  Result := TOpenCEP.New.Get(AValue);
  if not Assigned(Result) then
    Result := GetAll(AValue);
end;

function TEvoInCEP.GetViaCep(const AValue: string): ICEPResponse;
begin
  Result := TViaCEP.New.Get(AValue);
  if not Assigned(Result) then
    Result := GetAll(AValue);
end;

function TEvoInCEP.MakeRequest(const AAPIDefault: TAPIDefault): Boolean;
begin
  Result := ((FAPIDefault = TAPIDefault.All) or (FAPIDefault <> AAPIDefault));
end;

class function TEvoInCEP.New(const AAPIDefault: TAPIDefault): ICEPRequest;
begin
  Result := Self.Create(AAPIDefault);
end;

function TEvoInCEP.OnlyNumbers(const AValue: string): string;
begin
  for var I := 1 to Length(AValue) do
  begin
    if CharInSet(AValue[I], ['0'..'9']) then
      Result := Result + AValue[I];
  end;
end;

end.
