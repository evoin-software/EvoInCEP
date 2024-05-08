unit EvoOutCEP.intf;

interface

type
  IEvoOutCEP = interface
    ['{8EB2D947-09B5-488F-8DCF-9D15C9B26B0B}']
    function Json(AValue : string) : IEvoOutCEP;
    function Rua : string;
    function Bairro : string;
    function Cidade : string;
    function Estado : string;
  end;

implementation

end.
