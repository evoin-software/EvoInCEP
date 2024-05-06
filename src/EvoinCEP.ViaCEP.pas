unit EvoinCEP.ViaCEP;

interface

uses EvoInCEP.Intf, RESTRequest4D;

type
  TViaCEP = class(TInterfacedObject, ICEPRequest)
  private
    function Get(const AValue: string): ICEPResponse;
  public
    class function New: ICEPRequest;
  end;

implementation

uses EvoInCEP.Response;

function TViaCEP.Get(const AValue: string): ICEPResponse;
begin
  Result := nil;

  var LResponse := TRequest.New
    .BaseURL('https://viacep.com.br/ws')
    .Resource(AValue)
    .ResourceSuffix('json')
    .Accept('application/json')
    .Get;

  if LResponse.StatusCode <> 200 then
    Exit;

  Result := TCEPResponse.New(
    LResponse.JSONValue.GetValue<string>('cep', ''),
    LResponse.JSONValue.GetValue<string>('bairro', ''),
    LResponse.JSONValue.GetValue<string>('logradouro', ''),
    LResponse.JSONValue.GetValue<string>('localidade', ''),
    LResponse.JSONValue.GetValue<string>('ibge', ''),
    LResponse.JSONValue.GetValue<string>('uf', ''),
    LResponse.JSONValue.GetValue<string>('complemento', ''),
    LResponse.JSONValue.GetValue<string>('ddd', ''),
    LResponse.JSONValue.GetValue<string>('gia', ''),
    LResponse.JSONValue.GetValue<string>('siafi', ''));
end;

class function TViaCEP.New: ICEPRequest;
begin
  Result := Self.Create;
end;

end.
