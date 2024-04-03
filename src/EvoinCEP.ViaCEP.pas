unit EvoinCEP.ViaCEP;

interface

uses EvoInCEP.intf, RESTRequest4D;

type
  TEvoInCEPViaCEP = class(TInterfacedObject, IEvoInCEP)
  private
    function Get(AValue: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEvoInCEP;
  end;

implementation

constructor TEvoInCEPViaCEP.Create;
begin

end;

destructor TEvoInCEPViaCEP.Destroy;
begin

  inherited;
end;

function TEvoInCEPViaCEP.Get(AValue: string): string;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New.BaseURL('https://viacep.com.br/ws').Resource(AValue).ResourceSuffix('json').Accept('application/json').Get;
  if LResponse.StatusCode = 200 then
    Result := 'ViaCEP' + sLineBreak + LResponse.Content ;
end;

class function TEvoInCEPViaCEP.New: IEvoInCEP;
begin
  Result := Self.Create;
end;

end.
