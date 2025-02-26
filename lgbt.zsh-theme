# Author: nautilor (https://github.com/nautilor)
# Repository: https://github.com/nautilor/nautilor-zsh-prompt

function git_prompt_info() {
    _omz_git_prompt_info
}

function git_prompt_status() {
  return
  # check if _omz_git_prompt_status returns a string with length > 0
  if [ -n "$(_omz_git_prompt_status)" ]; then
    echo "%{$FG[099]%}%{$BG[099]%}%{$FG[000]%} $(_omz_git_prompt_status)%{$reset_color%}%{$FG[099]%}%{$reset_color%}"
  fi
}

# * show the current hostname
purple() {
    echo "\n %{$FG[197]%}%{$FG[000]%}%{$BG[197]%}   %{$FG[197]%}%{$BG[215]%}"
}

# * show current directory, two levels deep
directory() {
    echo "%{$BG[215]%}%{$FG[000]%} %1~ %{$FG[215]%}%{$BG[222]%}%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$BG[222]%}%{$FG[000]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="  "
ZSH_THEME_GIT_PROMPT_MODIFIED="  "
ZSH_THEME_GIT_PROMPT_DELETED="  "
ZSH_THEME_GIT_PROMPT_RENAMED="  "
ZSH_THEME_GIT_PROMPT_UNMERGED="  "
ZSH_THEME_GIT_PROMPT_UNTRACKED="  "
precmd () { 
    PROMPT="%B$(purple)$(directory)$(git_prompt_info)%{$BG[114]%}%{$FG[222]%}%{$reset_color%}%{$BG[114]%}%{$FG[000]%}%{$BG[099]%}%{$FG[114]%}%{$BG[211]%}%{$FG[099]%}%{$BG[211]%}%{$FG[000]%} %% %{$reset_color%}%{$FG[211]%} %{$reset_color%} "
    RPROMPT="$(git_prompt_status)"
}
