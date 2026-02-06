# dev-config

Configuration files for my development environments.

## initialize

Use `stow` to create symlinks to the files in this repository.

_Symlink common config files_

```bash
stow -t ~ -d common *
```

_Symlink MacOS specific files_

```bash
stow -t ~ -d mac *
```

_Symlink Linux specific files_

```bash
stow -t ~ -d linux *
```
