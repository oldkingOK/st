#!/bin/bash
# After download https://github.com/honza/base16-st,
# type the next command to avoid compile fail:
# ls | xargs sed -i 's/static unsigned int defaultcs/unsigned int defaultcs/g'
for i in $(ls themes | grep -v light); do
	sed -i "s/themes\/.*\.h/themes\/$i/g" config.h
	echo "Testing theme $i"
	make > /dev/null
	./st 2>/dev/null
done
