#!/bin/bash
# Bash shell目前只支持一维数组（不支持多维数组）初始化不需要定义数组大小
# Shell数组用括号来表示 元素用空格来表示
# 语法格式：array_name = (value_1 value_2 ... valuen)
# 读取数组格式：${array_name[index]}

#eg:
#数组的值也可以写入变量
A=6
my_array=($A B "E" D)

#根据数组索引获取该数组元素时，数组索引可以为变量
i=2

echo "第一个元素为: ${my_array[0]}"
echo "第二个元素为: ${my_array[1]}"
echo "第三个元素为: ${my_array[$i]}"
echo "第四个元素为: ${my_array[3]}"

#使用 @ 或 * 获取数组的所有元素
echo "数组元素为: ${my_array[*]}"
echo "数组元素为: ${my_array[@]}"

#使用"#"获取数组元素的个数
echo "数组元素的个数为: ${#my_array[*]}"
echo "数组元素的个数为: ${#my_array[@]}"
