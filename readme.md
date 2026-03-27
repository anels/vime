# vime

vime is an easy-configurable Vim distribution by Anels Liu.

Make Life easier.
Easy to use
Easy to understand
Easy to configure
Easy to deploy
Easy to sync across multiple computers (deploy it on dropbox)

## Pre-requisites
The distribution is designed to work with Vim >= 7.3.

The distribution also requires `ctags` and `git`.

### ctags
Currently I use [universal-ctags](https://github.com/universal-ctags/ctags).

For Windows, just downloaded the zip file, unzip it and add the directory to the
Path.



## Installation

### *nix

1. Get vime from github
```
    git clone https://github.com/anels/vime.git ~/vime
```
You can change the vime directory `~/vime` to any dictionary you want. You can even put vime into Dropbox so all the configuration can be synced to all of your computers (You need to run bootstrap on each computers at the first time.)

2. Enter vime directory, bootstrap vime
```
    ./bootstrap_linux.sh
```

## Update

### Manully Update

#### Update vime

    git pull

#### Update plugins

    :PlugUpdate

### Automatically Update

Run

    ./update.sh

## Organization

Most of the customization files are in <code>rc</code>

* vimrc -> <code>vimrc</code>
* vime plugin configuration -> <code>rc/vime-plug.vim</code>
* vime general configuration -> <code>rc/vime-general.vim</code>
* Self-defined functions -> <code>rc/vime-function.vim</code>
* Key shortcuts mappings -> <code>rc/vime-shortcut.vim</code>
* 

## Plugin List

* [vim-plug](https://github.com/junegunn/vim-plug) - Manage Vim plugins
* [Tagbar](https://github.com/majutsushi/tagbar) - Browse the tags of source code files
  * `<F10>` to toggle Tagbar.
* [NERD_tree](https://github.com/scrooloose/nerdtree) - Explore filesystem and to open files and directories
* [coc.nvim](https://github.com/neoclide/coc.nvim) - Intellisense engine for Vim8 & Neovim
* [Tabular](http://github.com/godlygeek/tabular)  - Fast align text
* [fzf.vim](https://github.com/junegunn/fzf.vim) - Command-line fuzzy finder
  * <code>&lt;Ctrl&gt;-p</code> Search File
  * <code>&lt;Ctrl&gt;-j</code> Search Tag

#### UI Related
* [lightline.vim](https://github.com/itchyny/lightline.vim) - A light and configurable statusline/tabline plugin
* [csExplorer](http://www.vim.org/scripts/script.php?script_id=1298) - List all available colorschemes, and switch them easily.
  * Shortkey: <code>&lt;Leader&gt;ec</code>
  * Apply: <code>&lt;CR&gt;</code>
  * Exit: <code>q</code>

#### Coding
* [vim-surround](https://github.com/tpope/vim-surround) - Quoting/parenthesizing made simple
* [NERD_commenter](https://github.com/scrooloose/nerdcommenter) - Provide many different commenting operations and styles
* [Indent Guides](https://github.com/mutewinter/vim-indent-guides) - Display vertical lines to visualize levels
  * <code>&lt;Leader&gt;ig</code> Toggle indent guides.
* [fugitive](https://github.com/tpope/vim-fugitive) - Git wrapper (requires git to be installed)
* [undotree](https://github.com/mbbill/undotree) - Visualize Vim undo tree
  * `<Leader>u` Toggle undo tree.


## Managing plugins

You can add additional plugins by editing `rc/vime-plug.vim`.
Since this setup uses `vim-plug`, you can add new plugins using the `Plug` command:

```vim
Plug 'preservim/nerdtree'
```

Remove plugins by removing or commenting out their `Plug` line.

**Remember to run `:PlugInstall` after adding new plugins, and `:PlugClean` after removing plugins.**

## Key shortcuts mapping List

Most of the vime customized shortkeys are defined in <code>$HOME/.vim/rc/vime-shortcut.vim</code>.

<code>&lt;Leader&gt;</code> is mapped to <code>,</code>

### Fast Settings
* `<leader>ee` : View/Edit .vimrc
* `<leader>sv` : Source .vimrc (reload all the configurations)
* `<Leader>ep` : View/Edit vime-plug.vim
* `<Leader>eg` : View/Edit vime-general.vim
* `<Leader>es` : View/Edit vime-shortcut.vim
* `<Leader>ef` : View/Edit vime-function.vim
* `<Leader>ea` : List all configuration files

#### Normal Mode
* Tab switch:
  * `<Ctrl>-t`             : New Tab
  * `<Ctrl>-w`             : Close Tab
  * `<Ctrl>-<Tab>`         : Next Tab
  * `<Ctrl>-<Shift>-<Tab>` : Previous Tab
* Splitted Windows
  * Horizental splitted Windows (:sp)
    * ­`<Alt>+`      : Enlarge current window
    * ­`<Alt>-`      : Reduce current window
    * ­`<Alt><Up>`   : Active the upper window
    * ­`<Alt><Down>` : Active the lower window
  * Vertically splitted Windows (:vs)
    * ­`<Alt>.`       : Enlarge current window
    * ­`<Alt>,`       : Reduce current window
    * ­`<Alt><Left>`  : Active the left window
    * ­`<Alt><Right>` : Active the right window
* Other
  * `Q`         : Close current file
  * `<Leader>q` : Strip all trailing white space in current file
* Plugins
  * `<F10>`:  toggle Tagbar.
  * `<Leader>ec`: Open ColorSchemeExplorer
