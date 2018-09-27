echo "Enter the number till you want fibonacci series printed"

read limit

first_num=0
second_num=1

echo $first_num
echo $second_num

while [ $limit -gt 1 ]
do
	show=$(($first_num + $second_num))
	echo $show
	first_num=$second_num
	second_num=$show
	limit=$(($limit - 1))
done
