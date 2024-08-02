#! /bin/sh

# man2pdf -- Convert manual page to PDF via PS
# Copyright (C) 2012 Matous J. Fialka, <http://mjf.cz/>
# Released under the terms of The MIT License

groff='groff -Tps -mandoc'
ps2pdf='ps2pdf -'
file=file
man='man -w'
zcat=zcat
bzcat=bzcat

if [ $# != 1 ]
then
	echo Usage: man2pdf [topic] [\>output.pdf]
	exit 1
fi

if ! location=`$man $1`
then
	exit 1
fi

case `$file $location`
in
	*gzip*)
		$zcat $location | $groff	
		;;
	*bzip2*)
		$bzcat $location | $groff	
		;;
	*troff*)
		$groff $location
		;;
esac |

$ps2pdf
