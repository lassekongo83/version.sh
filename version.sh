#!/bin/bash

product_version=$(cat .version)
semver=( ${product_version//./ } )
ma="${semver[0]}"
mi="${semver[1]}"
p="${semver[2]}"

read -p "Enter version type (major|minor|patch): "  ver_type

if [ $ver_type != "major" ] && [ $ver_type != "minor" ] && [ $ver_type != "patch" ];
then
  echo "Invalid input"
  exit
fi

if [[ $ver_type == "patch" ]];
then
  echo "Patch"
  let "p++"
elif [[ $ver_type == "minor" ]];
then
  echo "Minor"
  let "mi++"
  # reset p to 0
  p=0
elif [[ $ver_type == "major" ]];
then
  echo "Major"
  let "ma++"
  # reset p and mi to 0
  p=0
  mi=0
fi

echo "${ma}.${mi}.${p}" > .version
cat .version
