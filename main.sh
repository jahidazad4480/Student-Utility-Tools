#!/bin/bash

echo "====================================================="
echo "         Welcome to Student utility tools"
echo "====================================================="

while true
do


function studentUtility() {
  echo "--------------------------------------------------------"
  echo "Please select an option: "
  echo "1) Simple calculator          | 6) Number Convert"
  echo "2) Grade Calculator           | 7) Factorial Calculator"
  echo "3) Temperature Calculator     | 8) Currency Converter"
  echo "4) BMI calculator             | 9) VAT Calculator"
  echo "5) Weight to pound calculator | 10) Discount Calculator"
  echo "11) Exit "
  echo " "
  read -p "Select an option: " option
  
case $option in

    1)
echo "------------------------"
echo "    Simple Calculator"
echo "------------------------"

echo "Enter two numbers:"
read -p "First Number: " num1
read -p "Second Number: " num2
echo " "

echo "Enter operator : '+ ' ; '-' ; '*' ; '/' ; '%' "
read -p"Select operator: " op

if [ "$op" = "+" ]; then
res=$(echo "scale=2; $num1+$num2" |bc)
echo $res

elif [ "$op" = "-" ]; then
res=$(echo "scale=2; $num1-$num2" |bc)
echo $res


elif [ "$op" = "*" ]; then
res=$(echo "scale=2; $num1*$num2" |bc)
echo $res

elif [ "$op" = "/" ]; then
res=$(echo "scale=2; $num1/$num2" |bc)
echo $res

elif [ "$op" = "%" ]; then
res="$(($num1%$num2))"
echo $res


else
echo "Invalid operator"
fi
       
;;
	2)
echo "------------------------"
echo "    Grade Calculator"
echo "------------------------"
read -p "Total number of subjects: " TotalSub

echo "Enter marks of each subject: "
sum=0

for((i=1;i<=TotalSub;i++))
do
read -p "Suject $i mark: " mark

sum=$(($sum + $mark))
done

mark=$(($sum / $TotalSub))

if [ $mark -ge 80 ] && [ $mark -le 100 ]
then echo "A+"
elif [ $mark -ge 75 ] && [ $mark -le 80 ] 
then echo "A"
elif [ $mark -ge 70 ] && [ $mark -le 75 ] 
then echo "B+"
elif [ $mark -ge 65 ] && [ $mark -le 70 ] 
then echo "B"
elif [ $mark -ge 60 ] && [ $mark -le 65 ] 
then echo "D+"
elif [ $mark -ge 55 ] && [ $mark -le 60 ] 
then echo "D"
elif [ $mark -ge 45 ] && [ $mark -le 55 ] 
then echo "C+"
elif [ $mark -ge 40 ] && [ $mark -le 45 ] 
then echo "C"
else echo "F"
fi
;;

3)

echo "------------------------------"
echo "    Temperature Calculator"
echo "------------------------------"


echo "Enter 1 for celsius to fahrenheit : " 
echo "Enter 2 for fahrenheit to celsius : " 
echo "Enter 3 for celsius to kelvin : " 
echo "Enter 4 for fahrenheit to kelvin : " 
echo "Enter 5 for kelvin to celsius : " 
echo "Enter 6 for kelvin to fahrenheit : " 

read -p "Select Number: " ch

read -p "Enter  temperature: " temp

case $ch in

1)

f=$(echo "($temp * 1.8) + 32" | bc )
echo "$temp C = $f F"

;;

2)

c=$(echo "($temp - 32) / 1.8" | bc)
echo "$temp F = $c C"

;;

3)

k=$(echo "$temp + 273.15" | bc)
echo "$temp C = $k K"

;;

4)

f=$(echo "($temp * 1.8) - 459.67" | bc )
k=$(echo "($temp + 459.67) * 5/9" | bc)
echo "$temp F =  $k K"

;;
5)

c=$(echo "$temp - 273.15" | bc)
echo "$temp K = $c C"

;;

6)

k=$(echo "$temp * 1.8" | bc)
f=$(echo "($temp * 1.8) + 32" | bc )
echo "$temp K = $f F"

;;

esac
;;

4)
# BMI calculator 

echo "------------------------"
echo "    BMI Calculator"
echo "------------------------"


read -p "Enter your weight in Kgs : " weight
read -p "Enter your height in m : " height
echo " "


height=$( echo "scale=2; $height*$height" |bc)


bmi=$( echo "scale=2; $weight/$height" |bc)
echo "Your BMI is : $bmi"
if (( $(echo "$bmi < 18.5" |bc -l) )); then
echo "You are underweight."
elif (( $(echo "$bmi >25" |bc -l) )); then
echo "You are overweight."

else
echo "Your weight is normal."
fi
;;

5)

#weight to pound
echo "-------------------------------"
echo "  Weight to pound Calculator"
echo "-------------------------------"

read -p "Enter your weight in pounds: " weight

echo "$weight pounds is equal to $(bc <<< "scale=2; $weight*0.454") kilograms"
;;

6)

echo "------------------------"
echo "  Number Converter"
echo "------------------------"

read -p "Enter the number to be converted: " num

echo "Choose the base to be converted to"
echo "1. Decimal"
echo "2. Binary"
echo "3. Octal"
echo "4. Hexa-decimal"
echo " "
read -p "Select Bash: " base


case $base in
1)
echo "The decimal of $num is `echo "obase=10; ibase=2; $num" | bc`"
;;

2)
echo "The binary of $num is `echo "obase=2; ibase=10; $num" | bc`"
;;

3)
echo "The octal of $num is `echo "obase=8; ibase=10; $num" | bc`"
;;

4)
echo "The hexa-decimal of $num is `echo "obase=16; ibase=10; $num" | bc`"
;;

*)
echo "Invalid choice"
;;
esac
;;


7)

echo "------------------------"
echo "  Factorial Calculator"
echo "------------------------"



read -p "Enter the number : " num
count=1
res=1
while [ $count -le $num ]
do
res=$(($count*$res))
count=$(($count+1))
done
echo "Factorial of $num is : $res"
;;


8)

echo "------------------------------"
echo "     Currency Converter"
echo "------------------------------"

echo "1. BDT to EUR"
echo "2. BDT to USD"
echo "3. BDT to Rupee"
echo "4. EUR to BDT"
echo "5. EUR to USD"
echo "6. EUR to Rupee"
echo "7. USD to BDT"
echo "8. USD to EUR"
echo "9. USD to Rupee"
echo "10. Rupee to BDT"
echo "11. Rupee to EUR"
echo "12. Rupee to USD"

echo -e "\n"
read -p "Please select an option : " option

case $option in
    1)
    read -p "Enter amount in BDT :" BDT
	EUR=$(echo "scale=2; $BDT*0.00925"|bc)
    echo "BDT $BDT is EUR $EUR"
    ;;
    
	2)
    read -p "Enter amount in BDT :" BDT
    USD=$(echo "scale=2; $BDT*0.00964"|bc)
    echo "BDT $BDT is USD $USD"
    ;;
    
	3)
    read -p "Enter amount in BDT :" BDT
    INR=$(echo "scale=2; $BDT*0.78746"|bc)
    echo "BDT $BDT is INR $INR"
    ;;
    
	4)
    read -p "Enter amount in EUR :" EUR
    BDT=$(echo "scale=2; $EUR*104.399"|bc)
    echo "EUR $EUR is BDT $BDT"
    ;;
    
	5)
    read -p "Enter amount in EUR :" EUR
    USD=$(echo "scale=2; $EUR*1.04156"|bc)
    echo "EUR $EUR is USD $USD"
    ;;
    
	6)
    read -p "Enter amount in EUR :" EUR
    INR=$(echo "scale=2; $EUR*85.0706"|bc)
    echo "EUR $EUR is INR $INR"
    ;;
    
	7)
    read -p "Enter amount in USD :" USD
    BDT=$(echo "scale=2; $USD*100.233"|bc)
    echo "USD $USD is BDT $BDT"
    ;;
    
	8)
    read -p "Enter amount in USD :" USD
    EUR=$(echo "scale=2; $USD*0.95993"|bc)
    echo "USD $USD is EUR $EUR"
    ;;
    
	9)
    read -p "Enter amount in USD :" USD
    INR=$(echo "scale=2; $USD*81.6759"|bc)
    echo "USD $USD is INR $INR"
    ;;
    
	10)
    read -p "Enter amount in INR :" INR
    BDT=$(echo "scale=2; $INR*1.22563"|bc)
    echo "INR $INR is BDT $BDT"
    ;;
    
	11)
    read -p "Enter amount in INR :" INR
    EUR=$(echo "scale=2; $INR*0.01177"|bc)
    echo "INR $INR is EUR $EUR"
    ;;
    
	12)
    read -p "Enter amount in INR :" INR
    USD=$(echo "scale=2; $INR*0.01224"|bc)
    echo "INR $INR is USD $USD"
    ;;
    
    *)
    echo "Invalid option"
    ;;
esac
;;


9)

echo "------------------------"
echo "    VAT Calculator"
echo "------------------------"

read -p "Enter the tax rate in percentage: " rate
read -p "Enter the Price Amount: " price
echo " "

tax=$(echo "scale=2; $rate*$price/100" |bc)
echo "Total TAX is: " $tax

total=$(echo "scale=2; $tax+$price" |bc)
echo "Total Price is: " $total
;;



10)

echo "------------------------"
echo "  Discount Calculator"
echo "------------------------"
read -p "Enter sale price: " amount
read -p "Enter discount percentage: " discount

discountValue=$((amount * discount / 100))
saveValue=$((amount - discountValue))

echo "Amount is: $amount"
echo "Discount Value is: $discountValue"
echo "You will save: $saveValue"

;;

11)

# Exit the program.

echo
echo "Exiting the program..."
echo
exit 0
;;

*)
echo "Invalid option"
      ;;
  esac
}
studentUtility

echo 
done

