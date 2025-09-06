
- Main Depencies: (All of the software's executables have to be in you PATH environment variable)

. Terminal with a patched font installed
. gcc compiler & make (use MSYS2's on windows) 
. git
. ripgrep

. To compile projects
|
+-> . put a run script in the same directory as your root marker (.git, pom.xml, etc...)
+-> . use powershell on windows and a simple .sh script on linux/mac
+-> . it works even if you have a multi module project
+-> . simply put a script in the same dir of each module's build tool config file (a.k.a the root marker)

. On Windows
|
+-> . Microsoft's C & C++ compiler (cl.exe) on top of gcc (both are needed).
|   +-> It comes with Microsoft Visual C++ (MSVC)

- Optional Dependencies:

. Treesitter-CLI

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

- Example Windows Setup:

. Microsoft Visual Studio (not VSCode)
|
|-> install the installer from the website (community version is free)
|-> in the installer, install the desktop development kit (it will install the compiler we need)
|-> we need that compiler because clangd (the C/C++ Language Server) defaults to it on windows
|-> . add the compiler (cl.exe) to your PATH environment variable.
|   |-> search and open 'edit the system environment variables' menu on windows
|   |-> click on 'environment variables'
|   |-> you'll find two sets of variables: one for the system, one for your current user.
|   |-> under the user one, select 'Path'
|   |-> . click on 'new' and paste the path to the directory where 'cl.exe' is
|   |   |-> it should look like: 

    'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64'

but double check for your specific installation.

. Terminal Setup
|
|-> Use the windows terminal
|-> Install your prefered nerd font from the website above
|-> select it in your default profile (in the settings)
|-> choose a prefered colorscheme in the website above
|-> copy-paste it into the .json config file for the windows terminal (open from the settings)
|   under the 'schemes' entry

. MSYS2 Setup
|
|-> run 'winget install -e --id MSYS2.MSYS2' on powershell
|-> that will install it on 'C:\msys64'
|-> add that to your Path env var

Now open a new terminal session (running powershell) and type in 'msys2'. The MSYS2 
terminal should open. Use it to run 'pacman -Syu'. If it tells you to restart MSYS2,
close the window and open it again. Run the same command again until everything is updated.

Run 'pacman -S --needed base-devel mingw-w64-x86_64-gcc' (still inside msys2) This installs:

. GCC for 64-bit development that lives in 'C:\msys64\mingw64\bin' (add to your path)
. the base-devel group (a collection of common development tools that includes 'make').
|
|-> Lives in: C:\msys64\usr\bin (add it to your path too)

The hardest part is done. Now we'll just install some software

run 'winget install --id Git.Git -e --source winget' to install windows git.
it will automatically be added to your paths

install ripgrep using winget by running:

    'winget install --id BurntSushi.ripgrep.MSVC -e --source winget'
