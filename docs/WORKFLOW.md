# Fluxo do piloto

## 1. Preparar a máquina

No Derecho, o NCAR mantém versões pré-compiladas de WRF e WPS. O colega deve copiar este arquivo, preencher `config/local.json` e executar:

```bash
./experiment doctor
./experiment setup
```

O script não baixa dados automaticamente. Isso evita colocar credenciais do CDS no repositório. Os GRIBs ERA5 devem estar em `era5_dir`, separados por níveis de pressão e superfície, e o arquivo `ERA5_INVARIANT` deve estar no diretório WPS.

## 2. Teste curto

```bash
./experiment submit smoke
```

O teste usa uma janela de 6 horas e os três primeiros domínios. Verifique os arquivos PBS e os `rsl.error.*` antes de continuar.

## 3. Piloto

```bash
./experiment submit pilot
```

O piloto submete quatro casos de 72 horas, um por estação, com a mesma configuração para permitir comparação. A produção é 1 km; a grade D04=333 m será ativada somente após confirmar custo e estabilidade.

## 4. Saídas

Salve logs e `wrfout_d0*` sob `work_root/runs/<case>`. Para a análise, extraia U10/V10, velocidade e direção do vento a cada 10–15 minutos nos domínios finos. Não versionar dados, executáveis ou resultados no Git.
