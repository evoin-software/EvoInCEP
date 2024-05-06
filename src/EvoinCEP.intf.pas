unit EvoinCEP.Intf;

interface

type
  ICEPResponse = interface
    ['{EDB13868-F173-4AA4-8421-5DA0D850B8B5}']
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
  end;

  ICEPRequest = interface
    ['{1634EF2B-A4C9-4907-AB93-622E027FB45F}']
    function Get(const AValue: string): ICEPResponse;
  end;

implementation

end.
