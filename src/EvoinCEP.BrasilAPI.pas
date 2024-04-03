unit EvoinCEP.BrasilAPI;

interface

uses EvoInCEP.intf, RESTRequest4D;

type
  TEvoInCEPBrasilAPI = class(TInterfacedObject, IEvoInCEP)
  private
    function Get(AValue: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEvoInCEP;
  end;

implementation

constructor TEvoInCEPBrasilAPI.Create;
begin

end;

destructor TEvoInCEPBrasilAPI.Destroy;
begin

  inherited;
end;

function TEvoInCEPBrasilAPI.Get(AValue: string): string;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New.BaseURL('https://brasilapi.com.br/api/cep/v1').Resource(AValue).Accept('application/json').Get;
  if LResponse.StatusCode = 200 then
    Result := 'BrasilAPI' + sLineBreak + LResponse.Content ;
end;

class function TEvoInCEPBrasilAPI.New: IEvoInCEP;
begin
  Result := Self.Create;
end;

end.
