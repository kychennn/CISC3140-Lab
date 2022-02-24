lab1:
	awk -f script.awk data_lab1/data.csv
	sort -k1 -nr total.out >> ranking.out
	sort -k4 total.out >> rankingByMake.out
	awk -f topThree.awk rankingByMake.out
