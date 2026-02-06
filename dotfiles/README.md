# dev-config

Configuration files for my development environments.

## initialize

Use `stow` to create symlinks to the files in this repository.

_Symlink common config files_

__NOTE__: make sure to symlink oh-my-tmux first.

```bash
cd common
stow -t ~ *
```

_Symlink MacOS specific files_

```bash
cd mac
stow -t ~ *
```

_Symlink Linux specific files_

```bash
cd linux
stow -t ~ *
```
