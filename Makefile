lab1:
	awk -f script.awk data_lab1/data.csv
	sort -k1 -nr total.out >> ranking.out
	iwk -f topThree.awk ranking.out
	sort -k4 topThree.out >> topThreeByMake.out
