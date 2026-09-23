# WRF — Canal de São Sebastião

Estrutura inicial para o piloto de downscaling dinâmico do vento de superfície no Canal de São Sebastião (SP), usando ERA5 como condição atmosférica de grande escala e WRF/WPS para o refinamento regional.

## Objetivo

Rodar primeiro um piloto reproduzível, com casos de 72 horas em quatro estações do ano. O piloto testa a cadeia ERA5 → WPS → WRF, a sensibilidade às grades e o custo computacional. A produção climatológica de 1991–2020 será definida somente depois dessa avaliação.

## Como usar no NCAR

1. Clone este repositório no sistema de arquivos de trabalho.
2. Copie `config/local.example.json` para `config/local.json` e preencha os caminhos locais, a conta PBS e o diretório `WPS_GEOG`.
3. Execute `./experiment doctor` para verificar módulos, executáveis e diretórios.
4. Execute `./experiment setup` para gerar `namelist.wps` e `namelist.input` a partir da configuração.
5. Execute `./experiment submit smoke` para um teste curto de 6 horas.
6. Se o teste terminar corretamente, execute `./experiment submit pilot` para os casos sazonais.

A versão inicial usa D01=9 km, D02=3 km e D03=1 km. D04=333 m fica preparado para o piloto; a grade de 111 m é experimental e não é submetida por padrão.

## Dados

- ERA5: arquivos GRIB de níveis de pressão e superfície obtidos pelo CDS ou pelo NCAR RDA.
- WPS static geography: diretório `WPS_GEOG` instalado no cluster. A fonte topográfica fina deve ser validada antes do piloto; o projeto aceita Copernicus GLO-30 ou FABDEM preparado para o WPS.
- ERA5 requer `Vtable.ECMWF` e o arquivo `ERA5_INVARIANT`.

## Estrutura

- `config/`: configuração científica e parâmetros da máquina.
- `workflow/`: comandos de diagnóstico, preparação e submissão PBS.
- `templates/`: modelos dos namelists.
- `docs/`: decisões, dados e critérios de validação.
- `validation/`: espaço para observações do CEBIMar e métricas.

## Estado atual

A estrutura é um esqueleto executável em preparação. Os domínios exatos, a física da grade subquilométrica e a fonte topográfica final precisam ser validados no NCAR antes de qualquer integração longa.

## Referências

- [WRF Users Guide](https://www2.mmm.ucar.edu/wrf/users/wrf_users_guide/build/html/)
- [WPS e dados geográficos](https://www2.mmm.ucar.edu/wrf/site/documentation/users_guide/wps.html)
- [Como processar ERA5 no WPS](https://www2.mmm.ucar.edu/wrf/site/faq/input_data.html)
- [Executar WRF no NCAR Derecho](https://ncar-hpc-docs.readthedocs.io/en/latest/environment-and-software/community-models/wrf_on_derecho/)
