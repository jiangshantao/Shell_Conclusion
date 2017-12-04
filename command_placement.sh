#!/bin/bash

#Shell脚本中最有用的特性之一就是可以从命令输出中提取信息,并将其付给变量^_^
#把输出赋予给变量之后,就可以在脚本中进行使用了,这个特性在处理脚本数据时非常方便
#有两种方法可以将明令输出赋予给变量:
#1.使用反引号字符"`"

testing=`date`
echo "testing is: $testing"

#2.使用"$()"格式
testing_2=$(date)
echo "testing_2 is: $testing_2"

#以上两种将输出:testing is: 2017年12月 2日 星期六 22时35分41秒 CST

cd /Users/jiangshantao/Desktop
today=$(date +%y%m%d)
#ls -al /usr/bin > $today.log
#sleep 10
#rm -rf 1*.log

#执行↑命令将会在桌面生成一个当前时间为名称的log文件 里面包含/usr/bin目录下面文件 之后过10秒钟删除该文件

#在脚本中使用bc
#有几种方案可以解决bash中数学运算的整数限制,最常见的方案就是使用内建的bash计算器,叫做bc
#bc其实是种编程语言 它允许在命令中输入浮点表达式 然后解释并计算该表达式 最后返回计算结果
# $ bc 
#会出现几行欢迎语句 如下
#bc 1.06
#Copyright 1991-1994, 1997, 1998, 2000 Free Software Foundation, Inc.
#This is free software with ABSOLUTELY NO WARRANTY.
#For details type `warranty'.
#使用参数 -q 可以不显示↑信息

#浮点运算是由内建变量scale控制的,必须将这个值设置为你希望结果中保留的小数位数,否则无法得到期望的结果

value=$(echo "scale=4; 3.44 / 6" | bc)
echo $value


















