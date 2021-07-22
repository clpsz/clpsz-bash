# !/bin/bash

# check parameters
helpFunction()
{
   echo ""
   echo "Usage: $0 -h host -P port -u user -p password"
   echo -e "\t-h MySQL host"
   echo -e "\t-P MySQL port"
   echo -e "\t-u MySQL username"
   echo -e "\t-p MySQL password"
   exit 1 # Exit script after printing help
}

while getopts "h:P:u:p:" opt
do
   case "$opt" in
      h ) host="$OPTARG" ;;
      P ) port="$OPTARG" ;;
      u ) username="$OPTARG" ;;
      p ) password="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

[ -z "$host" ] && helpFunction
[ -z "$port" ] && helpFunction
[ -z "$username" ] && helpFunction
if [ -z "$password" ]
then
   # read password from stdin
   stty -echo
   printf "Enter password: "
   read password
   stty echo
   printf "\n"
else
   echo '[Warning] Using a password on the command line interface can be insecure.'
fi

echo "host=$host"
echo "port=$port"
echo "username=$username"
echo "password=$password"
