BEGIN {
FPAT = "([^,]+)|(\"[^\"]+\")"
FS = ","
}
{
if(NR>1){
total =0;
for(i=8; i<= NF;i++){
total+=$i
}
printf total "\t"$7"\t"$4"\t"$5"\t"$6"\n" > "total.out"
}
}
END{
}
