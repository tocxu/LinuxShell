if [ $# -ne 2 ]
then
   echo "Error : Number are not supplied"
   echo "Usage : $0 number1 number2"
   exit 1
fi
ans=`expr $1 + $2`
echo "Sum is $ans"

