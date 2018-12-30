# Pcal [![Build Status](https://travis-ci.org/ramortegui/pcal.svg?branch=master)](https://travis-ci.org/ramortegui/pcal)

Elixir app to generate a monthly pdf calendar using  `pcal` and `ps2pdf` using Ports.

The purpose of this application is to generate a monthly calendar in pdf.


![sample_calendar](./support/sample_calendar.png?raw=true "January 2019")


The command to generate the pdf without the need to elixir for January 2019 is:

```shell
pcal 1 2019 | ps2pdf - output.pdf
```

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

## Usage

Add module as dependency on your mix project

```elixir
{:pcal, git: "https://github.com/ramortegui/pcal.git", tag: "v0.1.1"}
```

Generate a pdf file
```elixir
iex> Pcal.generate_pdf(%Pcal{month: "1", year: "2019", output: "output.pdf"})
{:ok, "output.pdf"}
```

