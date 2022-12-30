# dotfiles
tkundrat's dotfiles

## darkmode
I added rudimentary dark mode support for my vim config. Darkmode will be used, if the `~/.darkmode` file is present.
I use a GNOME extension, which sets a UI-wide dark mode and deletes/creates the file accordingly. Darkmode will not be (de)activated, while vim is running. The status of the file being there is checked at vim startup.
Dark Mode can be enabled with `:SetDark`, disabled with `:SetLight` or toggled with `:ToggleDark`
