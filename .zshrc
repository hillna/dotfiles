# Alises
alias ll="ls -l"
alias py="python"
alias p="py"
alias sleepnow="pmset sleepnow"
alias steam-wine='wine ~/.wine/drive_c/Steam/Steam.exe -no-dwrite >/dev/null 2>&1 &'

if [[ $(uname |grep Linux) ]]; then
    alias python="python2"
    alias python-config="python2-config"
fi

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
export PATH=$PATH:/opt/ec2-api-tools/bin


# Olark
if [ -f $HOME/.olark_rc ]; then
  source $HOME/.olark_rc
#  export PATH=$OLARK_APPS/marketing/node_modules/.bin:$PATH
fi

# ssh-agent config
eval $(keychain --eval -Q --quiet)

source ~/.zshconfig

. $HOME/.shellrc.load

