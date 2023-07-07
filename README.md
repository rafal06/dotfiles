# Dotfiles
My Linux dotfiles. Currently only for git and zsh.

## Required programs
- git (obviously)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - fancy looking git diff
- [exa](https://github.com/ogham/exa) - modern ls replacement
- [atuin](https://github.com/ellie/atuin) - magical shell history

## Zsh
### Theme ([powerlevel10k](https://github.com/romkatv/powerlevel10k))

![terminal screenshot](https://cdn.discordapp.com/attachments/969317854635769929/1126826524906094602/image.png)

### Plugins
- [Zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### Aliases
Aliases can be found in [`.zshrc`](./.zshrc). They change so frequently that I'm not gonna bother listing all of them here. Though most notable include:
- `ls` -> `exa`
- `tree` -> `exa --tree`
- `rmr` -> `rm -r`
- `dc` -> `docker compose`
- `sctl` and `ssctl` -> `systemctl` and `sudo systemctl`
- `dnf`, `zypper` and `flatpak` aliases

## License
All these dotfiles are distributed under the terms of WTFPL license (found in the [LICENSE file](./LICENSE)), which means that you can do what the fck you want with them. I don't care.
