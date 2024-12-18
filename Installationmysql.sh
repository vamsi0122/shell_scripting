DATE=$(date +%F)
script=$0
LOGFILE=/tmp/$script-$DATE
RED="\e[31m"
G="\e[32m"
N="\e[0m"

#functions
Validation () {
    if [$1 -e 0]
    then
       echo -e $2 is $G sucess $N
    else
       echo -e $2 is $R failure $-n
    fi
    
}

USERID=$(id -u)
if [$USERID -ne 0]
then
    echo"No root access to install switch to root"
    exit 1 #terminate the execution here.
fi

yum install mysql -y &>>$LOGFILE
Validation $? "Installing mysql"

yum install postfix -y &>>$LOGFILE
Validation $? "Installing postfix"