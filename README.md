
# My dotfiles

Here are all my dotfiles i care about

> [!NOTE]
> This repo uses keyd,
> It remaps my de-latin keyboard layout.
> If you don't want to have that please consider deleting `~/.config/keyboard/default.conf`
> As this is a symlink, you need to delete `/etc/keyd/default.conf` too.

## TOC
- [nvim](#nvim)
- [zsh](#zsh)
- [bash](#bash)
- [keyboard](#keyboard)
- [tmux](#tmux)
- [konsole](#konsole)
- [git](#git)
- [keyd](#keyd)
- [Installation guide](#install)

## My setup

My nerd font _IosevkaCustom_: [https://gist.github.com/88db9576bab457ea40fbab9249ef61e3.git](https://gist.github.com/88db9576bab457ea40fbab9249ef61e3.git),
font size: 16pt

### nvim

> [!IMPORTANT]
> There are still old background images of themes in img/ and in source code, but they are set as depricated.

Main colorscheme: [rose-pine](https://github.com/rose-pine/neovim)

![init-lua](img/init-lua.png)

> Currently I manually zoom in, but i want to solve this problem soon.
> My current zoom of init-lua is set as big as needed so the terminal only shows me `40` lines.


#### All my plugins

(From lazy.vim):

![lazy.vim](img/lazy.vim-plugins.png)

Mason:

![mason](img/mason.png)

#### Structure

```zsh
➜  nvim git:(master) ✗ nvimrc-version # not a real command!
>> master | commit 6e8156828fa65b1d1fa0c54be71f7e6686652af3

➜  nvim git:(master) ✗ tree .
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── lazy.lua
    │   └── remap.lua
    ├── plugins
    │   ├── auto-fmt.lua
    │   ├── autopairs.lua
    │   ├── fun
    │   │   ├── playtime.lua
    │   │   └── vimBeGood.lua
    │   ├── fzf
    │   │   ├── harpoon.lua
    │   │   ├── telescope-dirfinder.lua
    │   │   └── telescope.lua
    │   ├── lsp
    │   │   ├── cmp-dictionary.lua
    │   │   ├── cmp.lua
    │   │   ├── lazydev.lua
    │   │   ├── mason.lua
    │   │   └── nvim-treesitter.lua
    │   ├── supermaven.lua
    │   ├── tiny-inline-daignostic.lua
    │   ├── trouble.lua
    │   ├── undo-tree.lua
    │   └── viewer
    │       ├── image.lua
    │       └── markview.lua
    └── themes
        ├── bamboo.lua
        ├── init.lua
        ├── kanagawa.lua
        └── vesper.lua

9 directories, 26 files
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
### keyboard

Read: [keyboard](https://github.com/seesee010/keyboard)

### tmux

Leader: `<C-k>`, as I think this is more ergonomic.

I only use tmux as like virtualizing tabs.
Mostly on tab1 (1 indexed): nvim
on other tabs the other stuff like zsh.

![tmux](img/tmux.png)

### konsole

(Profile 2):

![konsole](img/terminal.png)

### git

> From Oh my zsh, the git plugin

### keyd

| **from**     | **to** (= "programmer" ) |
|--------------|---------|
| ö            | @       |
| ä            | {       |
| Ä            | }       |
| ü            | [       |
| Ü            | ]       |
| ´            | ~       |
| `<Capslock>` | `<Esc>` |

If you want to change the mode you need to press: `C-b`

## install

### Dangerous

```bash
curl -fsSL https://raw.githubusercontent.com/seesee010/dotfiles/master/script/install.sh -o /tmp/install.sh
bash /tmp/install.sh
```

### Better way

```bash
curl -fsSL https://raw.githubusercontent.com/seesee010/dotfiles/master/script/install.sh -o install.sh
chmod +x install.sh

vim install.sh # check the install.sh file
bash install.sh
```

## License
[LICENSE](https://github.com/seesee010/dotfiles/blob/master/LICENSE)
