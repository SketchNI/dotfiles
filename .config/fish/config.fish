if status is-interactive
    # Commands to run in interactive sessions can go here
end


set -U fish_history_ignore_dups yes
set -U fish_history_ignore_spaces yes
set -U fish_history_max 100000
set -U fish_history_file_size 200000

if test -x /usr/bin/lesspipe
    eval (SHELL=/bin/sh lesspipe)
end


alias ls 'ls --color=auto'
alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'
alias dup 'docker compose up -d'
alias ddown 'docker compose down'
alias dir 'dir --color=auto'
alias vdir 'vdir --color=auto'

alias grep 'grep --color=auto'
alias fgrep 'fgrep --color=auto'
alias egrep 'egrep --color=auto'

set -Ux PATH /home/sdf/.local/bin /home/sdf/.composer/vendor/bin $PATH

function fish_greeting
    echo (set_color d78787)(date "+%a")(set_color normal), (set_color d78787)(date "+%d %b %Y")(set_color normal), (set_color 5fafff)(date "+%I")(set_color normal):(set_color 5fafff)(date "+%M") (date "+%^p")(set_color normal) on (set_color d787ff)$hostname(set_color normal).
end

set -U fish_greeting

set -g fish_term24bit 1


function fish_prompt
    set -l PE '$'
    if fish_is_root_user
        set PE '#'
    end
    printf '%s[%s]%s [%s%s%s@%s%s%s:%s%s%s]%s%s%s ' (set_color a8a8a8) (date "+%H:%M:%S") (set_color a8a8a8) \
     (set_color 5fafff) $USER (set_color d78787) (set_color d787ff) (prompt_hostname) (set_color d78787) \
     (set_color ffaf87) (prompt_pwd -d 1) (set_color a8a8a8) (set_color 5fafff) $PE (set_color normal)
end
