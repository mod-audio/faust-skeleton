#!/bin/bash

cd $(dirname $0)

if [ "$(ls plugin/*.dsp 2>/dev/null | wc -l)" -ne 1 ]; then
  echo "Missing or multiple faust files, please copy one and only one to the plugin folder"
  exit 1
fi

set -e

if [ -n "${FAUST_AUTOMATED}" ]; then
    NAME="${FAUST_NAME}"
    BRAND="${FAUST_BRAND}"
    SYMBOL="${FAUST_SYMBOL}"
    DESCRIPTION="${FAUST_DESCRIPTION}"
    LV2_CATEGORY="${FAUST_LV2_CATEGORY}"
else
    echo "Please type your plugin name, then press enter to confirm"
    read NAME

    if [ "${NAME}"x == ""x ]; then
      echo "Empty plugin name, cannot continue"
      exit 1
    fi

    BRAND="FAUST"
    SYMBOL=$(echo ${NAME} | sed -e "s/[^A-Za-z0-9._-]/_/g")
    DESCRIPTION="FAUST based audio plugin, automatically generated via faust-skeleton"
    LV2_CATEGORY="lv2:Plugin"
fi

URI="urn:faust:${SYMBOL}"
ID1=$(echo ${SYMBOL} | cut -c 1)
ID2=$(echo ${SYMBOL} | rev | cut -c 1)

function run_faustpp() {
  faustpp \
    -Dbrand="${BRAND}" \
    -Ddescription="${DESCRIPTION}" \
    -Did1="${ID1}" \
    -Did2="${ID2}" \
    -Dlv2category="${LV2_CATEGORY}" \
    -Dlv2uri="${URI}" \
    -Dname="${NAME}" \
    -Dsymbol="${SYMBOL}" \
    $@ \
    plugin/*.dsp
}

echo "NAME = ${SYMBOL}" > source/.plugin-info

run_faustpp -a source/DistrhoPluginInfo.h.in -o source/DistrhoPluginInfo.h
run_faustpp -a source/FaustGeneratedPlugin.cpp.in -o source/FaustGeneratedPlugin.cpp
