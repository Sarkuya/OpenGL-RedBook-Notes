rm -r Dist
mkdir -p Dist/{css,images}
cp CSS/style.css Dist/css

xsltproc --xinclude --output Dist/SampleBook.html XSL/html.xsl Content/SampleBook.xml