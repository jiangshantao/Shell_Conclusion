4#!/bin/sh first.sh
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
echo 'The JST_Project directory include:'
for file in `ls /Users/jiangshantao/JST_Project/`
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





