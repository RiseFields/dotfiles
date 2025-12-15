# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# https://stackoverflow.com/questions/62931101/i-have-multiple-files-of-zcompdump-why-do-i-have-multiple-files-of-these
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Instant rerun command with sudo when using sudo !!
unsetopt HIST_VERIFY

# FZF 
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

#Ls colors
_ls_colors=":ow=01;33"
zstyle ':completion::default' list-colors "${(s.:.)_ls_colors}"
LS_COLORS+=$_ls_colors
 
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshrc="vim  ~/.zshrc"
alias vimrc="vim  ~/.config/nvim"
alias wmrc="vim  ~/.config/hypr"

# General
# -l: List
# -A: show entries starting with . but not . and ..
# -G: don't print group names
# -h: human readable sizes
# -p: append / indicator to directories
# -v: sort hidden directies and files first
# -N: print entry names without quoting
alias la="ls -lAGhNpv --group-directories-first"
alias l="ls -lGhNpv --group-directories-first"
alias ldot="ls -ldF .*"
alias rm="rm -i" 

alias py="python3"

function headset() {
    if systemctl is-active bluetooth.service | grep -q "inactive"; then
        sudo systemctl start bluetooth.service
        sleep 0.5
        bluetoothctl connect 14:3F:A6:A8:44:25
    else
        bluetoothctl connect 14:3F:A6:A8:44:25
    fi
}
function togle_bluetooth() {
    if systemctl is-active bluetooth.service | grep -q "inactive"; then
        sudo systemctl start bluetooth.service && bluetoothctl
    else
        bluetoothctl
    fi
}

VENV_DIR=".venv"
function enable_venv() {
    if [ -z ${VIRTUAL_ENV+x} ]; then
        if [ ! -d "$VENV_DIR" ]; then
            python3 -m venv $VENV_DIR
        fi
        source $VENV_DIR/bin/activate
        return 0
    else
        echo "Virtual environment already activated! Deactivate with: denv"
        return 1
    fi
}

function disable_venv() {
    if [ -z ${VIRTUAL_ENV+x} ]; then
        echo "No virtual environment enabled! Activate with: venv"
        return 1
    else
        deactivate
        return 0
    fi
}

function reboot_to_windows() {
    windows_title=$(grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
    grub-reboot "$windows_title" && reboot
}

function dag_reflectie() {
    date=$(date +%D | tr \/ _)
    filename="zr_$date.md"
    nvim "/home/woutm/Documents/SolarTeam/Notes/DagReflectie/$filename"
}

alias windows='reboot_to_windows'
alias bt='togle_bluetooth'
alias hs='headset'
alias vim="nvim"

# Ctrl-R with fzf to search trough command history
eval "$(fzf --zsh)"

alias :q="exit"

# SolarTeam
alias st="cd /home/woutm/Documents/SolarTeam"
alias stm="cd /home/woutm/Documents/SolarTeam/Monitoring && vim ."
alias stn="cd /home/woutm/Documents/SolarTeam/Notes && vim . && git add * && git commit -m \"Autocommit Linux - $(date)\" && git push -u origin master"
alias zr="dag_reflectie"
alias todo="vim /home/woutm/Documents/SolarTeam/Notes/TODO.md"

alias venv='enable_venv'
alias denv='disable_venv'
alias stella="cd /home/woutm/Documents/SolarTeam/Monitoring/stella/MonitoringInfinite && source .venv/bin/activate && py Stella.py -convoy_car BRAINS"
