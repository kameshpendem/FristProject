#!/bin/sh

echo "installation setup for ubuntu #V22"
 apt update 

echo "Visual studio installation"
# snap install --classic code
echo "visual studio is installed"

echo "java installation"
 apt install openjdk-11-jdk -y
echo "java version can be seen below"
java -version

echo "android studio installation "
 #apt-get install snapd
 #snap install android-studio --classic
echo "android studio hasbeen installed"
 apt update

echo "***Node -js installation ***"
 apt install nodejs
source ~/.bashrc 
 apt install -y npm 
echo "node -version"
node -v
echo "we will use node-16.15.1 version "
nvm  install 16.15.1 -y
echo "making node 16.15.1 default one "
#nvm alias default 16.15.1
#source ~/.bashrc
echo"node version"
node -v
echo "node installation sucess"

echo "*** git setup ***"
 apt install git -y
echo "git version" 
git --version
echo "git configurations/ creditinals "
read -p  "git hub user-name" GIT_USERNAME
if [ "$GIT_USERNAME" = "" ]; then 
echo "no git hub name found "
exit 0;
fi 

read -p  "git hub user-email" GIT_USERMAIL
if [ "$GIT_USERMAIL" = "" ]; then 
echo "no git hub mail found "
exit 0;
fi 

git config --global user.name "${GIT_USERNAME}"
git config --global user.email "${GIT_USERMAIL}"
echo "check your creditinals "
git config --list

echo "php installation"
 add-apt-repository -y ppa:ondrej/php
 apt-get install -y php7.2 php7.2-fpm php7.2-curl php7.2-gd php7.2-mysql php7.2-sqlite3 sqlite3 php7.2-zip php7.2-xml phpqrcode 

echo "python instalaltion"
 apt install -y python3
echo "python version"
python3 --version

