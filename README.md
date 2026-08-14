# My dotfiles

Here are all my dotfiles i care about

## TOC
- [nvim](#nvim)
- [zsh](#zsh)
- [bash](#bash)
- [konsole](#konsole)
- [git](#git)
- [Installation guide](#install)

## My setup

### nvim

Main colorscheme: [bamboo](https://github.com/ribru17/bamboo.nvim)

![colorscheme-bamboo](img/colorscheme-bamboo.png)

Secondary colorscheme (only for: sh, zsh, bash):

[kanagawa](https://github.com/rebelot/kanagawa.nvim)

![colorscheme-kangawa](img/colorscheme-kangawa.png)

Third colorscheme (only loaded never used any more):

[vesper](https://github.com/datsfilipe/vesper.nvim)

#### All my plugins

(From lazy.vim):

![lazy.vim](img/lazy.vim-plugins.png)

#### Structure

(from `tree .`):

```zsh
➜  nvim git:(master) ✗ tree .            
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── lazy.lua
    │   └── remap.lua
    ├── plugins
    │   ├── autopairs.lua
    │   ├── fzf
    │   │   ├── harpoon.lua
    │   │   └── telescope.lua
    │   ├── lsp
    │   │   ├── cmp-dictionary.lua
    │   │   ├── cmp.lua
    │   │   ├── lazydev.lua
    │   │   ├── lsp-config.lua
    │   │   └── nvim-treesitter.lua
    │   ├── tiny-inline-daignostic.lua
    │   ├── trouple.lua
    │   ├── undo-tree.lua
    │   └── vimBeGood.lua
    └── themes
        ├── bamboo.lua
        ├── init.lua
        ├── kangawa.lua
        └── vesper.lua

7 directories, 20 files
➜  nvim git:(master) ✗ 
```

### zsh

### Plugins

```zsh
➜  ~ git:(master) echo $plugins
git
```
and
```zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### bash

```zsh
➜  ~ git:(master) bat .bashrc 
─────┬────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
     │ File: .bashrc
─────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1 │ #
   2 │ # ~/.bashrc
   3 │ #
   4 │ 
   5 │ # If not running interactively, don't do anything
   6 │ [[ $- != *i* ]] && return
   7 │ 
   8 │ alias ls='ls --color=auto'
   9 │ alias grep='grep --color=auto'
  10 │ PS1='[\u@\h \W]\$ '
─────┴────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```

### konsole

(Profile 2):

<img height="1400" alt="image" src="https://github.com/user-attachments/assets/ddd1b7e0-cb03-4969-9eb2-7bbd412bc66c" />

### git

> From Oh my zsh, the git plugin

## install

### Dangerous

```bash
curl -fsSL https://raw.githubusercontent.com/seesee010/dotfiles/master/install.sh | bash
```

### Better way

```bash
curl -fsSL https://raw.githubusercontent.com/seesee010/dotfiles/master/install.sh -o install.sh
chmod +x install.sh

vim install.sh # check the install.sh file
bash install.sh
```

## License
[LICENSE](https://github.com/seesee010/dotfiles/blob/master/LICENSE)
