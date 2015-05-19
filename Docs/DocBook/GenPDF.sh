export DOCBOOK_DIR="/usr/share/sgml/docbook"
export DOCBOOK_XSL_DIR="$DOCBOOK_DIR/xsl-stylesheets"
export FOP_DIR="$DOCBOOK_DIR/fop-1.1"

rm Dist/pdf/*.fo Dist/pdf/*.pdf

mkdir -p Dist/pdf/images/custom
mkdir -p Dist/pdf/images/docbook

cp -r IMAGES/* Dist/pdf/images/custom
cp -r $DOCBOOK_XSL_DIR/images/* Dist/pdf/images/docbook

xsltproc --xinclude --output Dist/pdf/SampleBook.fo --stringparam fop1.extensions 1 XSL/pdf.xsl Content/SampleBook.xml
$FOP_DIR/fop -c C:/cygwin/usr/share/sgml/docbook/fop-1.1/conf/fop.xconf Dist/pdf/SampleBook.fo Dist/pdf/SampleBook.pdf
