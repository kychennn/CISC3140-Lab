BEGIN {
FPAT = "([^,]+)|(\"[^\"]+\")"
FS = ","
printf "ranking \t car_id \t year \t car_make \t car_model \n" > "topThreeByMake.out"
}
{
if(NR>1){
if(make==$5){
for(i=1;i<=3;i++){
printf "\t"$7"\t"$4"\t"$5"\t"$6"\n" > "topThree.out"
}
}
}
}
END{
}
