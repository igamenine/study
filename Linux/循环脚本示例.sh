# 输出1-10000的数字并循环填充至test.txt
# 当in是数字时使用{}，当in的是字符时直接打出来，如for app in qbxt bsis bigdata
for i in {1..1000}
do
  echo $i >> test.txt
done

