#!/bin/sh first.sh
echo 'hello world!'

# shell没有单行注释 每一行都要加一个"#"
# --------------------------------
# 就像这样
# --------------------------------

# 变量
# 1.定义变量
#   定义变量时 变量名不加"$"美元符号
#   ※定义变量时 "=" 等号两边不可以用空格的
#   如果有空格 会出现first.sh: line 14: your_name: command not found错误
your_name="jst"

# 除了显示的定义变量 还可以用变量给语句赋值 如⬇️
echo '----------------'
echo 'The JST_Project directory include:\n'
for file in `ls /Users/jiangshantao/`
do
	echo $file
done
echo '----------------'
# 2.使用变量
#   使用变量时,只需在变量名前加"$"美元符号即可
my_name="Shantao Jiang"
echo $my_name
echo ${my_name}
 
# ※变量名外面的花括号是可选的,加不加都可以,加花括号可以帮助解释器识别变量的边界
#  比如下面这种情况:
for lanuage in Python Shell Android Java; do
	echo "I'm good at ${lanuage}Script"
done
#  如果不给lanuage变量加花括号，写成echo "I am good at $lanuageScript"，
#  解释器就会把$lanuageScript当成一个变量（其值为空），代码执行结果就不是我们期望的样子了。
#  推荐给所有变量加上花括号，这是个好的编程习惯。IntelliJ IDEA编写shell script时，IDE就会提示加花括号。

printf "======================== \n"

# 3.字符串
#   字符串是shell编程中最常用的数据类型（处理数字和字符串也没啥好用的了）
#   ※单引号‘’里的任何字符都会原样输出，单引号字符串中的变量是无效的 ※单引号字符串中不能出现单引号，对单引号使用转义符也不行
str_1='this is a srting'

#	※双引号“”里可以有变量，可以有转义符
my_last_name="Jiang"
str_2="Hello! I know your last name,It's \"$my_last_name\" \n " 
echo $str_2

#	拼接字符串
my_name_1="jiangshantao"
greeting_1="hello,$my_name_1 !"
greeting_2="hello,${my_name_1} !"
echo $greeting_1 $greeting_2

#   获取字符串长度
string_a="abcd"
echo ${#string_a} #输出4

#	提取字符串
string_b="bytedance is a great company!"
echo ${string_b:1:4} #输出yted

#echo 返回命令结果 
# ※注意 这里使用的是"`"反引号; 不是 "'"单引号!
echo `date`
echo "可以加\"-n\"命令 例如 echo -n \"文本\"
date" 

#执行后效果⤵️:
#Sun Nov 26 21:13:26 CST 2017

#echo输出的字符串总结
#===================================================================
#       |能否引用变量 |  能否引用转移符  | 能否引用文本格式符(如：换行符、制表符)
#单引号  |    否     |       否       |              否
#双引号  |    能     |       能       |              能
#无引号  |    能     |       能       |              否                          
#===================================================================













