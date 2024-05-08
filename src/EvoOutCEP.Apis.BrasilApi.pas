unit EvoOutCEP.Apis.BrasilApi;

interface

uses
  Pkg.Json.DTO;

{$M+}

type
  TApiBrasilApi = class(TJsonDTO)
  private
    FCep: string;
    FCity: string;
    FNeighborhood: string;
    FService: string;
    FState: string;
    FStreet: string;
  published
    property Cep: string read FCep write FCep;
    property City: string read FCity write FCity;
    property Neighborhood: string read FNeighborhood write FNeighborhood;
    property Service: string read FService write FService;
    property State: string read FState write FState;
    property Street: string read FStreet write FStreet;
  end;

implementation

end.
