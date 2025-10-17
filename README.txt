
- Useful Links:

. Colorschemes
|
+-> https://vimcolorschemes.com/i/trending

. Windows Terminal Colorschemes
|
+-> https://windowsterminalthemes.dev/

. Patched Fonts
|
+-> https://www.nerdfonts.com/font-downloads

Windows Setup:

winget install Neovim.Neovim

Microsoft Visual Studio (not VSCode)

. Terminal Setup
|
+-> Install your prefered nerd font from 'https://www.nerdfonts.com/font-downloads' and select it in your default profile
+-> choose a prefered colorscheme in 'https://windowsterminalthemes.dev/' and copy-paste it into the .json config file under the 'schemes' entry

. MSYS2 Setup
|
+-> run 'winget install -e --id MSYS2.MSYS2'
+-> installed in 'C:\msys64' add that to your 'Path' environment variable
+-> run 'pacman -Syu' in the msys2 shell
+-> . run 'pacman -S --needed base-devel mingw-w64-x86_64-gcc' (still inside msys2) This installs
|   +-> . GCC for 64-bit development in 'C:\msys64\mingw64\bin' (add to your path)
|   +-> . the base-devel group a collection of common development tools that includes 'make' in 'C:\msys64\usr\bin' (add it to your path too)

'winget install --id Git.Git -e --source winget' to install windows git.

'winget install --id BurntSushi.ripgrep.MSVC -e --source winget'

after launch run :e $MYVIMRC and edit the project path. head to

    C:\Users\aitam\AppData\Local\nvim-data\site\pack\packer\start\telescope-fzf-native.nvim

and run 'make' from the mingw64 shell
