#根据参数循环捕获指定变量，用于批量执行命令案例
case $1 in
"start"){
    for i in node1 node2 node3
    do
        echo $i $1
    done
};;
"stop"){
    for i in node1 node2 node3
    do
        echo $i $1
    done
};;
"status"){
    for i in node1 node2 node3
    do
        echo $i $1
    done
};;
esac