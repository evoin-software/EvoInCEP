unit EvoinCEP.BrasilAberto;

interface

uses EvoInCEP.Intf, RESTRequest4D;

type
  TBrasilAberto = class(TInterfacedObject, ICEPRequest)
  private
    function Get(const AValue: string): ICEPResponse;
  public
    class function New: ICEPRequest;
  end;

implementation

uses System.JSON, EvoInCEP.Response;

function TBrasilAberto.Get(const AValue: string): ICEPResponse;
begin
  Result := nil;

  var LResponse := TRequest.New
    .BaseURL('https://api.brasilaberto.com/v1/zipcode')
    .Resource(AValue)
    .Accept('application/json')
    .Get;

  if LResponse.StatusCode <> 200 then
    Exit;

  Result := TCEPResponse.New(
    LResponse.JSONValue.GetValue<TJSONObject>('result').GetValue<string>('zipcode', ''),
    LResponse.JSONValue.GetValue<TJSONObject>('result').GetValue<string>('district', ''),
    LResponse.JSONValue.GetValue<TJSONObject>('result').GetValue<string>('street', ''),
    LResponse.JSONValue.GetValue<TJSONObject>('result').GetValue<string>('city', ''),
    '',
    LResponse.JSONValue.GetValue<TJSONObject>('result').GetValue<string>('stateShortname', ''),
    '',
    '',
    '',
    '');
end;

class function TBrasilAberto.New: ICEPRequest;
begin
  Result := Self.Create;
end;

end.
