CONFIG_DIRS = applications backgrounds bash dirs fonts git nvim tmux zsh

.PHONY: all clean profiles

all:
	stow --verbose --restow --target=$(HOME) $(CONFIG_DIRS)

clean:
	stow --verbose --delete --target=$(HOME) $(CONFIG_DIRS)

profiles:
	dconf load /org/gnome/terminal/ < terminal-profiles.dconf
