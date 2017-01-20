set fish_greeting

set -gx LC_ALL en_GB.UTF-8
set -gx LC_CTYPE en_GB.UTF-8

# fish will show a prompt, don't mess with my theme
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# don't allow global pip by accident when no virtualenv is sourced
set -gx PIP_REQUIRE_VIRTUALENV true

# allow global pip if necessary when no virtualenv is sourced
function gpip
    begin
        set -lx PIP_REQUIRE_VIRTUALENV
        sudo -H /usr/local/bin/pip3 $argv
    end
end

function gpip2
    begin
        set -lx PIP_REQUIRE_VIRTUALENV
        sudo -H /usr/local/bin/pip $argv
    end
end

# hacks to use XDG config location for easier backup
alias tmux "tmux -2f $HOME/.config/tmux/config"

# less, don't save any history
set -gx LESSHISTFILE /dev/null

set -gx DOTFILES "$HOME/.local/share/dotfiles/"

# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias dot "git --git-dir=$DOTFILES --work-tree=$HOME"

# homebrew
set -gx HOMEBREW_CASK_OPTS "--appdir=$HOME/Applications"

set -gx PATH "$HOME/.local/share/bin/" $PATH
