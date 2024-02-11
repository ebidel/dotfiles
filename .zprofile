# The ~/.zprofile file is only evaluated when you login to your mac user account.

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(/opt/homebrew/bin/brew shellenv)"
eval $(/opt/homebrew/bin/brew shellenv)

