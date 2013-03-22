#!/bin/sh
#
# compare font in current package version and previous package version
# and output list
#

set -e

# sfddiff output should be English
export LANG=C

SNAPSHOT="http://snapshot.debian.org"

SOURCE_PACKAGE=`dpkg-parsechangelog |grep ^Source: |cut -d' ' -f2`
PREVIOIUS_VERSION=`dpkg-parsechangelog --count 2|grep "^ "$SOURCE_PACKAGE"" | cut -d' ' -f3 | sed -e s/\(// |sed -e s/\)//|tail -n1`

if [ ! -f ../"$SOURCE_PACKAGE"_"$PREVIOIUS_VERSION".dsc ]; then
	PREVIOUS_SOURCE=`curl -s $SNAPSHOT/package/"$SOURCE_PACKAGE"/"$PREVIOIUS_VERSION" | grep dsc | cut -d'"' -f2`
	(cd ../; dget -d -q "$SNAPSHOT"/"$PREVIOUS_SOURCE")
fi

TMPDIR=/tmp/glyphdiff.`mkpasswd $0` ; dpkg-source -x ../"$SOURCE_PACKAGE"_"$PREVIOIUS_VERSION".dsc "$TMPDIR" > /dev/null

FONTS=`ls *[ttf,ttc]`

if [ ! -x /usr/bin/sfddiff ]; then
	echo "Please check sfddiff (fontforge package) is installed"
else
	for font in $FONTS
	do 
		sfddiff "$TMPDIR"/"$font" ./"$font" \
	       	    |grep "Glyph.*differs"|cut -d' ' -f4|sed -e s/”//|sed -e s/“// |sed -e s/uni// > ../"$font"_list.txt
		~/bin/convert_glyph.py >> ../"$font"_glyph.txt
	done
fi
