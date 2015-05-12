# ~/.bash_profile should be super-simple and just load .profile and .bashrc (in that order)

if [ -f ~/.profile ]; then
	. ~/.profile
fi 

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

