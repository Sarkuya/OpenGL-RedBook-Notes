
XSL_FILE="localstyle.xsl"
SOURCE_DIR="glmansource"
DIST_DIR="Dist"

rm -r $DIST_DIR

mkdir -p Dist/included
cp -r glmansource/included Dist

declare -a SourceFiles=()

# echo ${SourceFiles[0]}
# echo ${#SourceFiles[@]}

for f in $SOURCE_DIR/*.xml
do
FILE="${f/'glmansource/'/}"
SourceFiles=("${SourceFiles[@]}" $FILE)
done

for f in ${SourceFiles[@]}
do
echo $f
xsltproc --output $DIST_DIR/$f $XSL_FILE $SOURCE_DIR/$f
done
