# Direcotry navigation settings
setopt autocd
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

source "$HOME/.config/shell/aliases"
source "$HOME/.config/shell/shortcutrc"
source "$HOME/.config/shell/zshnameddirrc"

# Colors and Prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1d%{$fg[red]%}]%{$reset_color%}$%b "

# Append history immediately and other history settings
setopt INC_APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/history"

# Vi Mode
bindkey -v 
export KEYTIMEOUT=1

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M visual '^[[P' vi-delete


# Change & Delete Inner & Outer quotes, brackets, parantheses etc. 
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in vicmd; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd z change-surround
bindkey -M vicmd Z delete-surround
bindkey -M vicmd S add-surround
bindkey -M visual S add-surround

# Change directories using lf
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Directory stack navigation
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Use Ctrl O to change directories using lf
bindkey -s '^o' '^ulfcd\n'


bindkey '^[[P' delete-char # Use delete key to delte character to the right
bindkey '^[[H' beginning-of-line # Home key fix
bindkey '^[[4~' end-of-line # End key fix
bindkey '^[[1;5D' backward-word # Ctrl + left arrow
bindkey '^[[1;5C' forward-word # Ctrl + right arrow
bindkey "^H" backward-kill-word # Ctrl + backspace
bindkey "^[[M" kill-word # Ctrl + delete

# ZSH System Clipboard
source ~/.local/share/zsh/zsh-system-clipboard/zsh-system-clipboard.zsh

# Syntax Highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 
