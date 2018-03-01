# dot

My dotfiles.

Each directory (other than `deprecated`) is a
[stow](https://www.gnu.org/software/stow) package which can be directly
symlinked into the home directory.

Packages prefixed with `root-` have to be stowed on the root directory
(`--target=/`), and packages suffixed with `-omen` contain configs specific to
`omen`, which is the hostname of my laptop.
