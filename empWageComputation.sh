#!/bin/bash -x
declare -A dailyWage

present=1
present_half=2
hourlyWage=20
Days_max=20
MAX_WORKING_HR=70

totalWorkHR=0
day=1

function workingHR(){
local emp=$1
local empHrs=0
#selection
case $empCheck in
$present)
empHrs=8;;
$present_half)
empHrs=4;;
*)
empHrs=0;;
esac
echo $empHrs
}

while [ $day -le $Days_max ] && [ $totalWorkHR -lt $MAX_WORKING_HR ]
do
#variable
empCheck=$(( RANDOM % 3 ))
#calling a function
empHrs="$( workingHR $empCheck )"
#calculation
totalWorkHR=$(( totalWorkHR + empHrs ))
#storing daily wages to an dictionary of key contains day_(1-20)
dailyWage[$day]=$((empHrs * hourlyWage))
((day++))
done
totalSalary=$(( totalWorkHR * hourlyWage ))
echo "DAYS"${!dailyWage[@]}
echo "daily_Wage:"${dailyWage[@]}
