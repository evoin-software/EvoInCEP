unit EvoinCEP.OpenCEP;

interface

uses EvoInCEP.intf, RESTRequest4D;

type
  TEvoInCEPOpenCEP = class(TInterfacedObject, IEvoInCEP)
  private
    function Get(AValue: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEvoInCEP;
  end;

implementation

constructor TEvoInCEPOpenCEP.Create;
begin

end;

destructor TEvoInCEPOpenCEP.Destroy;
begin

  inherited;
end;

function TEvoInCEPOpenCEP.Get(AValue: string): string;
var
  LResponse: IResponse;
begin
  LResponse := TRequest
                 .New
                 .BaseURL('https://opencep.com/v1')
                 .Resource(AValue)
                 .Accept('application/json')
                 .Get;
  if LResponse.StatusCode = 200 then
    Result := 'OpenCEP' + sLineBreak + LResponse.Content ;
end;

class function TEvoInCEPOpenCEP.New: IEvoInCEP;
begin
  Result := Self.Create;
end;

end.
