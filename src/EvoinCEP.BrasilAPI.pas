unit EvoinCEP.BrasilAPI;

interface

uses EvoInCEP.Intf, RESTRequest4D;

type
  TBrasilAPI = class(TInterfacedObject, ICEPRequest)
  private
    function Get(const AValue: string): ICEPResponse;
  public
    class function New: ICEPRequest;
  end;

implementation

uses EvoInCEP.Response;

function TBrasilAPI.Get(const AValue: string): ICEPResponse;
begin
  Result := nil;

  var LResponse := TRequest.New
    .BaseURL('https://brasilapi.com.br/api/cep/v1')
    .Resource(AValue)
    .Accept('application/json')
    .Get;

  if LResponse.StatusCode <> 200 then
    Exit;

  Result := TCEPResponse.New(
    LResponse.JSONValue.GetValue<string>('cep', ''),
    LResponse.JSONValue.GetValue<string>('neighborhood', ''),
    LResponse.JSONValue.GetValue<string>('street', ''),
    LResponse.JSONValue.GetValue<string>('city', ''),
    '',
    LResponse.JSONValue.GetValue<string>('state', ''),
    LResponse.JSONValue.GetValue<string>('complement', ''),
    '',
    '',
    '');
end;

class function TBrasilAPI.New: ICEPRequest;
begin
  Result := Self.Create;
end;

end.
