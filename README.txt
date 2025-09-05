
- Main Depencies: (All of the software's executables have to be in you PATH environment variable)

. Terminal with a patched font installed
. gcc compiler & make
. git
. ripgrep

. To compile projects
|
+-> . put a run.sh script in the same directory as your root marker (.git, pom.xml, etc...)
+-> . it works even if you have a multi module project
|   +-> simply put a run.sh in the same dir of each module's build tool config file

. On Windows
|
+-> . Microsoft's C & C++ compiler (cl.exe) on top of gcc (both are needed).
|   +-> It comes with Microsoft Visual C++ (MSVC)
|
+-> . MSYS2's bash 
|   +-> ensure that it is MSYS2's that is used.
|   +-> for that, it must be first in you PATH

- Optional Dependencies:

. Treesitter-CLI
