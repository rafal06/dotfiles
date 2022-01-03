# Dotfiles
My Linux dotfiles. Currently only for zsh, git and neofetch.

## Zsh
### Theme ([powerlevel10k](https://github.com/romkatv/powerlevel10k))
![terminal screenshot](https://cdn.discordapp.com/attachments/791628533339521031/914537302703878174/terminal.png)

### Aliases
#### General
- `zshrc` -> `nano ~/.zshrc`
- `i3config` -> `nano ~/.config/i3/config`
- `la` -> `ls -A`
- `ll` -> `ls -l`
- `lla` -> `ls -l -A`
- `rmr` -> `rm -r`

#### Dnf
- `sdnfi` -> `sudo dnf install`
- `dnfs` -> `dnf search`
- `sdnfu` -> `sudo dnf upgrade`
- `sdnfr` -> `sudo dnf remove`
- `dnfli` -> `dnf list --installed`

## Neofetch
![neofetch screenshot](https://cdn.discordapp.com/attachments/791628533339521031/917507767521132594/neofetch.png)
*Note: the "activation" text is made using a zsh alias and is just for trolling purporses :trollface:*

### Changes over the default config
- Added display framerate
- Added CPU temperature
- CPU frequency now displays in a shorter form (for example 4.1GHz instead of 4.100GHz)
- Memory usage now displays in GiB instead of MiB
