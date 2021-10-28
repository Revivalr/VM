sudo apt update
sudo apt -y install vnc4server
echo 'Would you like to install a desktop environment? Installing a desktop environment will make the server slower but it will make it much easier to use.

Yes or No'
read desktop
if [ $desktop == yes ]
then
  sudo apt install xfce4 xfce4-goodies -y
else
  echo 'You are an epic pro funny gamer mlg moment dude because you chose to not install a desktop envireonment so you can hate yourself. And maybe a little bit because it saves resources.'
fi
echo '
Type in the password you want on your VNC server.
'
vncpasswd
sudo vncserver -geometry 1280x720
echo 'Which browser to install?
(0) qutebrowser(simple but fast)
(1) palemoon(good compromise)
(2) firefox(slow)
(3) all
Type in the name of the browser or the number riht next to it to select a browser to install.'
read browser
if [ $browser == qutebrowser ] || [ $browser == 0 ]
then
  echo 'Installing qutebrowser'
  sudo apt install qutebrowser
elif [ $browser == 'palemoon'] || [ $browser == 1 ]
then
  echo 'Installing palemoon'
  echo 'deb http://download.opensuse.org/repositories/home:/stevenpusser/xUbuntu_18.04/ /' | sudo tee /etc/apt/sources.list.d/home:stevenpusser.list
  curl -fsSL https://download.opensuse.org/repositories/home:stevenpusser/xUbuntu_18.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_stevenpusser.gpg > /dev/null
  sudo apt update
  sudo apt install palemoon
elif [ $browser == firefox ] || [ $browser == 2 ]
then
  echo 'Installing firefox'
  sudo apt install firefox
elif [ $browser == all ] || [ $browser == 3 ]
then
  echo 'Installing qutebrowser'
  sudo apt install qutebrowser
  echo 'Installing palemoon'
  echo 'deb http://download.opensuse.org/repositories/home:/stevenpusser/xUbuntu_18.04/ /' | sudo tee /etc/apt/sources.list.d/home:stevenpusser.list
  curl -fsSL https://download.opensuse.org/repositories/home:stevenpusser/xUbuntu_18.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_stevenpusser.gpg > /dev/null
  sudo apt -y update
  sudo apt install palemoon
  echo 'Installing firefox'
  sudo apt install firefox
else
  echo 'Fuck you! Click control+c to end the script and then run again.'
fi

sudo apt install neofetch
neofetch
sudo apt remove neofetch
touch startup.sh

echo '

Your VNC server is now setup.

'
echo 'Would you like to read the rest of the documentation. 'Yes' or 'No''
read docs
if [ $docs == yes ]
then
  sudo apt-get install w3m w3m-img
  w3m https://en.wikipedia.org/wiki/Thomas_Jefferson
else
  exit
