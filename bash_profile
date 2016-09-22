# Load iterm2_shell_integration if it exists
test -f ~/.bash/iterm2_shell_integration && source ~/.bash/iterm2_shell_integration

# Load .profile if it exists
test -f ~/.profile && source ~/.profile

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
