#!/bin/bash

#1.算数运算符
a=9 
echo "a:$a"
b=4 
echo "b:$b \n"

#执行算数运算有两种方法:
#1.用"expr"命令
#2.用"$[]"的形式#这种形式非常方便 适用于在脚本中适用

#注意:运算符与数字要有空格 
#`expr number_1 + number_2` 是对的
#`expr number_1+number_2` 是错的 最后输出的只是number_1+number_2的表达式 而不是值

#加法
addition=`expr $a + $b`
addition_1=$[$a + $b]
echo "a+b: $addition"
echo "use \$[] addition_1: $addition_1"

#减法
subduction=`expr $a - $b`
echo "a-b: $subduction"

#注意乘法的"*"需要进行转义后才能使用
#`expr num_1 \* num_2` 是正确的
#`expr num_1 * num_2` 是错误的 运行后会报 expr: syntax error 错误

#乘法
multiplication=`expr $a \* $b`
echo "a*b: $multiplication"

#除法
division=`expr $a / $b`
echo "a/b: $division"

#取余
remainder=`expr $a % $b`
echo "a%b: $remainder"

#等于
if [ $a == $b ];then
	echo "a等于b"
fi

#不等于
if [ $a != $b ];then
	echo "a不等于b"
fi

#2.关系运算符
#※关系运算符只支持数字 不支持字符串 除非字符串的值是数字

# -eq 检查两个数是否相等 相等返回true 反之返回false
if [ $a -eq $b ]
then
	echo "a -eq b: $a等于$b"
else
	echo "a -eq b: $a不等于$b"
fi

# -ne 检查两个数是否相等 不相等返回true 反之返回false
if [ $a -ne $b ]
then
	echo "a -ne b: $a不等于$b"
else
	echo "a -ne b: $a等于$b"
fi

# -gt 检查左边的数是否大于右边 如果是返回true 反之返回false
#大于 greater
if [ $a -gt $b ]
then
	echo "a -gt b : $a大于$b"
else
	echo "a -gt b : $a小于$b"
fi

# -lt 检查左边的数是否小于右边 如果是返回true 反之返回false
if [ $a -lt $b ]
then
	echo "a -lt b : $a小于$b"
else
	echo "a -lt b : $a大于$b"
fi

# -ge 检查左边的数是否大于等于右边 如果是返回true 反之返回false 
# -le 检查左边的数是否小于等于右边 如果是返回true 反之返回false 

#3.布尔运算符
# "!" 非运算符 表达式为true 返回 false; 表达式为false 返回 true
if [ $a != $b ]
then
	echo "如果a不等于b 返回:true"
else
	echo "如果a不等于b 返回:false"
fi

# "-o" 或运算符 有一个表达式为true则返回true
if [ $a -ge 100 -o $b -le 60 ]
then
	echo "如果a大于等于100 或 b小于等于60 返回:true"
else
	echo "如果a大于等于100 或 b小于等于60 返回:false"
fi

# "-a" 与运算符 两个表达式都为true 返回 true; 反之 返回false
if [ $a -lt 8 -a $b -gt 2 ]
then
	echo "如果a小于8 且 b大于2 返回:true"
else
	echo "如果a小于8 且 b大于2 返回:false"
fi

#4.逻辑运算符
# "&&" 逻辑AND
# ※使用&& / ||时候 判断条件一定要用"[[]]" 如果少[] 会报[: missing `]'error
if [[ $a != $b && $a -gt 3 && $b -le 4 ]]
then
	echo "如果a≠b 且 a>3 且 b≤4 返回:true"
else
	echo "如果a≠b 且 a>3 且 b≤4 返回:false"
fi

# "||" 逻辑OR
if [[ $a == 10 || $b == 4 ]]
then
	echo "如果a=10 或 b=4 返回:true"
else
	echo "如果a=10 或 b=4 返回:false"
fi

#5.字符串运算符
c="hehe"
d="haha"
e=""

echo "c: $c"
echo "d: $d \n"

# "=" 检查两个字符串是否相等 相等返回true; 反之 返回false
# "!=" 检查两个字符串是否相等 不相等返回true; 反之 返回false
# "-z" 检查字符串的长度(注意!是长度!!)是否为0; 为0 返回true; 反之 返回false
if [ -z $c ]
then
	echo "-z $c : 字符长度为0"
else
	echo "-z $c : 字符长度不为0"
fi

# "-n" 检查字符串的长度(注意!是长度!!)是否为0; 不为0 返回true; 反之 返回false
if [ -n $d ]
then
	echo "-n $d : 字符串长度不为0"
else
	echo "-n $d : 字符串长度为0"
fi

# str 字符串本身 检查字符串是否为空; 不为空返回true eg:[ $a ] 返回 true
if [ $e ]
then
	echo "e : 字符串不为空"
else
	echo "e : 字符串为空"
fi























