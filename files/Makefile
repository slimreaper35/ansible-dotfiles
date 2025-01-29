CONFIG_DIRS = applications backgrounds bash dirs fonts git markdown nvim tmux

all:
	stow --verbose --restow --target=$(HOME) $(CONFIG_DIRS)
	dconf load /org/gnome/terminal/ < terminal-profiles.dconf
clean:
	stow --verbose --delete --target=$(HOME) $(CONFIG_DIRS)
	dconf reset -f /org/gnome/terminal/legacy/profiles:/
