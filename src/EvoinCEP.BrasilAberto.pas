unit EvoinCEP.BrasilAberto;

interface

uses EvoInCEP.intf, RESTRequest4D;

type
  TEvoInCEPBrasilAberto = class(TInterfacedObject, IEvoInCEP)
  private
    function Get(AValue: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEvoInCEP;
  end;

implementation

constructor TEvoInCEPBrasilAberto.Create;
begin

end;

destructor TEvoInCEPBrasilAberto.Destroy;
begin

  inherited;
end;

function TEvoInCEPBrasilAberto.Get(AValue: string): string;
var
  LResponse: IResponse;
begin
  LResponse := TRequest
                 .New
                 .BaseURL('https://api.brasilaberto.com/v1/zipcode')
                 .Resource(AValue)
                 .Accept('application/json')
                 .Get;
  if LResponse.StatusCode = 200 then
    Result := 'BrasilAberto' + sLineBreak + LResponse.Content ;
end;

class function TEvoInCEPBrasilAberto.New: IEvoInCEP;
begin
  Result := Self.Create;
end;

end.
