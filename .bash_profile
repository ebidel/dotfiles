if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Go
export GOPATH=$HOME/projects/go-code
export PATH=$PATH:$HOME/projects/go-code/bin

#export TERM="xterm-color"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Homebrew
export PATH=$HOME/homebrew/bin:$PATH

# NPM
# export PATH="$HOME/.node/bin:$PATH"

#export DOCKER_HOST=localhost

# Start ssh-agent for ssh prompts
#eval `ssh-agent`

# The next line updates PATH for the Google Cloud SDK.
source '/Users/ericbidelman/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/ericbidelman/google-cloud-sdk/completion.bash.inc'

# Go GAE SDK
#export PATH=~/go_appengine:$PATH


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NPM
# source /Users/ericbidelman/homebrew/opt/nvm/nvm.sh

# yarn
export PATH="$PATH:`yarn global bin`"

# my scripts
export PATH=$PATH:$HOME/projects/scripts
export PATH=$PATH:$HOME/bin
export PATH=$HOME/bin:$PATH

