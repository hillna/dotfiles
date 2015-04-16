# Alises
alias ll="ls -l"
alias py="python"
alias p="py"
alias sleepnow="pmset sleepnow"

# Git Aliases
alias gpullr="git pull --rebase origin master"
alias gpush="gpullr && git push origin master"
alias gstatus="git status"
alias gcommit="git commit -a"
alias gref="git rev-parse HEAD && git rev-parse HEAD | pbcopy"
alias tmuxs="tmux list-sessions"
alias tmuxa="tmux attach-session -t"

# Homebrew coreutils aliases
if [ -f /usr/local/bin/gsleep ]; then
  alias sleep="gsleep"
fi

# ENV Variables
export AWS_CONFIG_FILE=~/.awsconfig
export EC2_HOME=/opt/ec2-api-tools

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Paths
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export PATH=/opt/ec2-api-tools/bin:$PATH


# Olark
if [ -f $HOME/.olark_rc ]; then
  source $HOME/.olark_rc
  export PATH=$OLARK_APPS/marketing/node_modules/.bin:$PATH
fi

# Config
export EDITOR=vim

source ~/.zshconfig

. $HOME/.shellrc.load

