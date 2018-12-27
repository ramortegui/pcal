# Pcal [![Build Status](https://travis-ci.org/ramortegui/pcal.svg?branch=master)](https://travis-ci.org/ramortegui/pcal)

Elixir wrapper for `pcal` using Ports.

This application requires 'pcal' and 'ps2pdf' commands installed on the system.

The purpose of this applcation is to generate a montly calendar in pdf.  The
actual command to run without the need to elixir is:

`pcal 1 2019 | ps2pdf - output.pdf`

the use of this package is to combine it with phoenix to be able to generate
pdf calendars from a webapp in a secure way.

## Pre-requisites

pcal: app used to generate a ps file with the calendar.
ghostview: app used to convert ps files into pdf using ps2pdf command.

### Debian based
`sudo apt-get install pcal gv`

### Mac

Taken from http://macappstore.org/ghostscript/

`brew install pcal`
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null`
`brew install ghostscript`

