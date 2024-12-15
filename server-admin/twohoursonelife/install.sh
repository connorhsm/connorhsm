#!/bin/bash
set -ex

WORKDIR="/mnt/server"

cd $WORKDIR

rm -rf build/

mkdir -p build

### Checkout minorGems ###
cd $WORKDIR/build
git clone https://github.com/twohoursonelife/minorGems.git
cd minorGems
git fetch --tags
minorGemsVersion=$(git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/2HOL_v* | sed -e 's/2HOL_v//')
git checkout -q 2HOL_v$minorGemsVersion

### Checkout OneLife ###
cd $WORKDIR/build
git clone https://github.com/twohoursonelife/OneLife.git
cd OneLife
git fetch --tags
oneLifeVersion=$(git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/2HOL_v* | sed -e 's/2HOL_v//')
git checkout -q 2HOL_v$oneLifeVersion

### Checkout OneLifeData7 ###
cd $WORKDIR/build
git clone https://github.com/twohoursonelife/OneLifeData7.git
cd OneLifeData7
git fetch --tags
oneLifeDataVersion=$(git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/2HOL_v* | sed -e 's/2HOL_v//')
git checkout -q 2HOL_v$oneLifeDataVersion

### Compile the server ###
cd $WORKDIR/build/OneLife/server

./configure 1
make
./makeDBConvert

### Setup the runtime structure ###
cd $WORKDIR

echo $oneLifeVersion > serverCodeVersionNumber.txt

cp -r build/OneLife/server/OneLifeServer OneLifeServer
cp -r build/OneLife/server/settings settings
cp -r build/OneLife/server/*Names.txt .

cp -r build/OneLifeData7/categories categories
cp -r build/OneLifeData7/objects objects
cp -r build/OneLifeData7/transitions transitions
cp -r build/OneLifeData7/tutorialMaps tutorialMaps
cp -r build/OneLifeData7/dataVersionNumber.txt dataVersionNumber.txt

latestVersion=$oneLifeVersion
if [ $oneLifeDataVersion -gt $oneLifeVersion ]; then
	latestVersion=$oneLifeDataVersion
fi
echo $latestVersion > versionNumber.txt

### Clean up ###
rm -rf $WORKDIR/build

## install end
echo "-----------------------------------------"
echo "Installation completed..."
echo "-----------------------------------------"
