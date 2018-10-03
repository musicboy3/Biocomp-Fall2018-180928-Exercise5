#usage bash maxmin.sh FILENAME

i="$(cat $1 | sort -n -r -t , -k 4 | head -n 1 | cut -d , -f 1,2,4)"
echo "The gender, yearsExperience, and wage for the highest earner is: $i"

j="$(cat $1 | sort -n -t , -k 4 | head -n 2 | tail -n 1 | cut -d , -f 1,2,4)"
echo "The gender, yearsExperience, and wage for the lowest earner is: $j"

k="$(cat $1 | sort -n -r -t , -k 4 | head -n 10 | grep "female" | wc -l)"
echo "The number of females in the top ten earners in this data set is: $k"
