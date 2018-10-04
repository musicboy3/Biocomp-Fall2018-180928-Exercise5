#1
cat $1 | cut -d ',' -f 1,2 | sort -t"," -k1,1 -k2n,2 > gender_exp.csv

#2
#usage bash maxmin.sh FILENAME

i="$(cat $1 | sort -n -r -t , -k 4 | head -n 1 | cut -d , -f 1,2,4)"
echo "The gender, yearsExperience, and wage for the highest earner is: $i"

j="$(cat $1 | sort -n -t , -k 4 | head -n 2 | tail -n 1 | cut -d , -f 1,2,4)"
echo "The gender, yearsExperience, and wage for the lowest earner is: $j"

k="$(cat $1 | sort -n -r -t , -k 4 | head -n 10 | grep "female" | wc -l)"
echo "The number of females in the top ten earners in this data set is: $k"

#3
a="$(cat $1 | cut -d , -f 3,4 | grep ^12 |tr ',' '\t' |  awk '{ total += $2 } END { print total/NR }')"
b="$(cat $1 | cut -d , -f 3,4 | grep ^16 |tr ',' '\t' |  awk '{ total += $2 } END { print total/NR }')"
c="$(echo "$b - $a" | bc)"
echo "Those who graduated from college (16 years of school) on average make "$c" more than people who only graduated high school (12 years of school)"
