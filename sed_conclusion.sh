#!/bin/bash
##sed命令
#sed编辑器被称为流编辑器 流编辑器会在编辑器处理文本之前基于预先提供的一组规则来编辑数据流
#sed命令可以根据命令来处理数据流中的数据:
#这些命令要么从命令行中输入
#要么存储在一个命令行文件中

#sed编辑器会执行以下操作:
#1.一次从输入中读取一行数据
#2.根据提供的编辑器命令匹配数据
#3.按照命令修改流中的数据
#4.将新的命令输出到STDOUT

#sed命令格式:
#sed options script file
# -e 命令行执行多个命令
# -f file 将file命令添加到已有的命令中
# -n 不产生命令输出 使用print命令输出执行结果

#1.在命令行中定义编辑器命令

echo "This is a test" | sed 's/test/big test/'

# ※重要的是sed编辑器并不会修改文件本身的数据 他只会将修改的数据发送到STDUT

#这个例子在sed编辑器中使用了"s"命令 "s"命令
#"s"命令会用斜线间指定的第二个文本字符串 替代 第一个文本字符串 在上例中是big test替代了test

#2.在命令行使用多个编辑器命令

sed -e 's/brown/green/; s/fox/dog/' test_data.txt

#两个命令都作用到文件中的每行数据中

#3.从文件中读取编辑器命令
#如果有大量要处理的sed命令,将他们放入一个单独的文件会方便一些

sed -f test_script.sed test_data.txt

#4.替换标记
# ※替换命令"s"在替换多行中的文本时 可以正常工作 但是默认情况下 它只替换每行中出现的第一处
#    要让替换命令能够替换一行不同地方出现的文本 必须使用替换标记
#    替换标记会在替换命令字符串之后放置
#    sed 's/pattern/replacement/flags'
#    有四种可用的替换标记:
#    1)数字 表示新文本将替换第几处匹配的地方
#    2)"g" 表示替换所有匹配的文本
#    3)"p" 表示原先行的内容先要打出来
#    4)"w" file 将替换的结果写入到文件中

text_1=" This is a test of the trial script.\n
      This is the second test of the test script."

text_2=" This is a test line.\n
      This is a different line."

echo  $text_1 | sed 's/test/trial/g' #替换所有

echo  $text_1 | sed 's/test/trial/2' #替换每行第二个

echo  $text_2 | sed -n 's/test/trial/p' #显示与替换命令中指定模式匹配的行

#5.替换字符
#有时你会在文本字符串中遇到一些不太方便在剃魂模式中使用的字符,Linux中常见的就是正斜线"/"
#如果你想替换当前文件所在目录为Shell_test 就要这样:

path=$(pwd)
echo $path
echo $path | sed 's/\/Shell_Conclusion/\/Shell/'

#要解决这个问题 sed编辑器允许选择其他字符作为替换命令中字符串分隔符
echo $path | sed 's!/Shell_Conclusion!/Shell_practice!' #"!"用作字符串分隔符

echo ================================

#6.使用地址
#默认情况下 sed命令作用于文本数据所有行.如果想将命令作用与特定行 或 某些行 必须使用行寻址(line addressing)
#1)使用数字表示行区间
sed '2s/brown/yellow/' test_data.txt #只修改数据流的第2行
echo ''
sed '2,3s/dog/cat/' test_data.txt #修改数据流的第2-4行
echo ''
sed '2,$s/lazy/busy/' test_data.txt #修改数据流的第2到最后一行
echo ''

#2)使用文本模式进行过滤

echo 'test↓'
sed '/fox/s/dog/hehe/' test_data_diff.txt

#二.打印命令p
#"p"命令直接将读到的命令直接打印出来

sed p test_data.txt #运行后将打印两遍 因为sed默认将读到的内容输出 使用"-n"可以禁用默认输出

echo ''

sed -n p test_data.txt 

echo ''

#1.范围限制,在"p"命令前加上增加范围限制,数字表示具体的行数,+数字表示增量,$表示最后一行,~表示间隔的行数

sed -n 1p test_data.txt #只打印test_data.txt文件中的第一行

echo ''

sed -n 1,2p test_data.txt #打印第1-2行

echo ''

sed -n '2,$p' test_data.txt #打印第3到最后一行

echo 'hehe'

sed -n '/cat/p' test_data.txt #只打印带有"cat"的行

