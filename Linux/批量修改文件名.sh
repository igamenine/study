# 批量修改文件名/批量添加文件名后缀
for i in * ; do mv $i $i".jpg" ; done 
# 批量修改后缀
rename   's/\.m_p_4_/.mp4/' *.m_p_4_ 
rename   's/\.e_x_e_/.exe/' *.e_x_e_

find . -name "*.ass" -exec rename 's/.ass/.rar/' {} \;

find . -name "*.rar" -exec rename 's/ケフィリア\・ニール/a/' {} \;？