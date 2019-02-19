if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# # "serve 3000" will start webserve on port 3000 and open the browser to localhost:3000
# function serve() {
#   port=$1
#   if [ $#  -ne  1 ]
#   then
#     port=8000
#   fi
#   open http://localhost:$port && python -m SimpleHTTPServer $port;
# }

# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport() {
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

# get gzipped size
function gz() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# Extract archives - use: extract <file>
# Credits to http://dotfiles.org/~pseup/.bashrc
function extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) rar x $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Compresses a PDF using ghostscript.
compresspdf() {
  gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

function renew_gcert_ifneeded() {
  # Ensures the certificate will last a standard workday
  HOURS_TILL_EOB=$((20 - $(date +%-H)))h
  gcertstatus -ssh_cert_comment=corp/normal -check_remaining=$HOURS_TILL_EOB || gcert
}

function renew_bagpipe_ifneeded() {
  p4 info > /dev/null 2>&1 || p4 bagpipe-prodaccess
}

function prodaccess() {
  renew_gcert_ifneeded && renew_bagpipe_ifneeded && cd .
}

# Sublime
export EDITOR='subl -w'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

alias server="serve -p 8080 --compress"

# Chrome remote debugging
alias remotedebug="adb forward tcp:9222 localabstract:chrome_devtools_remote"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# Chromium src
# export PATH=$PATH:~/projects/chrome/chromium-src/depot_tools
# export PATH=$PATH:~/projects/chrome/chromium/depot_tools

# Go
export GOPATH=$HOME/projects/go-code
export PATH=$PATH:$HOME/projects/go-code/bin
#export PATH=$PATH:$HOME/projects/scripts/gsutil

#export TERM="xterm-color"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'
# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
# export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH

# Polymer publish to gh-pages script
# PATH="/Users/ericbidelman/projects/github/polymer/dev/tools/bin:${PATH}"
# export PATH

# Ruby gems
# PATH="$PATH:/Users/ericbidelman/.gem/ruby/2.2.0/bin"
# export PATH

# Homebrew stuff
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

export P4CONFIG=.p4config
export P4EDITOR=subl # Or your choice of editor
