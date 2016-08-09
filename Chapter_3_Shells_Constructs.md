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
For Mathematics, use following operator in Shell Script

<img src="http://i.imgur.com/VUjHZ55.png">
