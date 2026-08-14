# My dotfiles

Here are all my dotfiles i care about

## What's included
- Zsh
- Bash
- nvim
- konsole
- git
- and more...

## My setup

### [nvim](https://neovim.io/) 

Main colorscheme: [bamboo](https://github.com/ribru17/bamboo.nvim)

![colorscheme-bamboo](img/colorscheme-bamboo.png)

Secondary colorscheme (only for: sh, zsh, bash):

[kangawa](https://github.com/rebelot/kanagawa.nvim)

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

## License
[LICENSE](https://github.com/seesee010/dotfiles/blob/master/LICENSE)
