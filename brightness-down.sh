#!/bin/bash
CURRENT_BRIGHTNESS=`brightness -l | grep bright |  cut -d " " -f 4`
echo "Current brightness = $CURRENT_BRIGHTNESS"
NEXT_BRIGHTNESS=`echo $CURRENT_BRIGHTNESS-0.1 | bc`
if [[ $(echo "$NEXT_BRIGHTNESS < 0.05" | bc) -eq "1" ]]
then
	NEXT_BRIGHTNESS=0.01
fi
echo "Next brightness = $NEXT_BRIGHTNESS"
/usr/bin/brightness $NEXT_BRIGHTNESS
