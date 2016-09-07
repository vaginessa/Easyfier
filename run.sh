#!/usr/bin/bash

echo "Enter argument : <app_name> <app_url : without http://>"
read -e arguments
read -a arr <<<$arguments
AppName=${arr[0]}
URL="http:\/\/"${arr[1]}

echo $AppName ":" $URL

# Ags : appname app_url
perl -pi -e 's/APP_NAME/'$AppName'/g' nativefier.json
perl -pi -e 's/TARGET_URL/'$URL'/g' nativefier.json

# copy Nativefier.json
cp -rf nativefier.json test.app/Contents/Resources/app/nativefier.json

# copy the icone
cp -rf electron.icns test.app/Contents/Resources/

# Rename the App with your App Name
mv test.app $AppName.app

# Auto Clean package
rm -rf nativefier.json
rm -rf electron.icns
rm -rf Readme.txt
rm -rf run.sh