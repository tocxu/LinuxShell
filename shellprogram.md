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

Bạn đã sẵn sàng viết script đầu tiên chưa?
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
