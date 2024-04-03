unit EvoinCEP.RepublicaVirtual;

interface

uses EvoInCEP.intf, RESTRequest4D;

type
  TEvoInCEPRepublicaVirtual = class(TInterfacedObject, IEvoInCEP)
  private
    function Get(AValue: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEvoInCEP;
  end;

implementation

constructor TEvoInCEPRepublicaVirtual.Create;
begin

end;

destructor TEvoInCEPRepublicaVirtual.Destroy;
begin

  inherited;
end;

function TEvoInCEPRepublicaVirtual.Get(AValue: string): string;
var
  LResponse: IResponse;
begin
  LResponse := TRequest
                 .New
                 .BaseURL('http://cep.republicavirtual.com.br')
                 .Resource('web_cep.php?cep=' + AValue)
                 .AddParam('formato','json')
                 .Accept('application/json')
                 .Get;
  if LResponse.StatusCode = 200 then
    Result := 'RepublicaVirtual' + sLineBreak + LResponse.Content ;
end;

class function TEvoInCEPRepublicaVirtual.New: IEvoInCEP;
begin
  Result := Self.Create;
end;

end.
