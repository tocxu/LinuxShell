#if condition
Syntax:
```
	if condition
	then
		command1 if condition is true or if exit status
		of condition is 0 (zero)
		...
		...
	fi
```
#test command or [ expr ]
Syntax:
> test expression OR [ expression ]

VD:
```
$ cat > ispostive
#!/bin/sh
#
# Script to see whether argument is positive
#
if test $1 -gt 0
then
echo "$1 number is positive"
fi
```
Run as follows:
```
$ chmod 755 ispostive

$ ispostive 5
  #5 number is positive

$ispostive -45
  #Nothing is printed

$ispostive
  #./ispostive: test: -gt: unary operator expected
```
[For Mathematics, use following operator in Shell Script](http://www.freeos.com/guides/lsst/ch03sec02.html)

<img src="http://i.imgur.com/VUjHZ55.png">

#if...else...fi
Syntax:
```
          if condition
          then
                       condition is zero (true - 0)
                       execute all commands up to else statement

          else
                       if condition is not true then
                       execute all commands up to fi
          fi
```
VD:
```
$ vim nestedif.sh
osch=0

echo "1. Unix (Sun Os)"
echo "2. Linux (Red Hat)"
echo -n "Select your os choice [1 or 2]? "
read osch

if [ $osch -eq 1 ] ; then

     echo "You Pick up Unix (Sun Os)"

else #### nested if i.e. if within if ######

       if [ $osch -eq 2 ] ; then
             echo "You Pick up Linux (Red Hat)"
       else
             echo "What you don't like Unix/Linux OS."
       fi
fi
```

<img src="http://i.imgur.com/uInHYwr.png">

Another way use

Syntax:
```
	if condition
	then
		if condition
		then
			.....
			..
			do this
		else
			....
			..
			do this
		fi
	else
		...
		.....
		do this
	fi
```
#Multilevel if-then-else
Syntax:
```
           if condition
           then
                       condition is zero (true - 0)
                       execute all commands up to elif statement
           elif condition1
           then
                       condition1 is zero (true - 0)
                       execute all commands up to elif statement  
           elif condition2
           then
                       condition2 is zero (true - 0)
                       execute all commands up to elif statement          
           else
                       None of the above condtion,condtion1,condtion2 are true (i.e.
                       all of the above nonzero or false)
                       execute all commands up to fi
           fi
```
VD:

```
$ cat > elf
#!/bin/sh
# Script to test if..elif...else
#
if [ $1 -gt 0 ]; then
  echo "$1 is positive"
elif [ $1 -lt 0 ]
then
  echo "$1 is negative"
elif [ $1 -eq 0 ]
then
  echo "$1 is zero"
else
  echo "Opps! $1 is not number, give number"
fi
```
#Loops in Shell Scripts
Bash hỗ trợ hai vòng lặp:
* for
* while

##for Loop
Syntax:
```
            for { variable name } in { list }
            do
                     execute one for each item in the list until the list is
                     not finished (And repeat all statement between do and done)
            done
```


Syntax:
```
         for (( expr1; expr2; expr3 ))
         do
               .....
			   ...
               repeat all statements between do and
               done until expr2 is TRUE

      Done
```
VD:
```
$ cat > for2
for ((  i = 0 ;  i <= 5;  i++  ))
do
  echo "Welcome $i times"
done
```
###Nesting of for Loop
```
$ vim nestedfor.sh
for (( i = 1; i <= 5; i++ ))      ### Outer for loop ###
do
    for (( j = 1 ; j <= 5; j++ )) ### Inner for loop ###
    do
          echo -n "$i "
    done

  echo "" #### print the new line ###
done
```

Ví dự hiển thị bàn cờ vua trên màn hình:
```
$ vim chessboard
for (( i = 1; i <= 9; i++ )) ### Outer for loop ###
do
   for (( j = 1 ; j <= 9; j++ )) ### Inner for loop ###
   do
        tot=`expr $i + $j`
        tmp=`expr $tot % 2`
        if [ $tmp -eq 0 ]; then
            echo -e -n "\033[47m "
        else
            echo -e -n "\033[40m "
        fi
  done
 echo -e -n "\033[40m" #### set back background colour to black
 echo "" #### print the new line ###
done
```

##while Loop
Syntax:
```
          while [ condition ]
          do
                command1
                command2
                command3
                ..
                ....
           done
```
VD:
```
$cat > nt1
#!/bin/sh
#
#Script to test while statement
#
#
if [ $# -eq 0 ]
then
   echo "Error - Number missing form command line argument"
   echo "Syntax : $0 number"
   echo " Use to print multiplication table for given number"
exit 1
fi
n=$1
i=1
while [ $i -le 10 ]
do
  echo "$n * $i = `expr $i \* $n`"
  i=`expr $i + 1`
done
```
#The case Statement
Syntax:
```
           case  $variable-name  in
                pattern1)   command
                                ...
                                ..
                                command;;
                pattern2)   command
                                ...
                                ..
                                command;;
                patternN)   command
                                ...
                                ..
                                command;;
                *)             command
                                ...
                                ..
                                command;;
           esac
```
VD:
```
$ cat > car
#
# if no vehicle name is given
# i.e. -z $1 is defined and it is NULL
#
# if no command line arg

if [ -z $1 ]
then
  rental="*** Unknown vehicle ***"
elif [ -n $1 ]
then
# otherwise make first arg as rental
  rental=$1
fi

case $rental in
   "car") echo "For $rental Rs.20 per k/m";;
   "van") echo "For $rental Rs.10 per k/m";;
   "jeep") echo "For $rental Rs.5 per k/m";;
   "bicycle") echo "For $rental 20 paisa per k/m";;
   *) echo "Sorry, I can not gat a $rental for you";;
esac
```
#de-bug the shell script
Sử dụng tùy chọn **-v** và **-x** với sh hoặc bash để debug shell script.

Syntax:
> sh   option   { shell-script-name }

hoặc

> bash   option   { shell-script-name }

Tùy chọn có thể là
* -v :
Print shell input lines as they are read.
* -x :
