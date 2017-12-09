#sed 是以行为单位的文本处理工具 而awk是基于列的文本处理工具
#awk认为文件都是结构化的 也就是说都是由单词和各种空白字符组成的,这里的空白字符包括:
#1.空格 2.tab 3.连续的空格和tab

# ※每个非空白的部分叫做"域" 
# 从左到右分别是第一个域 第二个域 ...... "$1" "$2"表示第一第二个域 "$0"表示所有域

#1.打印指定域 
awk '{print $1, $4}' awk_practice.txt #只打印姓名和电话号码

awk '{print $0}' awk_practice.txt #打印全部内容

#2.指定打印分隔符
#默认情况下awk是使用空白字符作为分隔符的 但是可以通过参数"-F"参数指定分隔符 区分不同的域

awk -F . '{print $1}' awk_practice.txt #只打印所有人的名字

awk -F . '{print $1, $2}' awk_practice.txt

#3.内部变量NF 查看每行的列数
#awk_practice.txt文件一目了然 很容易看出前三行只有 但是如果文件很大的情况下 靠观察就不太现实了
#通过awk的内部变量"NF"可以轻易的做到这点

awk '{print NF}' awk_practice.txt #查看每行的列数

awk -F . '{print NF}' awk_practice.txt

#4.打印固定区域
#通过内部变量可以简单的得到每行的列数 如果在"NF"前加上"$"符号 则代表最后一列
#这样不管每行有多少列 只要使用$NF就能打印除最后一列

awk '{print $NF}' awk_practice.txt #使用"NF"打印最后一列

awk '{print $(NF-1)}' awk_practice.txt #使用(NF-1)打印倒数第二列

#5.截取字符串
#通过使用substr()函数对指定域进行截取字符串:
#该函数的基本使用方法如下:
#substr(指定域$n,该域第一个开始字符的位置,该域结束位置) ※结束位置可以为空 这样默认输出到该域的最后一个字符

cat awk_practice.txt | awk '{print substr($1,6)}' #输出第一个域中第1个字符到第6个字符的内容

#6.确定字符串的长度
#使用内部变量"length"可以确定字符串的长度

cat awk_practice.txt | awk '{print length}' #包括空格














