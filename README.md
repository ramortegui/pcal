# Pcal [![Build Status](https://travis-ci.org/ramortegui/pcal.svg?branch=master)](https://travis-ci.org/ramortegui/pcal)

Elixir app to generate a monthly pdf calendar using  `pcal` and `ps2pdf` using Ports.

The purpose of this application is to generate a monthly calendar in pdf. The actual command to run without the need to elixir is:

```shell
pcal 1 2019 | ps2pdf - output.pdf
```

The above command generates a pdf calendar of January 2019.

## Pre-requisites

- pcal:  App used to generate a ps file with the calendar.
- ghostview:  App used to convert ps files into pdf using ps2pdf command.

### Intalation of prerequisites

#### Debian based

`sudo apt-get install pcal gv`

#### Mac

Taken from http://macappstore.org/ghostscript/

```shell
brew install pcal`
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install ghostscript
```
