echo "$fg[blue] > $reset_color Running exports"
if [[ "$OSTYPE" == "darwin"* ]]; then
  defaults write NSGlobalDomain KeyRepeat -int 1
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  defaults write -g NSDragAndDropTextDelay -int 100
fi

export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoreboth

# Editor
export EDITOR='vim'
export GIT_EDITOR='vim'
export SVN_EDITOR='vim'

# Nvim
# Use ascii backspace
#infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
#tic $TERM.ti

export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

export MENDELEY_BLACKHOLE=$HOME/Downloads/Papers/

# Programming
if [[ "$OSTYPE" == "darwin"* ]]; then
  #if [ -f /usr/libexec/java_home ]; then
  #export JAVA_HOME=$(/usr/libexec/java_home)
  #export JDK_HOME=$(/usr/libexec/java_home)
  #export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server
  #fi
  export TERM=xterm-256color
else
  export TERM=rxvt-unicode-256color
fi
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
#export JDK_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

if [ -f "$HOME/.secrets" ]; then
  source "$HOME/.secrets"
fi

export PYTHONPATH=.:/usr/local/lib/python:$PYTHONPATH
# Only run pip in a venv
export PIP_REQUIRE_VIRTUALENV=""

export PYENV_ROOT="$HOME/.pyenv"

if [ -d "/usr/local/Cellar/scala" ]; then
  export SCALA_VERSION=$(ls /usr/local/Cellar/scala/)
  export SCALA_HOME=/usr/local/opt/scala/$SCALA_VERSION
fi

if [ -d "/usr/local/Cellar/r" ]; then
  # R Files
  #if [ -z "${RVERSION}" ]; then
  #defaults write org.R-project.R force.LANG en_US.UTF-8
  #fi
  export RVERSION=$(ls /usr/local/Cellar/r/)
  export R_HOME=/usr/local/Cellar/r/$RVERSION/lib/R
  export R_LIBS_USER="~/.R/lib/$RVERSION/"
fi

export GOPATH="/Users/frbl/Workspace"

# export SSL_CERT_FILE=/Users/$USER/Workspace/$USER/cacert.pem
# Path
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin/jupyter-notebook"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/local/MacGPG2/bin"
export PATH="$PATH:/usr/texbin"
export PATH="$PATH:~/Library/Android/sdk/tools"
export PATH="$PATH:~/Library/Android/sdk/platform-tools"
export PATH="$PATH:/usr/local/bin/storm"
export PATH="$PATH:~/.sdkman/candidates/spark/current/bin"
export PATH="$PATH:~/shared_bin"
export PATH="$PATH:~/istio-1.1.4/bin"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Fabric
export IN_DIR="/Users/$USER/Workspace/roqua/deployer"

# Python
export PATH="$PATH:/usr/local/Cellar/python3"
export PATH="$PATH:/usr/local/anaconda3/bin"
export PATH="$PATH:$PYENV_ROOT/bin"

# Manpath
export MANPATH=$MANPATH:/usr/local/opt/erlang/lib/erlang/man

# Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Don't quit on CTRL+D (except for 10 in a row)
IGNOREEOF=100
stty eof undef

echo "$fg[blue] > $reset_color Finished exports"

if [[ -e /usr/libexec/java_home ]]; then
  export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
  export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
fi

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

#default java8
export JAVA_HOME=$JAVA_8_HOME

if [ -e "/tmp/a2m" ]; then
  #cat "/tmp/a2m"
fi

export XDG_CURRENT_DESKTOP=XFCE

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/frbl/.sdkman"
[[ -s "/home/frbl/.sdkman/bin/sdkman-init.sh" ]] && source "/home/frbl/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="/home/frbl/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Add RVM
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="/usr/local/opt/swagger-codegen@2/bin:$PATH"
