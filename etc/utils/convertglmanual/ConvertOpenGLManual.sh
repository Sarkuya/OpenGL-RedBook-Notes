
export XSL_STYLESHEET="localstyle.xsl"
export SOURCE_DIR="glmansource"
export DIST_DIR="Dist"

rm -r $DIST_DIR

mkdir -p Dist/included

cp -r glmansource/included Dist

declare -a SourceFiles=(
	glBindBuffer.xml glDeleteBuffers.xml glGenBuffers.xml
)

# echo ${SourceFiles[0]}
# echo ${#SourceFiles[@]}

for f in ${SourceFiles[@]}
do
xsltproc --output $DIST_DIR/$f $XSL_STYLESHEET $SOURCE_DIR/$f
done






