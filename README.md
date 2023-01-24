# dotfiles
tkundrat's dotfiles

## darkmode
I added rudimentary dark mode support for my vim config. Darkmode will be used, if the `~/.darkmode` file is present.
I use a GNOME extension, which sets a UI-wide dark mode and runs the scripts mentioned below. Darkmode will not be (de)activated, while vim is running. The status of the file being there is checked at vim startup.
Dark Mode can be enabled with `:SetDark`, disabled with `:SetLight` or toggled with `:ToggleDark`
The kitty config now also supports dark/light mode switching: run the script `scripts/set_dark.sh` or `scripts/set_light.sh` accordingly. They create/delete the `~/.darkmode` file and replace the word light/dark with the opposite inside of `~/.config/kitty/current-theme.conf`. This only works, if the kitty configs were setup with the `setup/setup_kitty.sh` script. The `current-theme.conf` file just contains an import to the corresponding light or dark theme. On running kitty windows, press `Ctrl`+`Shift`+`F5` to reload kitty.
