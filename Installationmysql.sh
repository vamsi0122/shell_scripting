USERID=$(id -u)
if [USERID -ne 0]
then
    echo"No root access to install switch to root"
    exit 1 #terminate the execution here.
fi
yum install mysql -y