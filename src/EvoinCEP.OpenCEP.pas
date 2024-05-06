unit EvoinCEP.OpenCEP;

interface

uses EvoInCEP.Intf, RESTRequest4D;

type
  TOpenCEP = class(TInterfacedObject, ICEPRequest)
  private
    function Get(const AValue: string): ICEPResponse;
  public
    class function New: ICEPRequest;
  end;

implementation

uses EvoInCEP.Response;

function TOpenCEP.Get(const AValue: string): ICEPResponse;
begin
  Result := nil;

  var LResponse := TRequest.New
    .BaseURL('https://opencep.com/v1')
    .Resource(AValue)
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
    '',
    '',
    '');
end;

class function TOpenCEP.New: ICEPRequest;
begin
  Result := Self.Create;
end;

end.
