##########################################################################
# Title      :	dusage - show top 10 disk usage users
# Author     :	Shivam Sood <shivamsood89@gmail.com>
##########################################################################


PN=`basename $0`
VER='1.2'

Usage () {
	echo >&2 "$PN - show top 10 directory users,
	usage: $PN . . . [directory . . . ]"

	exit 1
}

[ $# -gt 0 -a "$1" = "-h"] && usage


echo "NAME		       BYTES	FILES	PERCENT"

ls -lL "$@" |
		awk '
			(NF == 8 || NF == 9 ) {			# BSD or SYSV
	    		Usage [$3] += $(NF-4)	    # used bytes, username is index
	    		Count [$3]++
	    		TotalBytes += $(NF-4)
			}
		
			END {
		    		for ( user in Usage ) {
		    			if ( TotalBytes != 0 ) {
			    			percent = Usage [user] * 100 / TotalBytes
						} 
						else {
			    			percent = 0
						}
						printf "%-15s %12d	%d	%2d\n", \
			    			user, Usage [user], Count [user], percent
	    			}
				}


		' | sort -nr | head

exit 0
