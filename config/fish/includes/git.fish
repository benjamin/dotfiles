set fish_git_dirty_color red

function parse_git_dirty
  if test (git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)"
    echo (set_color $fish_git_dirty_color)"*"(set_color normal)
  else
    echo ""
  end
end

function parse_git_branch
  # git branch outputs lines, the current branch is prefixed with a *
  set -l branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  echo $branch(parse_git_dirty)
end
