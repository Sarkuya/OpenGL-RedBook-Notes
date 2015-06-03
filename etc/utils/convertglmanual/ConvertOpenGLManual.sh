
rm -r ./Dist

declare -a SourceFiles=(glBindBuffer.xml glDeleteBuffers.xml glGenBuffers.xml)
echo ${SourceFiles[0]}
echo ${#SourceFiles[@]}

for f in ${SourceFiles[@]}
do
echo $f
done

xsltproc --output ./Dist/ localstyle.xsl glmansource/glGenBuffers.xml
xsltproc --output ./Dist/ localstyle.xsl glmansource/glBindBuffer.xml
xsltproc --output ./Dist/ localstyle.xsl glmansource/glDeleteBuffers.xml


