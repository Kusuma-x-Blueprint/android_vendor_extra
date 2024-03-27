#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  file_name=$(basename "$file_path")
  DEVICE=$(echo $TARGET_PRODUCT | cut -d "_" -f2)
  if [ -f $file_path ]; then
    file_size=$(stat -c%s $file_path)
    id=$(cat "$file_path.md5sum" | cut -d' ' -f1)
    datetime=$(grep ro\.build\.date\.utc ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2);
    rom_version=$(grep ro\.lineage\.build\.version ./out/target/product/$DEVICE/system/build.prop | grep -v plat | cut -d= -f2);
    custom_build_type=$(grep ro\.lineage\.releasetype ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2);
    if [ -d ./vendor/extra-priv ]; then
      kusuma_number=$(grep ro\.kusuma\.extra\.version\.number ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2);
      ota_url=https://github.com/Kusuma-x-Blueprint/OTA/releases/download/$kusuma_number/$(basename "$file_path")
    fi
    echo "{\n  \"response\": [\n    {\n      \"datetime\": $datetime,\n      \"filename\": \"$file_name\",\n      \"id\": \"$id\",\n      \"romtype\": \"$custom_build_type\",\n      \"size\": $file_size,\n      \"url\": \"$ota_url\",\n      \"version\": \"$rom_version\"\n    }\n  ]\n}" > $file_path.json
    cat $file_path.json
  fi
fi
