# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

#Me:
# Default
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/MacGPG2/bin"
# Yarn shims
export PATH="$HOME/.yarn/bin:$PATH"

# Gnu Grep
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Gnu Sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Gnu Indent
PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"

# Ruby
PATH="/usr/local/opt/ruby/bin:$PATH"

# Sqlite
PATH="/usr/local/opt/sqlite/bin:$PATH"

# Php
PATH="/usr/local/opt/php@7.2/bin:$PATH"
PATH="/usr/local/opt/php@7.2/sbin:$PATH"

# Add key

# needed for vagrant (cap deploy)
ssh-add ~/.ssh/id_rsa

# needed for github (with Mac provided ssh-add command due to -K flag
/usr/bin/ssh-add -K ~/.ssh/id_rsa_github
#/Me

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra_work,extra_personal}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
#Me: This functionality is provided by bash_autocompletion... and my config file is empty
##[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

#Enable iTerm Shell Integration: https://iterm2.com/documentation-shell-integration.html
source ~/.iterm2_shell_integration.bash

# Add `killall` tab completion for common apps
#Me: Don't care about these
##complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
