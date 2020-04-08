touch reference-toc.md
m4 reference.m4 > reference.md
pandoc reference.md --toc --template=toc.template -o reference-toc.md
m4 reference.m4 > reference.md

m4 header.m4 reference-manual.m4 > reference-manual.md

if [ -z "`which pandoc`" ]; then 
 echo "error: pandoc not installed"
 exit 1
fi

pandoc help.md -t plain > help.txt



m4 header.m4 fino.1.md | pandoc -s -t man -o fino.1




for i in 0* 1*; do
  if [ -d ${i} ]; then 
    sed 's/^#/##/' ${i}/README.m4 | \
    sed "s/(\(.*\).svg)/(${i}\/\1.svg)/" | \
    sed "s/(\(.*\).png)/(${i}\/\1.png)/" | \
    sed 's/text{/r{/g' | \
    sed "s/include(\(.*\))/include(${i}\/\1)/" | \
    grep -v 'case.m4' | \
    grep -v 'yaml_header' | \
    grep -v 'case_nav' | \
    grep -v 'case_header' | \
    grep -v 'dnl online' > ${i}.m4
  fi  
done


m4 header.m4 fino.md | \
  pandoc --toc --template template.texi \
         --filter pandoc-crossref -o fino.texi
sed -i 's/@verbatim/@smallformat\n@verbatim/' fino.texi
sed -i 's/@end verbatim/@end verbatim\n@end smallformat/' fino.texi         

