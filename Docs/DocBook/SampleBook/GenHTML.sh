export DOCBOOK_XSL_DIR="/usr/share/sgml/docbook/xsl-stylesheets"

rm -r Dist

mkdir -p Dist/html/chunk/css
mkdir -p Dist/html/chunk/images/custom
mkdir -p Dist/html/chunk/images/docbook

mkdir -p Dist/html/single/css
mkdir -p Dist/html/single/images/custom
mkdir -p Dist/html/single/images/docbook

mkdir -p Dist/pdf/images/custom
mkdir -p Dist/pdf/images/docbook

cp -r CSS/* Dist/html/chunk/css
cp -r CSS/* Dist/html/single/css

cp -r IMAGES/* Dist/html/chunk/images/custom
cp -r $DOCBOOK_XSL_DIR/images/* Dist/html/chunk/images/docbook
cp -r IMAGES/* Dist/html/single/images/custom
cp -r $DOCBOOK_XSL_DIR/images/* Dist/html/single/images/docbook
cp -r IMAGES/* Dist/pdf/images/custom
cp -r $DOCBOOK_XSL_DIR/images/* Dist/pdf/images/docbook

xsltproc --xinclude --output Dist/html/single/SampleBook.html XSL/html.xsl Content/SampleBook.xml
xsltproc --xinclude --output Dist/html/chunk/SampleBook.html XSL/chunk.xsl Content/SampleBook.xml

/cygdrive/C/Users/Sarkuya/AppData/Local/Google/Chrome/Application/chrome.exe Dist/html/chunk/index.html