# dotfiles

## Usage

```bash
curl -L raw.github.com/yossy/dotfiles/main/install.sh | bash
```

## managed package

update Brewfile

```bash
cd ~/dotfiles
rm Brewfile
brew bundle dump
```

update VSCode extensions

```bash
cd ~/dotfiles
rm ./.vscode/extensions
code --list-extensions > ./.vscode/extensions
```
