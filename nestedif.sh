osch=0

echo "1. Unix (Sun Os)"
echo "2. Linux (Red Hat)"
echo -n "Select your os choice [1 or 2]? "
read osch

if [ $osch -eq 1 ] ; then
	echo "you Pick up Unix (Sun Os)"
else #### nested if i.e. if within if #####
	if [ $osch -eq 2 ] ; then
		echo "You Pick up Linux (Red Hat)"
	else
		echo "what you don't like Unix/Linux Os. "
	fi
fi
