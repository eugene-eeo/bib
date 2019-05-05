# bib

tiny bash script to manage top-level pip packages
(package _you've_ installed - all transitive dependencies).
I thought that I should use pip in reverse,
but pip is a palindrome.

bib is `pyenv`-aware.
this means that if you have pyenv installed,
bib mostly does what you want.

example, if you want to install `spotdl`:

    $ pip install --user spotdl
    $ bib add spotdl

some time later:

    $ bib outdated
    spotdl

bib basically maintains a directory of files,
where each file contains your top-level pip packages.
when you run `bib outdated`,
you get the intersection of the outdated packages and packages you've added to bib.

bib doesn't know about versions.
as such it should only be used to manage your
binaries or tools
that you want to keep up to date.
good examples are IPython, spotdl, etc.

to manually modify the files:

    $ vim $(bib path)
    # or
    $ vim $(bib path version)
