

a=$@
b=$*
for i in $a
do
  echo a的值是$i
done
for i in $b
do
  echo b的值是$i
done