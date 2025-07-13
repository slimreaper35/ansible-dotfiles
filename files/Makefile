CONFIG_DIRS = backgrounds bash fonts git nvim tmux zsh

.PHONY: all clean profiles

all:
	stow --verbose --restow --target=$(HOME) $(CONFIG_DIRS)

clean:
	stow --verbose --delete --target=$(HOME) $(CONFIG_DIRS)
