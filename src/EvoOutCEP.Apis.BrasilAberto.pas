unit EvoOutCEP.Apis.BrasilAberto;

interface

uses
  Pkg.Json.DTO;

{$M+}

type
  TResult = class
  private
    FCity: string;
    FComplement: string;
    FDistrict: string;
    FState: string;
    FStateShortname: string;
    FStreet: string;
    FZipcode: string;
  published
    property City: string read FCity write FCity;
    property Complement: string read FComplement write FComplement;
    property District: string read FDistrict write FDistrict;
    property State: string read FState write FState;
    property StateShortname: string read FStateShortname write FStateShortname;
    property Street: string read FStreet write FStreet;
    property Zipcode: string read FZipcode write FZipcode;
  end;

  TMeta = class
  private
    FCurrentPage: Integer;
    FItemsPerPage: Integer;
    FTotalOfItems: Integer;
    FTotalOfPages: Integer;
  published
    property CurrentPage: Integer read FCurrentPage write FCurrentPage;
    property ItemsPerPage: Integer read FItemsPerPage write FItemsPerPage;
    property TotalOfItems: Integer read FTotalOfItems write FTotalOfItems;
    property TotalOfPages: Integer read FTotalOfPages write FTotalOfPages;
  end;

  TApiBrasilAberto = class(TJsonDTO)
  private
    FMeta: TMeta;
    FResult: TResult;
  published
    property Meta: TMeta read FMeta;
    property Result: TResult read FResult;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TRoot }

constructor TApiBrasilAberto.Create;
begin
  inherited;
  FMeta := TMeta.Create;
  FResult := TResult.Create;
end;

destructor TApiBrasilAberto.Destroy;
begin
  FMeta.Free;
  FResult.Free;
  inherited;
end;

end.
