# datex

Script for extracting data from datasus

## Usage

- All SIHSUS RD datas from 2008 to current date

```sh
./datex.sh -s SIHSUS -t RD
```

- All SIHSUS RD datas from 2008 to 2011

```sh
./datex.sh -s SIHSUS -t RD -y 08 -y 09 -y 10 -y 11
```

- All SIHSUS RD datas from January and February for the years 2008 to 2020

```sh
./datex.sh -s SIHSUS -t RD -y 08 -y 09 -y 10 -y 11 -m 01 -m 02
```

- All SIHSUS RD datas from 2008 to current date to Bahia

```sh
./datex.sh -s SIHSUS -t RD -r BA
```

- All SIHSUS RD datas from 2008 to Bahia

```sh
./datex.sh -s SIHSUS -t RD -y 08 -r BA
```

- All SIHSUS RD datas from December 2008 to São Paulo

```sh
./datex.sh -s SIHSUS -t RD -y 08 -m 12 -r SP
```

- For more information

```sh
./datex.sh -h
```
