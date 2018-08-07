#
# Executes commands at the start of an interactive session.
#
#Open tmux
#if [ "$TMUX" = "" ]; then tmux; fi
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

export EDITOR="vim"
export VISUAL="vim"
alias codigos='~/AWS_KEYS/codigos.sh'
alias update='sudo apt update & sudo apt upgrade -y' 
alias ll='ls -lhi --color=auto'
alias ls='ls -l --color=auto'
alias la='ls -la --color=auto'
alias lrt='ls -lrt --color=auto'
alias public_ip='curl ipinfo.io/ip'
alias password='makepasswd --chars=12 --string=".,;+[]@#1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" | xclip -selection c'
alias history='fc -l -50'
alias cob='git pull origin master && git checkout -b $1'

bindkey -L | grep '\^R' >/dev/null
bindkey "^R" history-incremental-pattern-search-backward >/dev/null

#AWS
export AWS_DEFAULT_REGION=us-east-1
alias aws_dev='export AWS_DEFAULT_PROFILE=dev && export TF_VAR_ecosystem=dev && source $HOME/AWS_KEYS/aws-auth.sh dev'
alias aws_devops='export AWS_DEFAULT_PROFILE=devops && export TF_VAR_ecosystem=devops && source $HOME/AWS_KEYS/aws-auth.sh devops'
alias aws_develop='export AWS_DEFAULT_PROFILE=develop && export TF_VAR_ecosystem=develop && source $HOME/AWS_KEYS/aws-auth.sh develop' 
alias aws_prod='export AWS_DEFAULT_PROFILE=prod && export TF_VAR_ecosystem=prod && source $HOME/AWS_KEYS/aws-auth.sh prod' 
alias aws_demo='export AWS_DEFAULT_PROFILE=demo && export TF_VAR_ecosystem=demo && source $HOME/AWS_KEYS/aws-auth.sh demo' 

#Alias for terragrunt
alias tplan='rm -rf .terraform  && terragrunt plan'
alias tapply='rm -rf .terraform  && terragrunt apply'
alias tplan_destroy='rm -rf .terraform  && terragrunt plan --destroy'
alias tdestroy='rm -rf .terraform  && terragrunt destroy'

#MFA codes
alias mfa_devops='bash ~/AWS_KEYS/codigos.sh devops'
alias mfa_dev='bash ~/AWS_KEYS/codigos.sh dev'
alias mfa_develop='bash ~/AWS_KEYS/codigos.sh develop'
alias mfa_demo='bash ~/AWS_KEYS/codigos.sh demo'
alias mfa_vpn='bash ~/AWS_KEYS/codigos.sh vpn_dev'
alias mfa_prod='bash ~/AWS_KEYS/codigos.sh prod'
alias mfa_lasstpass='bash ~/AWS_KEYS/codigos.sh lastpass'

#Docker
alias drun="docker container run"
alias dls="docker container ls -a"
alias dps="docker ps -l"
alias dstop="docker stop"
alias dstart="docker start"
alias dlogs="docker logs"
alias dtop="docker top"
alias dstats"docker stats"
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

#CAT color
alias read='pygmentize -O style=monokai -f console256 -g'

#VPN
alias valant_vpn='mfa_vpn && sudo openvpn --config ~/VPN/develop/mfa/client.develop.mfa.ovpn'

# History
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword


# Various
setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt MULTIOS                  # Now we can pipe to multiple outputs!
setopt AUTO_PUSHD               # This makes cd=pushd
setopt AUTO_NAME_DIRS           # This will use named dirs when possible
setopt ZLE
setopt NO_HUP
setopt EXTENDED_GLOB
setopt RC_EXPAND_PARAM
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward
bindkey "\eOP" run-help
bindkey -M vicmd "q" push-line
bindkey -M viins ' ' magic-space


#setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt clobber                # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
print -Pn "\e]0; %n@%M: %~\a"   # terminal title
