#Bắt đầu với lập trình shell

Trong phần này sẽ giới thiệu với vỏ lập trình, làm thế nào để viết script, thực hiện chúng, vv. Chúng ta sẽ bắt đầu với việc viết shell script nhỏ, mà sẽ in "Knowledge is Power" trên màn hình. Trước khi bắt đầu với điều này, bạn nên biết

* Làm thế nào để sử dụng soạn thảo văn bản như vim, xem [lệnh vim phổ biến](http://www.freeos.com/guides/lsst/misc.htm#commonvi) để biết thêm thông tin.
* lệnh chuyển hướng cơ bản

#Viết shell script như thế nào

thực hiện theo các bước sau:

(1): sử dụng bất kỳ trình soạn thảo nào bạn thích để viết shell script (mình dùng *vim* )

(2) sau khi viết shell script sử dụng lệnh sau để cấp quyền thực thi cho scripts của bạn:

> chmod permission your-script-name

vd:
```
chmod +x your-script-name
chmod 755 your-script-name
```

(3) chạy script của bạn:
```
bash your-script-name
sh your-script-name
./your-script-name
```
vd:

```
bash bar
sh bar
./bar
```

Viết script đầu tiên:
```
$ vim first
#
# My first shell script
#
clear
echo "Knowledge is Power"
```
Sau khi lưu lại bạn chạy script với lệnh sau:
> ./first

<img src="http://i.imgur.com/Iy8FwuX.png">
#Biến trong shell
Có 2 kiểu biến:
(1) Biến hệ thống  - Tạo và duy trì bởi chính Linux . Đây là loại biến được định nghĩa bằng chữ viết hoa.

(2) Biến do người dùng định nghĩa (UDV) - Tạo và duy trì bởi người dùng. Đây là loại biến được định nghĩa bằng chữ thường.

Để xem các biến hệ thống sử dụng lệnh: ```$ set```

Một số biến hệ thống quan trọng được thể hiện trong hình dưới:

<img src="http://i.imgur.com/CpkE1sV.png">

nếu bạn muốn in vị trí thư mục *home* của bạn:
> echo $HOME

*$* xác định đó là biến

#Xác định biến do người dùng định nghĩa
Sử dụng syntax sau:

> variable name=value

*value* được gán cho *variable name* và "Value" phải được viết bên phải.

VD:
> no=10

Để xác định biến gọi là 'vech' có giá trị xe Bus
> Vech = Bus

Để xác định biến gọi là n có giá trị 10
> N = 10

#Quy tắc đặt tên biến
(1) tên biến phải bắt đầu bằng chữ cái và '_ '  

vd
```
HOME
SYSTEM_VERSION
vech
no
```
(2)  Không đặt khoảng trắng ở hai bên dấu bằng khi gán giá trị cho biến
> no=10 # it's OK

(3) Phân biệt chữ hoa và chữ thường

(4) Bạn có thể định nghĩa biến NULL như sau (biến NULL là biến mà không có giá trị tại thời điểm xác định).

Ví dụ
```
$ vech=
$ vech=""
```

<img src="http://i.imgur.com/CpkE1sV.png">
(5) Không sử dụng **?**, * v.v, để đặt tên cho tên biến của bạn

#In và truy cập biến người dùng định nghĩa
*Syntax*

> variablename

Xác định biến vech và n như sau:
```
$ Vech = Bus
$ N = 10
```
Để in biến 'vech':
> Echo $vech

Nó sẽ in 'Bus'

Để in biến 'n' :
> Echo $n

giống hình sau:

<img src="http://i.imgur.com/Piptivk.png">

##answer:
Q.1.How to Define variable x with value 10 and print it on screen.

```
$ x=10
$ echo $x
```

Q.2.How to Define variable xn with value Rani and print it on screen

```
$ xn=Rani
$ echo $xn
```
Q.3.How to print sum of two numbers, let's say 6 and 3?
```
Syntax: expr   op1   operator   op2
với op1 và op2 là hai số integer
các phép toán "operator" có thể là:
+ Addition
- subtration
/ division
% modular
\* multiplication
```
> expr 6 + 3

Q.4.How to define two variable x=20, y=5 and then to print division of x and y (i.e. x/y)

```
$x=20
$ y=5
$ expr x / y
```

Q.5.Modify above and store division of x and y to variable called z

```
$ x=20
$ y=5
$ z=`expr x / y`
$ echo $z
```
Q.6.Point out error if any in following script


```
$ vi variscript
#
#
# Script to test MY knowledge about variables!
#
myname=Vivek
myos = TroubleOS
myno=5
echo "My name is $myname"
echo "My os is $myos"
echo "My number is myno, can you see this number"
```
--> answer:

```
$ vi   variscript
#
#
# Script to test MY knolwdge about variables!
#
myname=Vivek
myos   =  TroubleOS    -----> ERROR 1
myno=5
echo "My name is $myname"
echo "My os is $myos"
echo "My number is   myno,   can you see this number"  ----> ERROR 2
```
this script after bug fix:
```
$ vi   variscript
#
#
# Script to test MY knolwdge about variables!
#
myname=Vivek
myos=TroubleOS
myno=5
echo "My name is $myname"
echo "My os is $myos"
echo "My number is   $myno,   can you see this number"
```

#echo Command
Sử dụng lệnh echo để hiển thị văn bản hoặc giá trị của biến.

echo [tùy chọn] [chuỗi, biến ...]
Hiển thị văn bản hoặc các biến giá trị trên màn hình.

Tùy chọn

-n Không hiện các dòng mới.

-e Kích hoạt tính năng giải thích các dấu chéo ngược sau ký tự trong chuỗi:

\a cảnh báo (chuông)

\b backspace

\c suppress trailing dòng mới

\n dòng mới

\r trở về vận chuyển

\t tab ngang

\\ dấu chéo ngược

VD:
> echo -e "An apple a day keeps away \a\t\tdoctor\n"

**Màu mè trong LINUX CONSOLE (screen)**

Syntax:
> echo   -e  "\033[escape-code    your-message"

For e.g. following echo command prints message in Blue color on console
> echo -e "\033[34m   Hello Colorful  World!"

<img src="http://i.imgur.com/FY0gW7y.png">

Following table show important list of such escape-code/action letter or character

<img src="http://i.imgur.com/lCCUzLx.png">

**Shell Built in Variables**

<img src="http://i.imgur.com/F2qCT8y.png">

# Shell Arithmetic
Syntax:
```
expr op1 math-operator op2
```
VD:
```
$ expr 1 + 3
$ expr 2 - 1
$ expr 10 / 2
$ expr 20 % 3
$ expr 10 \* 3
$ echo `expr 6 + 3`
```
**More abou Quotes**

Ba loại quotes:

<img src="http://i.imgur.com/JANWWxb.png">

<img src="http://i.imgur.com/rkptCpy.png">

# Exit Status

# The read Statement
Syntax:
```
read variable1, variable2,...variableN
```
Lấy dữ liệu đầu vào (dữ liệu từ người dùng) từ bàn phím và lưu trữ (dữ liệu)trong biến.

```
$ vim sayH
#
#Script to read your name from key-board
#
echo "Your first name please:"
read fname
echo "Hello $fname, Lets be friend!"
```

Run it as follows:
```
$ chmod 755 sayH
$ ./sayH
```

<img src="http://i.imgur.com/zLULHmO.png">
#Wild cards (Filename Shorthand or meta Characters)
[..-..] Một cặp ký tự cách nhau bởi một dấu trừ biểu thị một phạm vi.

VD:

<img src="http://i.imgur.com/jBNJoRU.png">

#Nhiều câu lệnh trên một dòng lệnh
Syntax:

> command1;command2

Vd:
> date;who

Sẽ in ngày hôm nay theo sau bởi những người dùng đang đăng nhập.

Lưu ý không thể sử dụng:

> date who

<img src="http://i.imgur.com/iAxnwPh.png">

#Redirection of Standard output/input i.e. Input - Output redirection
Lệnh
```
$ ls
```
sẽ hiện kết quả lên màn hình

Nhưng ta có thể đưa kết quả vào file với dòng lệnh sau:
```
$ ls >filename
```
Có 2 kỹ tự chuyển hướng chính: **>**, **>>**, **<**

(1)Ký tự chuyển hướng:  >

Kết quả output của dòng lệnh sẽ được đưa vào file. Nếu file đã tồn tại sẽ bị ghi đè hoặc tạo file mới

Syntax:

> Linux-command > filename

vs
```
$ ls > myfiles
```
Bây giờ nếu "myfiles" đã tồn tại thì sẽ bị ghi đè như tạo một file mới

(2) Ký tự chuyển hướng: >>

Như ký tự chuyển hướng trên nhưng dữ liệu trong file đã tồn tại không bị mất đi mà được viết thêm vào

Syntax:
> Linux-command >> filename

VD:
```
$ date >> myfiles
```
(3) Ký  tự chuyển hướng: <

Syntax:
> Linux-command < filename

Để lấy dữ liệu đầu vào từ file thay vì từ bàn phím

```
$ cat < myfiles
```

```
$ cat sorted_names
ashish
babu
vivek
zebra
#Ctrl + D to save and exit
$ sort < sname > sorted_names
```
**sort**: các tên được sắp xêp, đầu vào từ file sname và đầu ra là sorted_names.

<img src="http://i.imgur.com/jwZSyif.png">
```
$ tr "[a-z]" "[A-Z]" < sname > cap_names
$ cat cap_names
VIVEK
ASHISH
ZEBRA
BABU
```

**tr** : chuyển chữ thường thành chữ in hoa

<img src="http://i.imgur.com/QHd5eoq.png">
```
$ sort > new_sorted_names < sname
$ cat new_sorted_names
```
<img src="http://i.imgur.com/F3hqy3a.png">

#PIPES
<img src="http://i.imgur.com/s5wRPMw.png">

Pipe như bộ nhớ tạm, lưu đầu ra của lệnh trước đó làm đầu vào của lệnh tiếp theo.

Syntax:
> command1 | command2

VD:

<img src="http://i.imgur.com/XEOLQCI.png">

#Filter
VD ta có một file number.txt gồm 100 dòng hiện số từ 1 đến 100 [tạo file tự động bằng python]():
> tail +20 < number.txt | head -n30 >hlist

#Linux Command Related with Process

most commonly used command(s) with process:

<img src="http://i.imgur.com/9kIK5L7.png">

Để tìm tiến trình đang chạy trong phiên làm việc:

```
$ ps ax | grep mp3-process-name
```
Để loại bỏ tiền trình
```
$ kill  PID
$ killall  mp3-process-name
```
