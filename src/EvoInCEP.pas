unit EvoInCEP;

interface

uses EvoinCEP.intf;

type
  TEvoInCEP = class(TInterfacedObject, IEvoInCEP)
  private
    function Get(AValue: string): string;
    function OnlyNumbers(AValue: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEvoInCEP;
  end;

implementation

uses System.Threading, System.SysUtils, System.Generics.Collections, EvoInCEP.ViaCEP, EvoinCEP.BrasilAPI, EvoinCEP.OpenCEP,
  EvoinCEP.BrasilAberto;

function TEvoInCEP.Get(AValue: string): string;
var
  LTask: ITask;
  LList: TList<ITask>;
begin
  AValue := OnlyNumbers(AValue).PadLeft(8, '0');

  LList := TList<ITask>.Create;
  try
    LList.Add(TTask.Future<string>(
      function: string
      begin
        Result := TEvoInCEPViaCEP.New.Get(AValue);
      end));

    LList.Add(TTask.Future<string>(
      function: string
      begin
        Result := TEvoInCEPBrasilAPI.New.Get(AValue);
      end));

    LList.Add(TTask.Future<string>(
      function: string
      begin
        Result := TEvoInCEPBrasilAberto.New.Get(AValue);
      end));

    LList.Add(TTask.Future<string>(
      function: string
      begin
        Result := TEvoInCEPOpenCEP.New.Get(AValue);
      end));

    TFuture<string>.WaitForAny(LList.ToArray);
    for LTask in LList do
    begin
      if LTask.Status = TTaskStatus.Completed then
      begin
        Result := IFuture<string>(LTask).Value;
        Break;
      end;
    end;
  finally
    LList.DisposeOf;
  end;
end;

constructor TEvoInCEP.Create;
begin

end;

destructor TEvoInCEP.Destroy;
begin

  inherited;
end;

class function TEvoInCEP.New: IEvoInCEP;
begin
  Result := Self.Create;
end;

function TEvoInCEP.OnlyNumbers(AValue: string): string;
var
  I: SmallInt;
begin
  for I := 1 to Length(AValue) do
  begin
    if CharInSet(AValue[I], ['0'..'9']) then
      Result := Result + AValue[I];
  end;
end;

end.
