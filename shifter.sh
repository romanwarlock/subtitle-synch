#!/bin/bash
if [ $# -lt 2 ];then
alf=`basename $0`;
echo -e "\nUsage:\n\n$alf [filename] [delay] \n\n";exit 0;
fi
cat "$1"|
	sed 's/ --> /:/'|
		gawk -v delay=$2 '
			BEGIN {
				FS=":"
			} 
			NF<4 {
				print $0
			} NF>4 {
			gsub(",",".");
			stime=$1*3600+$2*60+$3;
			etime=$4*3600+$5*60+$6;
			nstime=stime+delay;
			netime=etime+delay;
			sh=int(nstime/3600);
			eh=int(netime/3600);
			sm=int((nstime-sh*3600)/60);
			em=int((netime-eh*3600)/60);
			ss=nstime-sh*3600-sm*60;
			es=netime-eh*3600-em*60;
			if (sh<10) 
				sh="0"sh;
			if (sm<10) 
				sm="0"sm;
			if (ss<10) 
				ss="0"ss;
			if (eh<10) 
				eh="0"eh;
			if (em<10) 
				em="0"em;
			if (es<10) 
				es="0"es;
			if (length(es)==2) 
				es=es".000";
			if (length(ss)==2) 
				ss=ss".000";
			if (length(es)==4) 
				es=es"00";
			if (length(ss)==4) 
				ss=ss"00";
			if (length(ss)==5) 
				ss=ss"0";
			if (length(es)==5) 
				es=es"0";
			$0=sh":"sm":"ss" --> "eh":"em":"es;
			gsub("\\.",",");
			print
		}';
exit 0;
