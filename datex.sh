#!/bin/bash

RED="\e[31m"
GRE="\e[32m"
CLS="\e[0m"

helpMessage() {
   echo "Usage: `basename $0` -s source -t file_type [-options ...][-hv]"
   echo "Options:"
   echo -e "\ts: source"
   echo -e "\tt: file type"
   echo -e "\ty: year aa, optional, default 08 to `date +'%y'`"
   echo -e "\tm: month mm, optional, default all months"
   echo -e "\tr: regions, optional, default all regions"
   echo -e "\to: path for output files, optional, default current path"
   echo -e "\th: see this message"
   echo -e "\tv: get software version"
   echo "Sources:"
   echo -e "\tCIH: Sistema de Comunicação de Informação Hospitalar (not available)"
   echo -e "\tCIHA: Sistema de Comunicação de Informação Hospitalar e Ambulatorial (not available)"
   echo -e "\tCMD: Conjunto Mínimo de Dados (not available)"
   echo -e "\tCNES: Cadastro Nacional de Estabelecimentos de Saúde (not available)"
   echo -e "\tIBGE: Instituto Brasileiro de Geografia e Estatística (not available)"
   echo -e "\tSIASUS: Sistema de Informações Ambulatoriais do SUS (not available)"
   echo -e "\tSIHSUS: Sistema de Informações Hospitalares do SUS"
   echo -e "\tSIM: Sistema de Informações de Mortalidade (not available)"
   echo -e "\tSINANF: Sistema de Agravos de Notificação Compulsória - Dados Finais (not available)"
   echo -e "\tSINANP: Sistema de Agravos de Notificação Compulsória - Dados Preliminares (not available)"
   echo -e "\tSINASC: Sistema de Informação de Nascidos Vivos (not available)"
   echo -e "\tSISPRENATAL: Sistema de Monitoramento e Avaliação do Pré-Natal, Parto, Puerpério e Criança (not available)"
   echo -e "\tTABWIN/TABNET: Ferramentas para Tabulação de Dados (not available)"
   echo "File types:"
   echo -e "\tSIHSUS:"
   echo -e "\t\tER: AIH Rejeitadas com código de erro"
   echo -e "\t\tRD: AIH Reduzidas"
   echo -e "\t\tRJ: AIH Rejeitadas"
   echo -e "\t\tSP: Serviços Profissionais"
   echo "Examples:"
   echo -e "\t`basename $0` -s SIHSUS -t RD"
   echo -e "\t`basename $0` -s SIHSUS -t RD -o output/"
   echo -e "\t`basename $0` -s SIHSUS -t RD -y 08 -y 09"
   echo -e "\t`basename $0` -s SIHSUS -t RD -y 08 -y 09 -m 01"
   echo -e "\t`basename $0` -s SIHSUS -t RD -y 08 -y 09 -m 01 -r BA"
   echo -e "\t`basename $0` -s SIHSUS -t RD -y -r BA"
   exit
}

while getopts "hvs:t:y:m:r:o:" OPT
do
    case $OPT in
        h) helpMessage ;;
        v)
            echo "`basename $0` version 0.1"
            exit ;;
        s)
            SOURCE=$OPTARG ;;
        t)
            FILE_TYPE=$OPTARG ;;
        y)
            YEARS+=($OPTARG) ;;
        m)
            MONTHS+=($OPTARG) ;;
        r)
            REGIONS+=($OPTARG) ;;
        o)
            PATH_OUT=$OPTARG ;;
        ?) helpMessage ;;
    esac
done
shift $((OPTIND-1))

if [ -z $SOURCE ] && [ -z $FILE_TYPE ] && [ -z $YEARS ]
then
    helpMessage
fi

if [ -z $PATH_OUT ]
then
    PATH_OUT=$(pwd)
fi

if [ ! -d $PATH_OUT ]
then
    echo "Directory $PATH_OUT DOES NOT exists."
    exit
fi

if [ -z $YEARS ]
then
    for y in `eval echo {08..$(date +'%y')}`; do YEARS+=($y); done
fi

if [ -z $MONTHS ]
then
    MONTHS=("01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12")
fi

if [ -z $REGIONS ]
then
    REGIONS=("AC" "AL" "AM" "AP" "BA" "CE" "DF" "ES" "GO" "MA" "MG" "MS" "MT" "PA" "PB" "PE" "PI" "PR" "RJ" "RN" "RO" "RR" "RS" "SC" "SE" "SP" "TO")
fi

echo ""
echo -e "${GRE}Starting downloads${CLS}"
mkdir "${PATH_OUT}/${FILE_TYPE}"
for region in ${REGIONS[@]}
do
    echo -e "\n${GRE}Starting region ${region}${CLS}"
    mkdir "${PATH_OUT}/${FILE_TYPE}/${region}"

    for year in ${YEARS[@]}
    do
        echo -e "\n${GRE}Starting year ${year}${CLS}"
        p_out="${PATH_OUT}/${FILE_TYPE}/${region}/${year}"
        mkdir $p_out

        for month in ${MONTHS[@]}
        do
            file="${FILE_TYPE}${region}${year}${month}.dbc"
            curl -o "${p_out}/${file}" \
                "ftp://ftp.datasus.gov.br/dissemin/publicos/${SOURCE}/200801_/Dados/${file}"
            echo -e "[${GRE} OK ${CLS}] ${file}"
        done
    done
done
echo -e "${GRE}done${CLS}"
