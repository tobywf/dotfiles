set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# fish will show a prompt, don't mess with my theme
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# don't allow pip by accident outside a virtualenv
set -x PIP_REQUIRE_VIRTUALENV true

# allow pip on purpose outside a virtualenv
function gpip3
    env PIP_REQUIRE_VIRTUALENV="" sudo -H /usr/local/bin/pip3 $argv
end

function gpip2
    env PIP_REQUIRE_VIRTUALENV="" sudo -H /usr/local/bin/pip2 $argv
end

# hacks to use XDG config location for easier backup
alias tmux "tmux -2f $HOME/.config/tmux/config"

# less, don't save any history
set -x LESSHISTFILE /dev/null

set -x DOTFILES "$HOME/.local/share/dotfiles/"

# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias dot "git --git-dir=$DOTFILES --work-tree=$HOME"

set -x PATH "$HOME/.local/share/bin" $PATH

if command -v docker-machine > /dev/null
    eval (docker-machine env --shell fish)
    # set -x DOCKER_IP (docker-machine ip)
end
