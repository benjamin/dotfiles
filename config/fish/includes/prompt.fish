function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
  if test "$PWD" != "$HOME"
    printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
  else
    echo '~'
  end
end

function fish_prompt
  if test (hostname | cut -d . -f 1) != "bensbook"
    printf '%s%s%s ' (set_color blue) (hostname | cut -d . -f 1) (set_color normal)
  end

  printf '%s%s' (set_color purple) (prompt_pwd)

  # Print git branch
  if test -d ".git"
    printf ' %s%s%s' (set_color normal) (set_color green) (parse_git_branch)
  end
  printf '%s ⇒ %s' (set_color -o purple) (set_color normal)
end
