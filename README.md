# Dotfiles

## Usage

execute deploy

```bash
curl -L raw.github.com/yossy/dotfiles/main/install.sh | zsh
```

execute initialize and deploy

```bash
curl -L raw.github.com/yossy/dotfiles/main/install.sh | zsh -s init
```

If you have already git clone

execute deploy

```bash
make deploy
```

execute initialize

```bash
make init
```

## Managed package

update Brewfile

```bash
cd ~/dotfiles
make update_brewfile
```

update VSCode extensions

```bash
cd ~/dotfiles
make update_vscode_extensions
```

