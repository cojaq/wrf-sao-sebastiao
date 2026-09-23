# WRF — Canal de São Sebastião

Estrutura inicial para o piloto de downscaling dinâmico do vento de superfície no Canal de São Sebastião (SP), usando ERA5 como condição atmosférica de grande escala e WRF/WPS para o refinamento regional.

## Objetivo

Rodar primeiro um piloto reproduzível, com casos de 72 horas em quatro estações do ano. O piloto testa a cadeia ERA5 → WPS → WRF, a sensibilidade às grades e o custo computacional. A produção climatológica de 1991–2020 será definida somente depois dessa avaliação.

## Como usar no NCAR

1. Clone este repositório no sistema de arquivos de trabalho.
2. Copie `config/local.example.json` para `config/local.json` e preencha os caminhos locais, a conta PBS e o diretório `WPS_GEOG`.
3. Execute `bash experiment doctor` para verificar módulos, executáveis e diretórios.
4. Execute `bash experiment setup` para criar a árvore de trabalho.
5. Execute `bash experiment submit smoke` para confirmar a configuração.
6. Depois de validar o smoke, execute `bash experiment submit pilot` para os casos sazonais.

A versão inicial usa D01=9 km, D02=3 km e D03=1 km. D04=333 m fica descrito na configuração para o próximo teste; a grade de 111 m não é submetida por padrão.

## Dados

- ERA5: arquivos GRIB de níveis de pressão e superfície obtidos pelo CDS ou pelo NCAR RDA.
- WPS static geography: diretório `WPS_GEOG` instalado no cluster. A fonte topográfica fina deve ser validada antes do piloto; o projeto aceita Copernicus GLO-30 ou FABDEM preparado para o WPS.
- ERA5 requer `Vtable.ECMWF` e o arquivo `ERA5_INVARIANT`.

## Estrutura

- `config/`: configuração científica e parâmetros da máquina.
- `workflow/`: comandos de diagnóstico e submissão PBS.
- `docs/`: decisões científicas e fluxo operacional.
- `validation/`: espaço para observações do CEBIMar e métricas.

## Estado atual

Esta primeira versão é a base documentada do piloto. Ela verifica a configuração e cria os diretórios, mas ainda não gera automaticamente os `namelist` nem baixa ERA5: esses dois pontos dependem da confirmação final da projeção, dos domínios e do formato de dados disponível no NCAR. Não iniciar uma integração WRF apenas com este esqueleto.

## Referências

- [WRF Users Guide](https://www2.mmm.ucar.edu/wrf/users/wrf_users_guide/build/html/)
- [WPS e dados geográficos](https://www2.mmm.ucar.edu/wrf/site/documentation/users_guide/wps.html)
- [Como processar ERA5 no WPS](https://www2.mmm.ucar.edu/wrf/site/faq/input_data.html)
- [Executar WRF no NCAR Derecho](https://ncar-hpc-docs.readthedocs.io/en/latest/environment-and-software/community-models/wrf_on_derecho/)
