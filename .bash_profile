export PS1='\[\033[94;1m\]\w\[\033[m\] '
export CLICOLOR=1
export LSCOLORS=exFxBxDxCxegedabagacad

alias startMongo='mongod --auth --port 27017 --dbpath /data/db';
alias ls='ls -1'
alias gp='git pull'
alias gh='git push'
alias ga='git add .'
alias ng='code /usr/local/etc/nginx/nginx.conf'

code() {
  open -a 'Visual Studio Code' $1;
}
openTheStuff() {
  open -a 'Spotify';
  open -a 'Firefox';
  open -a 'Visual Studio Code';
  open -a 'Astro';
  open -a 'Slack';
  open -a 'Messages';
  open -a 'Hyper';
  open -a 'ForkLift';
  open -a 'spacework';
}
gc() {
  git commit -m "$1"
}
g() {
  git add .;
  git commit -m "$1";
  git pull;
  git push;
}
killProcess() {
  lsof -t -i tcp:$1 | xargs kill
}
transfer() { 
  if [ $# -eq 0 ]; 
  then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; 
  return 1; fi
  tmpfile=$( mktemp -t transferXXX ); 
  if tty -s; 
  then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); 
  curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; 
  else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile;
  printf "\n"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
