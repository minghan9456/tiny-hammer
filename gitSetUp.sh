echo Hello, Tell me what is your name.
read username
echo Hi $username
dir="/home/$username/.ssh/"
echo Check $dir dir is exists or not.

if [ -d "$dir" ]; then
        echo "Dir exists."
else
        echo "Do you want to create new dir? (y/n)"
        read userRet
        if [ $userRet = "y" ]; then
                echo "OK. Do it."
                mkdir $dir
        else
                echo "Sorry that dir is necessary. Bye~~~~~~"
                exit 0
        fi
fi

echo Tell me what is your git name.
read gitName
echo Hi $gitName

echo Tell me what is your git email.
read gitEmail
echo Hi $gitEmail

ssh-keygen -t rsa -C $gitEmail

eval "$(ssh-agent -s)"

ssh-add $dir"id_rsa"

cat $dir"id_rsa.pub"
