#/dev/null - Use to send unwanted output of program
Syntax:
> command > /dev/null

vd:
```
$ ls > /dev/null
$ rm > /dev/null
```

#Local and Global Shell variable (export command)
Global variable

Syntax:
> export variable1, variable2,.....variableN

<ỉmg src="_ 42 ">

#Conditional execution i.e. && and ||
The syntax for AND

Syntax:
> command1 && command2

command2 được thực hiện khi và chỉ khi command1 returns là 0.

The syntax for OR list as follows

Syntax:
> command1 || command2

command2 được thực hiện khi và chỉ khi command1 returns là khác 0.

Syntax:
> command1 && comamnd2 if exist status is zero || command3 if exit status is non-zero

vd:
```
$ rm myf && echo "File is removed successfully" || echo "File is not removed"
```
#I/O Redirection and file descriptors
```
$ cat > demoscr
if [ $# -ne 2 ]
then
   echo "Error : Number are not supplied"
   echo "Usage : $0 number1 number2"
   exit 1
fi
ans=`expr $1 + $2`
echo "Sum is $ans"
```
#Function
Syntax:
```
           function-name ( )
           {
                command1
                command2
                .....
                ...
                commandN
                return
           }
```
VD:
```
$ SayHello()
{
   echo "Hello $LOGNAME, Have nice computing"
   return
}
```
để chạy hàm SayHello trên:
```
SayHello
```
#trap command
Syntax:
>trap {commands} {signal number list}

#getopts command
Syntax:
> getopts {optsring} {variable1}

tùy chọn:
* -n: Tên của động vật
* -a: tuổi của động vật
* -S: giới tính của động vật
* -w: trọng lượng của động vật
* -d: giá trị demo (nếu có các lựa chọn trên được sử dụng giá trị của chúng không được thực hiện)

#
**Selecting portion of a file using cut utility**
Tạo 2 file vs nội dung như sau (2 cột cách nhau 1 tab)
```
#file 1
sname

Sr.No     Name
11          Vivek
12          Renuka
13          Prakash
14         Ashish
15         Rani

#file 1
smark

Sr.No    Mark
11          67
12          55
13          96
14          36
15          67
```
Syntax:
> cut -f{field number} {file-name}

#Putting lines together using paste utility
Syntax:
> paste {file1} {file2}

VD:
```
paste sname smark
```

<img src="_ 43">

#The join utility

Syntax:
> join {file1} {file2}

VD:
```
$join sname smark
```

thay thế h=>3, 2=>x
```
 tr "h2" "3x" < sname
```

#sed utility - Editing file without using editor

Syntax:
> sed {expression} {file}

<img src="_ 44">

<img src="_ 45">

#Removing duplicate lines using uniq utility

<img src="_ 46">

#Finding matching pattern using grep utility
<img src="_ 47">
