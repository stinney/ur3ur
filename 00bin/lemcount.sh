#!/bin/sh
atfstats.plx 00atf/vetted.atf | cut -f4 | perl -n -e '/(\d+)/ && ($x += $1); END { print"vetted.atf now contains $x lemmatized words"}'
