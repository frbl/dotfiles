set editing-mode vi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/.cargo/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s "$HOME/.ssh-agent" ]] && source "$HOME/.ssh-agent"

# Make all files executable in the shared dir
if [ -d "$HOME/shared_bin" ]; then
  chmod +x $HOME/shared_bin/*
fi
chmod +x $HOME/.bin/*

if which pyenv >/dev/null; then eval "$(pyenv init -)"; fi
