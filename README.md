
# Windows Development Environment Setup Guide

## 1. Terminal Setup

1. Install your preferred Nerd Font from https://www.nerdfonts.com/font-downloads
2. Select the installed font in your Windows Terminal default profile
3. Choose a colorscheme from https://windowsterminalthemes.dev/
4. Copy and paste the colorscheme into the Windows Terminal `.json` config file under the `schemes` entry

---

## 2. Software to Install

Install Microsoft Visual Studio (Not Visual Studio code) [here](https://visualstudio.microsoft.com/)

Install Neovim:
```bash
winget install Neovim.Neovim
```

Install Git:
```bash
winget install --id Git.Git -e --source winget
```

Install Node.js (for the tree-sitter-cli):
```bash
winget install OpenJS.NodeJS
```

Then install the tree-sitter-cli to compile and install parsers:
```
npm install --global tree-sitter-cli
```

Install ripgrep for the telescope grep picker:
```bash
winget install --id BurntSushi.ripgrep.MSVC -e --source winget
```

---

### 3. MSYS2 Setup

Install MSYS2:
```bash
winget install -e --id MSYS2.MSYS2
```

MSYS2 will be installed in `C:\msys64`. Add this directory to your `Path` environment variable.

Update package database:
```bash
pacman -Syu
```

Install development tools:
```bash
pacman -S --needed base-devel mingw-w64-x86_64-gcc
```

This installs:
- **GCC** for 64-bit development in `C:\msys64\mingw64\bin` (add to your Path)
- **base-devel group** including `make` in `C:\msys64\usr\bin`

---

## 4. Neovim Configuration

After launching Neovim, run:
```vim
:e $MYVIMRC
```

Open the mingw64 shell and run:
```bash
cd /c/Users/<USERNAME>/AppData/Local/nvim-data/site/pack/packer/start/telescope-fzf-native.nvim
make
```

---

## Environment Variables Summary

Add the following directories to your Windows `Path` environment variable:
- `C:\msys64` (for the shells)
- `C:\msys64\mingw64\bin` (for gcc & g++)
