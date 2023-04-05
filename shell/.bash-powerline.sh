#!/usr/bin/env bash

## Uncomment to disable git info
#POWERLINE_GIT=0

__powerline() {
    # Colors
    COLOR_RESET='\[\033[m\]'
    COLOR_CWD=${COLOR_CWD:-'\[\033[1;42;37m\]'} # bold, green bg, grey fg
    COLOR_GIT=${COLOR_GIT:-'\[\033[0;40;37m\]'} # black bg, grey fg
    COLOR_FAILURE=${COLOR_FAILURE:-'\[\033[1;41;37m\]'} # bold, red bg, grey fg
    COLOR_USER=${COLOR_USER:-'\[\033[0;46;37m\]'} # cyan bg, grey fg
    COLOR_ROOT=${COLOR_ROOT:-'\[\033[1;43;37m\]'} # bold, orange bg, grey fg
    COLOR_HOST=${COLOR_HOST:-'\[\033[0;44;37m\]'} # blue bg, grey fg
    COLOR_HOST_USER_SEP=${COLOR_HOST_USER_SEP:-'\[\033[0;46;34m\]'} # cyan bg, blue fg
    COLOR_USER_CWD_SEP=${COLOR_USER_CWD_SEP:-'\[\033[0;42;36m\]'} # green bg, cyan fg
    COLOR_HOST_ROOT_SEP=${COLOR_HOST_ROOT_SEP:-'\[\033[0;43;34m\]'} # orange bg, blue fg
    COLOR_ROOT_CWD_SEP=${COLOR_ROOT_CWD_SEP:-'\[\033[0;42;33m\]'} # green bg, orange fg
    COLOR_CWD_GIT_SEP=${COLOR_CWD_GIT_SEP:-'\[\033[0;40;32m\]'} # black bg, green fg
    COLOR_GIT_SYMBOL_SUCCESS_SEP=${COLOR_GIT_SYMBOL_SUCCESS_SEP:-'\[\033[0;42;30m\]'} # green bg, black fg
    COLOR_GIT_SYMBOL_FAILURE_SEP=${COLOR_GIT_SYMBOL_FAILURE_SEP:-'\[\033[0;41;30m\]'} # red bg, black fg
    COLOR_SYMBOL_SUCCESS_END_SEP=${COLOR_SYMBOL_SUCCESS_END_SEP:-'\[\033[0;32m\]'} # green fg
    COLOR_SYMBOL_FAILURE_END_SEP=${COLOR_SYMBOL_FAILURE_END_SEP:-'\[\033[0;31m\]'} # red fg
    COLOR_CWD_SYMBOL_FAILURE_SEP=${COLOR_CWD_SYMBOL_FAILURE_SEP:-'\[\033[0;41;32m\]'} # red bg, green fg
    COLOR_END=${COLOR_END:-'\[\033[m\]'}

    # Symbols
    SYMBOL_GIT_BRANCH=${SYMBOL_GIT_BRANCH:- }
    SYMBOL_GIT_MODIFIED=${SYMBOL_GIT_MODIFIED:-  }
    SYMBOL_GIT_PUSH=${SYMBOL_GIT_PUSH:- }
    SYMBOL_GIT_PULL=${SYMBOL_GIT_PULL:- }
    SYMBOL_SEP=${SYMBOL_SEP:-}
    SYMBOL_SEP_2=${SYMBOL_SEP_2:-}

    case "$(uname)" in
        OpenBSD)   OS_SYMBOL='';;
        Linux)    OS_SYMBOL='';;
        *)        OS_SYMBOL='󰇄';;
    esac
    if [[ "$(which neofetch 2> /dev/null)" ]]; then
        local distro="$(neofetch distro --distro_shorthand on)"
        if [[ "$distro" == *"Manjaro"* ]]; then
            OS_SYMBOL=''
        elif [[ "$distro" == *"Raspbian"* ]]; then
            OS_SYMBOL=''
        elif [[ "$distro" == *"Ubuntu"* ]]; then
            OS_SYMBOL=''
        elif [[ "$distro" == *"Arch"* ]]; then
            OS_SYMBOL=''
        elif [[ "$distro" == *"Debian"* ]]; then
            OS_SYMBOL=''
        fi
    fi
    if [[ -z "$PS_SYMBOL" ]]; then
        PS_SYMBOL=$SYMBOL_SEP_2
    fi
    if [[ -z "$PS_ERR_SYMBOL" ]]; then
        PS_ERR_SYMBOL=' '
    fi

    __git_info() {
        [[ $POWERLINE_GIT = 0 ]] && return # disabled
        hash git 2>/dev/null || return # git not found
        local git_eng="env LANG=C git"   # force git output in English to make our work easier

        # get current branch name
        local ref=$($git_eng symbolic-ref --short HEAD 2>/dev/null)

        if [[ -n "$ref" ]]; then
            # prepend branch symbol
            ref=$SYMBOL_GIT_BRANCH$ref
        else
            # get tag name or short unique hash
            ref=$($git_eng describe --tags --always 2>/dev/null)
        fi

        [[ -n "$ref" ]] || return  # not a git repo

        local marks

        # scan first two lines of output from `git status`
        while IFS= read -r line; do
            if [[ $line =~ ^## ]]; then # header line
                [[ $line =~ ahead\ ([0-9]+) ]] && marks+=" $SYMBOL_GIT_PUSH${BASH_REMATCH[1]}"
                [[ $line =~ behind\ ([0-9]+) ]] && marks+=" $SYMBOL_GIT_PULL${BASH_REMATCH[1]}"
            else # branch is modified if output contains more lines after the header line
                marks="$SYMBOL_GIT_MODIFIED$marks"
                break
            fi
        done < <($git_eng status --porcelain --branch 2>/dev/null)  # note the space between the two <

        # print the git branch segment without a trailing newline
        printf " $ref$marks"
    }

    ps1() {
        # Check the exit code of the previous command and display different
        # colors in the prompt accordingly.
        if [[ $? -eq 0 ]]; then
            local symbol="$COLOR_SYMBOL_SUCCESS_END_SEP$PS_SYMBOL$COLOR_RESET"
            local cwd_symbol_sep=""
            local git_symbol_sep="$COLOR_GIT_SYMBOL_SUCCESS_SEP$SYMBOL_SEP$COLOR_RESET"
        else
            local symbol="$COLOR_FAILURE$PS_ERR_SYMBOL $? $COLOR_SYMBOL_FAILURE_END_SEP$PS_SYMBOL$COLOR_RESET"
            local cwd_symbol_sep="$COLOR_CWD_SYMBOL_FAILURE_SEP$SYMBOL_SEP$COLOR_RESET"
            local git_symbol_sep="$COLOR_GIT_SYMBOL_FAILURE_SEP$SYMBOL_SEP$COLOR_RESET"
        fi

        local host="$COLOR_HOST $OS_SYMBOL \h $COLOR_RESET"
        local host_user_sep="$COLOR_HOST_USER_SEP$SYMBOL_SEP $COLOR_RESET"
        local user_cwd_sep="$COLOR_USER_CWD_SEP$SYMBOL_SEP $COLOR_RESET"
        local host_root_sep="$COLOR_HOST_ROOT_SEP$SYMBOL_SEP $COLOR_RESET"
        local root_cwd_sep="$COLOR_ROOT_CWD_SEP$SYMBOL_SEP $COLOR_RESET"
        if [[ $(which realpath 2> /dev/null) ]]; then
            local realhome=$(realpath ~)
            if [[ $PWD == $realhome ]]; then
                local cwd="$COLOR_CWD \w $COLOR_RESET"
            elif [[ $PWD == $realhome* ]]; then
                local short_path="$(pwd | sed "s|$realhome|~|")"
                local cwd="$COLOR_CWD $short_path $COLOR_RESET"
            fi
        else
            local cwd="$COLOR_CWD \w $COLOR_RESET"
        fi
        if [[ $USER == "root" ]]; then
            local user="$host_root_sep$COLOR_ROOT $USER $COLOR_RESET$root_cwd_sep"
        else
            local user="$host_user_sep$COLOR_USER $USER $COLOR_RESET$user_cwd_sep"
        fi
        local cwd_git_sep="$COLOR_CWD_GIT_SEP$SYMBOL_SEP$COLOR_RESET"
        local symbol_end_sep="$COLOR_END $COLOR_RESET"
        # Bash by default expands the content of PS1 unless promptvars is disabled.
        # We must use another layer of reference to prevent expanding any user
        # provided strings, which would cause security issues.
        # POC: https://github.com/njhartwell/pw3nage
        # Related fix in git-bash: https://github.com/git/git/blob/9d77b0405ce6b471cb5ce3a904368fc25e55643d/contrib/completion/git-prompt.sh#L324
        if shopt -q promptvars; then
            __powerline_git_info="$(__git_info)"
            local git="$cwd_git_sep$COLOR_GIT\${__powerline_git_info} $COLOR_RESET$git_symbol_sep"
        else
            # promptvars is disabled. Avoid creating unnecessary env var.
            local git="$cwd_git_sep$COLOR_GIT$(__git_info) $COLOR_RESET$git_symbol_sep"
        fi

        local powerline_git_info="$(__git_info)"
        local git_length=${#powerline_git_info}
        if [[ "$git_length" -lt 1 ]]; then
            local git="$cwd_symbol_sep"
        fi

        PS1="$host$user$cwd$git$symbol$symbol_end_sep"
    }

    #PROMPT_COMMAND="ps1${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
    PROMPT_COMMAND="ps1"
}

__powerline
unset __powerline
