a="$(cat $1 | cut -d , -f 3,4 | grep ^12 |tr ',' '\t' |  awk '{ total += $2 } END { print total/NR }')"
b="$(cat $1 | cut -d , -f 3,4 | grep ^16 |tr ',' '\t' |  awk '{ total += $2 } END { print total/NR }')"
c="$(echo "$b - $a" | bc)"
echo "Those who graduated from college (16 years of school) on average make "$c" more than people who only graduated high school (12 years of school)"
