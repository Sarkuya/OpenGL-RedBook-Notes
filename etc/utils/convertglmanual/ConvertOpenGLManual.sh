
XSL_FILE="localstyle.xsl"
SOURCE_DIR="glmansource"
SOURCE_FILES=()
DIST_DIR="../../../Docs/DocBook/OpenGLNotes/Content/references/converted"
INCLUDED_DIR="included"

rm -r $DIST_DIR

mkdir -p $DIST_DIR/$INCLUDED_DIR
cp -r $SOURCE_DIR/$INCLUDED_DIR $DIST_DIR

# echo ${SOURCE_FILES[0]}
# echo ${#SOURCE_FILES[@]}

for f in $SOURCE_DIR/*.xml
do
FILE="${f/$SOURCE_DIR\//}"
SOURCE_FILES=("${SOURCE_FILES[@]}" $FILE)
done

for f in ${SOURCE_FILES[@]}
do
xsltproc --output $DIST_DIR/$f $XSL_FILE $SOURCE_DIR/$f
done