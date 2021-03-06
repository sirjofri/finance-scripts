Finance Scripts
===============

This package provides scripts that help me see my finance input and output.

Usage
-----

This package comes with 4 different `(g)awk` scripts. These scripts to _not_
directly work with files, they just receive records from `stdin` and write to
`stdout`/`stderr`.

`fin-month` parses the input records and outputs some monthly statistics about
them.

`fin-year` parses the output from `fin-month` and outputs some yearly
statistics.

`fin-add` is an interactive script. It prompts the user for record data and
prints a valid record string to `stdout`!

`fin-month-prepare-plot` does the same thing as `fin-month` but prints
parseable data to `stdout`. This data can be processed by `gnuplot` or other
tools.

`fin-month-plot` is a shell script. It calls `fin-month-prepare-plot` and
creates a plot file `month.png`. It only works with `gnuplot`.

An example procedure is presented here:

```bash
fin-add >testrecords.txt               # interactive user input
fin-add >>testrecords.txt              # interactive user input
fin-month <testrecords.txt             # prints monthly statistics
fin-month <testrecords.txt | fin-year  # prints yearly statistics
fin-month-plot <testrecords.txt        # creates a month.png plot
```

The tools can use data records like this. The long space in between _must_ be
a tab character. You can use `fin-add` to create valid records.

```
short name         2018.09.12      -10.00     more information, tags
short name 2       2018.09.12      25.00      more information
```

Feel free to use Unix tools like `grep`, `cat` and shell functions to improve
your experience!

Installation Instructions
-------------------------

You need `make`, `gzip` (for man pages) and `gawk` (for running the scripts).
For plotting `sh` and `gnuplot` is required.

Use the given Makefile:

```bash
sudo make install
```

To only install the scripts (or manpages) use `sudo make install-bin` (or
`sudo make install-man`).

To uninstall use:

```bash
sudo make uninstall
```

This removes all files except this directory. You can safely remove this
directory without damaging your system.

**Update:** I also provide a proper `PKGBUILD` in this repository. You can use
`makepkg -si` to install this package on arch systems.

License
=======

This software is provided _as is_. Do _not_ expect updates, but feel free to
extend the code according to your needs. Feel free to fork and change it, but
take full responsibility for all it does. The software in this form should
remain _free_ (as in _no cost_) and _open_ (as in _open source_).
