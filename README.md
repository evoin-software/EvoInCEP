# EvoInCEP
Projeto para consulta de CEP, onde é acionado por APIs gratuitas(por enquanto), retornando os dados da api que retorna os dados primeiro, sem ter que esperar pelas demais;

APIs:
  - BrasilAPI
  - BrasilAberto
  - OpenCep
  - ViaCep
  - Republica Virtual

## Instalação Boss
 * `[Optional]` Para facilitar, eu recomendo usar o [**Boss**](https://github.com/HashLoad/boss) (Dependency Manager for Delphi) para instalação, simplesmente executando o comando abaixo em um terminal (Windows PowerShell por exemplo):
```
boss install github.com/EvoinSoftware/EvoinCEP.git
```

## Instalação Manual
Se você optar por instalar manualmente, basta adicionar a seguinte pasta ao seu projeto, em *Project > Options > Resource Compiler > Directories and Conditionals > Incluir caminho de pesquisa de arquivo*
```
../EvoInCEP/src
```

## Utilizando
```pascal
   uses EvoInCEP;

   TEvoInCEP.New.Get('01001000');
```
