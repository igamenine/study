unzip "*"

find . -name '*.zip' -exec unzip {} \;

ls *.zip | xargs -n1 unzip -o

for i in *.zip
do
unzip -o $i
done

ditto -V -x -k --sequesterRsrc *.zip sfc中文