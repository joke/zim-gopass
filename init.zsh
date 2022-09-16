(( ${+commands[gopass]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[gopass]:-"$(${commands[asdf]} which gopass 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_gopass
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion -s zsh >| $compfile
} ${0:h}