#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR="vim"
export VISUAL="vim"
alias codigos='~/AWS_KEYS/codigos.sh'
alias vpn_DEV='sudo openvpn --config ~/VPN/develop/mfa/client.develop.mfa.ovpn'
alias vpn_DEVOPS='sudo openvpn --config ~/VPN/devops/client.ovpn.devops'
alias dell_curro='xrandr --output DP1 --scale 1x1'
alias update='sudo apt update && sudo apt upgrade -y' 
alias ll='ls -lhi --color=auto'
alias ls='ls -l --color=auto'
alias la='ls -la --color=auto'
alias lrt='ls -lrt --color=auto'
alias public_ip='curl ipinfo.io/ip'
alias password='makepasswd --chars=12 --string=".,;+[]1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" | xclip -selection c'

bindkey -L | grep '\^R' >/dev/null
bindkey "^R" history-incremental-pattern-search-backward >/dev/null

#AWS
alias aws_dev='export AWS_DEFAULT_PROFILE=dev && yes| cp -f ~/AWS_KEYS/.s3cfg.dev ~/.s3cfg >/dev/null 2>&1 && yes | cp -f ~/AWS_KEYS/.boto.dev.cfg ~/.boto >/dev/null 2>&1 && export TF_VAR_ecosystem=dev && source $HOME/AWS_KEYS/aws-auth.sh dev'
alias aws_devops='export AWS_DEFAULT_PROFILE=default && yes | cp -f ~/AWS_KEYS/.s3cfg.devops ~/.s3cfg >/dev/null 2>&1 && yes | cp -f ~/AWS_KEYS/.boto.devops.cfg ~/.boto >/dev/null 2>&1 && export TF_VAR_ecosystem=devops && source $HOME/AWS_KEYS/aws-auth.sh default'
alias aws_develop='export AWS_DEFAULT_PROFILE=develop && yes | cp -f ~/AWS_KEYS/.s3cfg.develop ~/.s3cfg >/dev/null 2>&1 && yes | cp -f ~/AWS_KEYS/.boto.develop.cfg ~/.boto >/dev/null 2>&1 && export TF_VAR_ecosystem=develop && source $HOME/AWS_KEYS/aws-auth.sh develop' 

#Alias for terragrunt
alias tplan='rm -rf .terraform  && terragrunt plan -var-file=$TF_VAR_ecosystem.tfvars'
alias tapply='rm -rf .terraform  && terragrunt apply -var-file=$TF_VAR_ecosystem.tfvars'
alias tplan_destroy='rm -rf .terraform  && terragrunt plan --destroy -var-file=$TF_VAR_ecosystem.tfvars'
alias tdestroy='rm -rf .terraform  && terragrunt destroy -var-file=$TF_VAR_ecosystem.tfvars'

#MFA codes
alias mfa_devops='bash ~/AWS_KEYS/codigos.sh devops'
alias mfa_develop='bash ~/AWS_KEYS/codigos.sh develop'
alias mfa_vpn_dev='bash ~/AWS_KEYS/codigos.sh vpn_dev'

#CAT color

alias read='pygmentize -O style=monokai -f console256 -g'


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
