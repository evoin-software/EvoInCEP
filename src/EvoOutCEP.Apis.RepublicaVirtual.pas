unit EvoOutCEP.Apis.RepublicaVirtual;

interface

uses
  Pkg.Json.DTO;

{$M+}

type
  TApiRepublicaVirtual = class(TJsonDTO)
  private
    FBairro: string;
    FCidade: string;
    FLogradouro: string;
    FResultado: string;
    [JSONName('resultado_txt')]
    FResultadoTxt: string;
    [JSONName('tipo_logradouro')]
    FTipoLogradouro: string;
    FUf: string;
  published
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Resultado: string read FResultado write FResultado;
    property ResultadoTxt: string read FResultadoTxt write FResultadoTxt;
    property TipoLogradouro: string read FTipoLogradouro write FTipoLogradouro;
    property Uf: string read FUf write FUf;
  end;

implementation

end.
