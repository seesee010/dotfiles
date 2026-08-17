# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

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
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# I want to always be in ~/devo
mkdir -p ~/devo
cd ~/devo

# Add zig to the path
path+=("$HOME/.inPath/zig")
# set that git will always see my branch as "the right one" so it will be pushed!
git config --global push.autoSetupRemote true

# some nvim func(), because i always write them wrong!
nivm() {
	# just redirect to nvim
	nvim "$@"
}

vi() {
	# just redirect to nvim
	nvim "$@"
}

vim() {
	# just redirect to nvim
	nvim "$@"
}

# because aur is really dangerous, here a quick way to prove if package `$1` is infected:
aur-check() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: aur-check <package> [package2] ..." >&2
        return 1
    fi

    local cache="${XDG_CACHE_HOME:-$HOME/.cache}/aur-malware-list.txt"
    local cache_max_age=86400  # 1 day, seconds

    local need_refresh=1
    if [ -f "$cache" ]; then
        local age=$(( $(date +%s) - $(stat -c %Y "$cache" 2>/dev/null || stat -f %m "$cache") ))
        [ "$age" -lt "$cache_max_age" ] && need_refresh=0
    fi

    if [ "$need_refresh" -eq 1 ]; then
        local urls=(
            "https://raw.githubusercontent.com/lenucksi/aur-malware-check/master/data/campaigns/aur-infected/packages.txt"
            "https://raw.githubusercontent.com/lenucksi/aur-malware-check/master/data/campaigns/aur-infected/packages-extra.txt"
            "https://raw.githubusercontent.com/lenucksi/aur-malware-check/master/data/campaigns/chaos-rat/packages.txt"
            "https://raw.githubusercontent.com/lenucksi/aur-malware-check/master/data/campaigns/russian-spam/packages.txt"
        )
        local tmp; tmp=$(mktemp)
        local ok=0
        for u in "${urls[@]}"; do
            curl -fsS "$u" >> "$tmp" 2>/dev/null && ok=1
        done
        if [ "$ok" -eq 0 ]; then
            echo "Error: could not fetch any malware list (network issue?)." >&2
            rm -f "$tmp"
            [ -f "$cache" ] || return 1
            echo "Falling back to stale cache." >&2
        else
            mkdir -p "$(dirname "$cache")"
            sort -u "$tmp" -o "$cache"
            rm -f "$tmp"
        fi
    fi

    local exit_code=0
    for pkg in "$@"; do
        if grep -qiFx "$pkg" "$cache"; then
            echo "INFECTED — DO NOT INSTALL: $pkg"
            exit_code=2
        else
            echo "Clean: $pkg"
        fi
    done
    return "$exit_code"
}

# done by a really dumb clanker - I am not in charce for that dumb code.
loc() {
	local query="$1"
	local target="$HOME/$query"

	if [[ -z $query ]]; then
		if ! cd "$HOME"; then
			echo "Could not go into the $HOME directory"
		fi
		return 0
	fi

	if [[ -d $target ]]; then
		if ! cd "$target"; then
			echo "Could not cd into $target"
		fi
		return 0
	fi

	target=$(
		find "$HOME" \
			\( \
				-path '*/.cache' \
				-o -path '*/.git' \
				-o -path '*/node_modules' \
				-o -path '*/.local/share/Trash' \
			\) -prune \
			-o -type d -print 2>/dev/null |
		fzf --filter="$query" |
		head -n 1
	)

	if [[ -n $target ]]; then
		cd "$target"
		return 0
	fi

	echo "Directory not found!"
	return 1
}
