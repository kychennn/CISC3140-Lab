lab1:
	awk -f script.awk data_lab1/data.csv
	sort -k1 -nr total.out >> ranking.out
	#sort -k4,4 -s ranking.out >> rankingAndMake.out
	#awk 'word!=$4{count=1;word=$4} count<=3{print; count++}' rankingAndMake.out > topThreeEachMake.out
