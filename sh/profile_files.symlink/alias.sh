echo "$fg[blue] > $reset_color Running aliasses"

# neoVim ipv default vi
#alias vi='nvim'
alias vi='vim'
#alias vim='nvim'

alias vimrc='vim ~/.vimrc'
alias profile='vim ~/.profile_files'
alias zshrc='vim ~/.zshrc'
alias dus='du -sh -d1 * | gsort -h'

function encrypt { gpg --output $1.gpg --encrypt --recipient 743F90E1 $1; }
function decrypt { gpg --decrypt $1;}

function gstt {
  for dir in */     # list directories in the form "/tmp/dirname/"
  do
    dir=${dir%*/}      # remove the trailing "/"
    if [[ $dir != '.' ]]; then
      cd ${dir}    # print everything after the final "/"
      if [ -n "$(git status --porcelain)" ]; then
        echo '================================='
        echo $dir
        echo '================================='
        git status
      fi
      cd ..
    fi
  done
}


us() {
  setxkbmap us
}
usi() {
  setxkbmap us -variant intl
}

swap() {
  setxkbmap -option caps:swapescape
}

vitenscp() {
  git archive -o $@.zip HEAD
  mv $@.zip ~/ownCloud/Vitens/
}

unalias z
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}
 

kube-reapply() {
  KUBECONFIG=$PWD/secrets/admin.conf kubectl delete -f $*
  KUBECONFIG=$PWD/secrets/admin.conf kubectl apply -f $*
}

agent() {
  ssh-agent > ~/.ssh-agent
  cat ~/.ssh-agent | eval
  ssh-add
}

function umcg {
	sudo mkdir -p /Volumes/umcg
	sudo sshfs imac:/Users/$USER/ /Volumes/umcg
}
resize() {
   convert $1 -resize 1920 $1
}

reducefunction() {
   convert $1 -strip -quality 75 $1
}
alias reduce=reducefunction

csvconvert() {
    result=`cat $1 | sed -e s/\,/\./g -e s/\;/\,/g`
    echo $result > $1
}

rtest() {
  echo -e "library('mockery'); library('doRNG');testthat::auto_test_package('.')" | R --no-save
}

rdoc() {
  echo -e "devtools::document()" | R --no-save
  echo -e "pkgdown::build_site()" | R --no-save
  rm /tmp/rdoc.pdf
  R CMD Rd2pdf -o /tmp/rdoc.pdf man/*.Rd
  open /tmp/rdoc.pdf
}

rcov() {
  Rscript -e 'covr::package_coverage()'
}

rcheck() {
  PACKAGE_NAME=`basename "$PWD"`
  DIR=/tmp/$PACKAGE_NAME
  LOGDIR=/tmp/$PACKAGE_NAME-log
  rm -rf $DIR
  rm -rf $LOGDIR
  cp -r . $DIR
  mkdir $LOGDIR
  #R CMD INSTALL --no-multiarch --with-keep.source ~/$PACKAGE_NAME
  R CMD build $DIR
  R CMD check $DIR/$PACKAGE_NAME\_0.0.1.tar.gz --no-manual -o $LOGDIR
  cat $LOGDIR/$PACKAGE_NAME.Rcheck/00install.out 
  rm -rf $DIR
}

csv() {
  cat $1 | sed -E 's/([,;])([,;])/\1 \2/g' | column -s\; -t | less -N -S
}

csv-col() {
  awk -F "\"*;\"*" "{print \$$2}" $1
}

hist() {
   history | grep $1
}

blurfunction() {
       convert $1 -blur 0x8 $1
}
alias blur=blurfunction

texwordsfunction() {
	detex $1 | wc -w
}
alias texwords=texwordsfunction

rijmfunction() {
    curl -X GET "http://www.rijm.nu/rijmen/rijmen.php?woord=$1" 2>/dev/null | \grep -E "^[a-z]+<BR>$" | LC_ALL=C sed -E "s/<BR>//" | \grep -vE "^[A-Z]" | column
}
alias rijm=rijmfunction

# Ruby
alias be='bundle exec'
alias bu='bundle update'
alias bec='bundle exec rails c'
alias bes='bundle exec rails s'
alias ber='bundle exec rspec'

alias ando='slackcat -c ando'
alias frbls='slackcat -c frbl'
alias pando='pbpaste | slackcat -s -c ando'
alias epando='pbpaste | catacomb emerencia | slackcat -s -c ando'

alias generatetest='find app | grep "\.rb" | sed -e "s/^app/spec/g" -e "s/\.rb/_spec\.rb/g" | xargs touch'

workspace='/Users/$USER/Workspace/roqua'

# General
alias ip='curl icanhazip.com'
alias evionix='ssh donno@evionix.org -p1406'
alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop'
alias recreate='sh ~/Drive/dotfiles/create.sh'
alias ssh_login='source ~/shared_bin/ssh_login'
alias resource="source ~/.zshrc"
alias :q="exit"
alias .ssh="vi ~/.ssh"
alias slack-update='brew cask uninstall --force slack; brew cask install slack'
dtouch(){
  touch `date +"%y%m%d_"`$1
}
dvi(){
  vi `date +"%y%m%d_"`$1
}

alias history-top10="history | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n10"

alias mysql-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'

# Directories
alias p='cd ~/Drive/RuG/PhD/Papers/2015/'
alias frbl='cd ~/Workspace/frbl'
alias roqua='cd ~/Workspace/roqua'
alias phd='cd ~/Drive/RuG/PhD'
alias pp='cd ~/Drive/RuG/PhD/Snippets/Papers'
alias drive='cd ~/Drive'
alias vault='cd ~/Vault'
alias dot='cd ~/Drive/dotfiles'


# Forwards
alias forward='networksetup -setsocksfirewallproxy Wi-Fi localhost 8080;ssh -D 8080 -C -q -N donno@evionix.org -p1406;networksetup -setsocksfirewallproxystate Wi-Fi off'
alias forwards='networksetup -setsocksfirewallproxystate Wi-Fi off'
alias forward-umcg='networksetup -setsocksfirewallproxy Ethernet localhost 8080;ssh -C -q -N stag-fizzy-web1 ;networksetup -setsocksfirewallproxystate Ethernet off'
alias intranet='ssh -D 8080 -C -q -N stag-fizzy-web1&; networksetup -setsocksfirewallproxy Wi-Fi localhost 8080;open http://intranet.med.umcg.nl'
alias i='ssh work.evionix.org'
alias ivpn='sshuttle --dns -vr imac 0/0 --disable-ipv6'

# Python
alias virtualenv3='virtualenv -p /usr/local/bin/python3.4'
alias use-virtualenv='source venv/bin/activate'
alias pi='use-virtualenv; pip install -r requirements.txt; pip install -r test-requirements.txt'

pipf(){
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
pip3f(){
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# HoeGekIsNL
alias hgicon='heroku run rails c -a hoe-gek-is-nederland'
alias hgicons='heroku run rails c -a hoe-gek-is-nederland-staging'
alias hgi='VAR=`echo "select response_token from Subscriptions where profile_id = 1 order by profile_id desc limit 1" | heroku pg:psql -a hoe-gek-is-nederland | sed -n 3p | tr -d " "`; open "https://hoegekis.nl/dagboekonderzoek?id=$VAR"'

# Physiqual
alias phycon='heroku run rails c -a physiqual'

alias rs="$HOME/shared_bin/rs"

# Latex
alias latexmk='latexmk -pdf'
alias library-update='cp ~/Drive/RuG/PhD/Papers/library.bib .'

lmk() {
  latexmk -pvc -interaction=nonstopmode $1
}

detexg() {
  detex $1 | sed -e 's/ \././g'
}

# Applications

skimfunction() {
	(/Applications/Skim.app/Contents/MacOS/Skim $1 &)
}
alias skim=skimfunction
alias :q="exit"
alias clock="watch -t -n1 'date'"

# Brew update
alias caskroom="cd /opt/homebrew-cask/Caskroom/"

# SSH restart
alias rs-ssh='sudo launchctl stop com.openssh.sshd'
alias anonymous='tor &; pid=$!;networksetup -setsocksfirewallproxy Wi-Fi localhost 9050; read; networksetup -setsocksfirewallproxystate Wi-Fi off; kill $pid'

# GIT
alias gr='git reflow'
alias gl='git track; git pull'
alias gv='vim `git diff --name-only`'
alias gcob='g cob'

# docker / kube
alias k='kubectl'
alias d='docker'
alias dc='docker-compose'
alias dcbu='dc down; dc build; dc up;'

# Torrenting
torrentfunction() {
	tmux -c 'echo HOI$1; /usr/local/bin/transmission-cli -p 25000 $1'
}
alias torrent=torrentfunction
echo "$fg[blue] > $reset_color Finished aliasses"

alias heroku-rs='heroku ps:restart worker.1 -a differentiatie-production; heroku ps:restart web.1 -a differentiatie-production'

hnkscreen() {
  xrandr --newmode "3440x1440_75.00"  533.87  3440 3712 4088 4736  1440 1441 1444 1503  -HSync +Vsync
  xrandr --addmode DP-1 "3440x1440_75.00"
  xrandr --output DP-1 --mode "3440x1440_75.00"
}

pronkridderscreen() {
  xrandr --newmode "2560x1080_60.00"  230.76  2560 2728 3000 3440  1080 1081 1084 1118  -HSync +Vsync
  xrandr --addmode HDMI-1 "2560x1080_60.00"
  xrandr --output HDMI-1 --mode "2560x1080_60.00"
}

tripled() {
  xrandr --output HDMI-1 --auto
  xrandr --output VGA-1 --auto
  xrandr --output LVDS-1 --auto
  xrandr --output HDMI-1 --right-of LVDS-1
  xrandr --output VGA-1 --right-of HDMI-1
  #xrandr --output HDMI-1 --left-of VGA-1
}

duald() {
  xrandr --output VGA-1 --off
  xrandr --output HDMI-1 --auto
  xrandr --output LVDS-1 --auto
  xrandr --output HDMI-1 --left-of LVDS-1
}

dualdrighthnk() {
  xrandr --output VGA-1 --off
  xrandr --output HDMI-1 --auto
  xrandr --output DP-1 --auto
  xrandr --output LVDS-1 --auto
  xrandr --output eDP-1 --auto
  xrandr --output HDMI-1 --right-of LVDS-1
  xrandr --output HDMI-1 --right-of eDP-1
  xrandr --output DP-1 --right-of eDP-1
}

dualdright() {
  xrandr --output VGA-1 --off
  xrandr --output HDMI-1 --auto
  xrandr --output LVDS-1 --auto
  xrandr --output eDP-1 --auto
  xrandr --output HDMI-1 --right-of LVDS-1
  xrandr --output HDMI-1 --right-of eDP-1
}

dualdvgar() {
  xrandr --output HDMI-1 --off
  xrandr --output VGA-1 --rotate left --auto
  xrandr --output LVDS-1 --auto
  xrandr --output VGA-1 --right-of LVDS-1
}

dualdvga() {
  xrandr --output HDMI-1 --off
  xrandr --output VGA-1 --auto
  xrandr --output LVDS-1 --auto
  xrandr --output eDP-1 --auto
  xrandr --output VGA-1 --right-of LVDS-1
  xrandr --output VGA-1 --right-of eDP-1
}

singled() {
  xrandr --output HDMI-1 --off
  xrandr --output VGA-1 --off
  xrandr --output DP-1 --off
  xrandr --output LVDS-1 --auto
  xrandr --output eDP-1 --auto
}

