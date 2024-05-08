unit EvoOutCEP.Apis.OpenCEP;

interface

uses
  Pkg.Json.DTO;

{$M+}

type
  TApiOpenCEP = class(TJsonDTO)
  private
    FBairro: string;
    FCep: string;
    FComplemento: string;
    FIbge: string;
    FLocalidade: string;
    FLogradouro: string;
    FUf: string;
  published

    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property Complemento: string read FComplemento write FComplemento;
    property Ibge: string read FIbge write FIbge;
    property Localidade: string read FLocalidade write FLocalidade;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Uf: string read FUf write FUf;
  end;
  
implementation

end.
