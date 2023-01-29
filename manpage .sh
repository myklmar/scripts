#! /bin/bash
# mmartin.............01/01/22
# Type 'manpage [name]'

man $1 | col -b > ~/Manuals/$1.txt
