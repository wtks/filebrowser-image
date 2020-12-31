#!/bin/sh

archtecture=amd64
case $TARGETPLATFORM in
"linux/amd64") archtecture=amd64 ;;
"linux/arm64") archtecture=arm64 ;;
"linux/arm/v7") archtecture=armv7 ;;
"linux/arm/v6") archtecture=armv6 ;;
*)
  echo "unsupported archtecture: $TARGETPLATFORM"
  exit 1
  ;;
esac

echo $archtecture

wget "https://github.com/filebrowser/filebrowser/releases/download/$FILEBROWSER_VERSION/linux-$archtecture-filebrowser.tar.gz" &&
  mkdir -p /filebrowser &&
  tar -C /filebrowser -xzvf "linux-$archtecture-filebrowser.tar.gz" &&
  rm "linux-$archtecture-filebrowser.tar.gz"
