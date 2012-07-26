set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH /usr/local/bin $PATH
set NODE_PATH /usr/local/lib/node_modules $NODE_PATH
set -x EDITOR "/usr/local/bin/subl"

rbenv rehash >/dev/null ^&1

function fish_greeting
  return
end

# Load aliases
. ~/.config/fish/includes/aliases.fish

# Load Git functions
. ~/.config/fish/includes/git.fish

# Load prompt
. ~/.config/fish/includes/prompt.fish
