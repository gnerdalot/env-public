export PATH=$HOME/venv/default/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

d=$HOME/venv/default/bin
if test -d $d
then
	PATH=$d:$PATH
fi

echo $zshenv
