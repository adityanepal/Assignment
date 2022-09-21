#!/bin/sh
clear
addRecord(){
	echo "Enter Name"
	read name
	echo "enter Phone No"
	read ph_no
	echo "enter Email"
	read email
	value=$(cat address_book.txt | grep $email | wc -w)
	if [ $value -gt 0 ]
	then
	old=$(cat address_book.txt | grep $email)
	sed -i s/"$old"/"$name $ph_no $email"/g address_book.txt
	echo "Record Edited as this record was already entered"
	displayRecord
	else
	echo "$name $ph_no $email" >> address_book.txt
	displayRecord
	echo "Records were added"
	fi
	sleep 5
}
searchRecord(){
	echo "Enter Searching Records"
	read searchvalue
	searchedvalue= grep $searchvalue address_book.txt
	echo "$searchedvalue"
	sleep 5
}
editRecord(){ 
	displayRecord
	echo "Enter Any Email whose record you want to edit" 
	read email 
	value=$(cat address_book.txt | grep $email | wc -w) 
	if [ $value -gt 0 ]; 
	then 
	echo "Enter Name" 
	read name 
	echo "Enter Phone Number" 
	read ph_no 
	old=$(cat address_book.txt | grep $email) 
	sed -i s/"$old"/"$name $ph_no $email"/g address_book.txt 
	echo "Record Edited" 
	displayRecord
	else 
	echo"no records were found" 
	fi 
	echo "Editing Records" 
	displayRecord
	sleep 5
}
removeRecord(){
	displayRecord
	echo "Enter Any Email whose record you want to Delete"
	read email
	value=$(cat address_book.txt | grep $email | wc -w)
	if [ $value -gt 0 ]
	then
	sed -i /"$email"/d address_book.txt
	echo "Record Deleted"
	else
	echo "no records were found"
	fi
	sleep 5
}
displayRecord(){ 
	cat address_book.txt
}
INPUT_STRING="yes" 
while [ "$INPUT_STRING" != "bye" ] 
do 
printf "Please 
  type something in 1 to add new address book,
		2 to edit address book, 3 to delete addressbook, 4 to 
		search addressbook!!!!.
 "
read ANSWER
if [ "$ANSWER" = "1" ];
then
clear
addRecord
elif [ "$ANSWER" = "2" ];
then
clear
editRecord
elif [ "$ANSWER" = "3" ]; then
clear
removeRecord
elif [ "$ANSWER" = "4" ]; then
	clear
	searchRecord
else
	exit 0
fi
echo "do you want to exit,type bye"
read INPUT_STRING
echo "You typed: $INPUT_STRING"
done
