# dotfiles
tkundrat's dotfiles

## setup
Run wanted `.sh` files (or `setup_all.sh` for all) from anywhere inside the repository.
Any existing config files, that would be overwritten, are copied to `$HOME/old-dotfiles`.

## darkmode
I added rudimentary dark mode support for my vim config. Darkmode will be used, if the `~/.darkmode` file is present.
I use a GNOME extension, which sets a UI-wide dark mode and runs the scripts mentioned below. Darkmode will not be (de)activated, while vim is running. The status of the file being there is checked at vim startup.

Dark Mode can be enabled with `:SetDark`, disabled with `:SetLight` or toggled with `:ToggleDark`.

The kitty config now also supports dark/light mode switching: run the script `scripts/set_dark.sh` or `scripts/set_light.sh` accordingly. The scripts create/delete the `~/.darkmode` file and replace the word light/dark with the opposite inside of `~/.config/kitty/current-theme.conf`. This only works, if the kitty configs were setup with the `setup/setup_kitty.sh` script. The `current-theme.conf` file just contains an import to the corresponding light or dark theme. On running kitty windows, press `Ctrl`+`Shift`+`F5` to reload kitty.

## screenshot
The screenshot utility found in my sway config is kindly borrowed from here:
https://github.com/marcothms/dots/blob/master/files/sway/.config/sway/screenshot

## on-screen-keyboard (experimental)
I'm using `wvkbd` as an on-screen-keyboard for tablet-mode on my convertible.
