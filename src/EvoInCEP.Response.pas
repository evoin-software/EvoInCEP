unit EvoInCEP.Response;

interface

uses EvoinCEP.Intf;

type
  TCEPResponse = class(TInterfacedObject, ICEPResponse)
  public
    FCEP: string;
    FBairro: string;
    FLogradouro: string;
    FCidade: string;
    FIBGE: string;
    FUF: string;
    FComplemento: string;
    FDDD: string;
    FGIA: string;
    FSIAFI: string;
    function CEP: string;
    function Bairro: string;
    function Logradouro: string;
    function Cidade: string;
    function IBGE: string;
    function UF: string;
    function Complemento: string;
    function DDD: string;
    function GIA: string;
    function SIAFI: string;
    class function New(const ACEP, ABairro, ALogradouro, ACidade, AIBGE, AUF, AComplemento, ADDD, AGIA, ASIAFI: string): ICEPResponse;
  end;

implementation

function TCEPResponse.Bairro: string;
begin
  Result := FBairro;
end;

function TCEPResponse.CEP: string;
begin
  Result := FCEP;
end;

function TCEPResponse.Cidade: string;
begin
  Result := FCidade;
end;

function TCEPResponse.Complemento: string;
begin
  Result := FComplemento;
end;

function TCEPResponse.DDD: string;
begin
  Result := FDDD;
end;

function TCEPResponse.GIA: string;
begin
  Result := FGIA;
end;

function TCEPResponse.IBGE: string;
begin
  Result := FIBGE;
end;

function TCEPResponse.Logradouro: string;
begin
  Result := FLogradouro;
end;

class function TCEPResponse.New(const ACEP, ABairro, ALogradouro, ACidade, AIBGE, AUF, AComplemento, ADDD, AGIA, ASIAFI: string): ICEPResponse;
begin
  Result := TCEPResponse.Create;
  TCEPResponse(Result).FCEP := ACEP;
  TCEPResponse(Result).FBairro := ABairro;
  TCEPResponse(Result).FLogradouro := ALogradouro;
  TCEPResponse(Result).FCidade := ACidade;
  TCEPResponse(Result).FIBGE := AIBGE;
  TCEPResponse(Result).FUF := AUF;
  TCEPResponse(Result).FComplemento := AComplemento;
  TCEPResponse(Result).FDDD := ADDD;
  TCEPResponse(Result).FGIA := AGIA;
  TCEPResponse(Result).FSIAFI := ASIAFI;
end;

function TCEPResponse.SIAFI: string;
begin
  Result := FSIAFI;
end;

function TCEPResponse.UF: string;
begin
  Result := FUF;
end;

end.
