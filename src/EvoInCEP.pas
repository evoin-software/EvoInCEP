unit EvoInCEP;

interface

uses EvoinCEP.Intf;

type
  TEvoInCEP = class(TInterfacedObject, ICEPRequest)
  private
    function Get(const AValue: string): ICEPResponse;
    function OnlyNumbers(const AValue: string): string;
  public
    class function New: ICEPRequest;
  end;

implementation

uses System.Threading, System.SysUtils, System.Generics.Collections, EvoInCEP.ViaCEP, EvoinCEP.BrasilAPI, EvoinCEP.OpenCEP,
  EvoinCEP.BrasilAberto;

function TEvoInCEP.Get(const AValue: string): ICEPResponse;
var
  LCEP: string;
  LList: TList<ITask>;
begin
  LCEP := OnlyNumbers(AValue).PadLeft(8, '0');

  LList := TList<ITask>.Create;
  try
    LList.Add(TTask.Future<ICEPResponse>(
      function: ICEPResponse
      begin
        Result := TViaCEP.New.Get(LCEP);
        if not Assigned(Result) then
          raise Exception.Create('Internal server error.');
      end));

    LList.Add(TTask.Future<ICEPResponse>(
      function: ICEPResponse
      begin
        Result := TBrasilAPI.New.Get(LCEP);
        if not Assigned(Result) then
          raise Exception.Create('Internal server error.');
      end));

    LList.Add(TTask.Future<ICEPResponse>(
      function: ICEPResponse
      begin
        Result := TBrasilAberto.New.Get(LCEP);
        if not Assigned(Result) then
          raise Exception.Create('Internal server error.');
      end));

    LList.Add(TTask.Future<ICEPResponse>(
      function: ICEPResponse
      begin
        Result := TOpenCEP.New.Get(LCEP);
        if not Assigned(Result) then
          raise Exception.Create('Internal server error.');
      end));

    TFuture<ICEPResponse>.WaitForAny(LList.ToArray);

    for var LTask in LList do
    begin
      if LTask.Status = TTaskStatus.Completed then
      begin
        Result := IFuture<ICEPResponse>(LTask).Value;
        Break;
      end;
    end;
  finally
    LList.Free;
  end;
end;

class function TEvoInCEP.New: ICEPRequest;
begin
  Result := Self.Create;
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
