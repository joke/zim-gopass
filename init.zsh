(( ${+commands[gopass]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[gopass]:-"$(${commands[asdf]} which gopass 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_gopass
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'gopass'. Regenerated completions.
  fi
} ${0:h}
