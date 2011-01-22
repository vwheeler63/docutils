# $Id$
set -e
set -u #  warns if a variable is not assigned.

PWD=`pwd`
PWD=`basename $PWD`
if [ "$PWD" != 'docs' ];then
    echo 'please run the script only in its own directory (docs)'
    exit 1
fi

xsltproc xsl/document_stylesheet.xsl xsl/document_stylesheet.xsl > doc.xml
xml2txt.py doc.xml > rst/attribute_sets.rst
rst2html.py  rst/attribute_sets.rst >  html/attribute_sets.html 
# rm doc.xml

