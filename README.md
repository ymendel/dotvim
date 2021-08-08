# Yossef Mendelssohn's vim config

Yup, I use vim. I'm hip.

## Installation

### Automated

There's a Makefile to make this simple. Just clone and go.

    $ git clone https://github.com/ymendel/dotvim.git
    $ cd dotvim
    $ make

See [the Makefile](Makefile) for the specific steps, or keep on reading.

### Manual

If you want to make your own choices or simply go through all the steps:

    $ git clone https://github.com/ymendel/dotvim.git ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ vim +PlugInstall +qall

nb. This is slightly different because the standard Makefile installation
links ~/.vim to wherever the repo has been cloned.

## Appreciation

  - Ben Bleything (@bleything), not least because this started off as a fork of his [dotvim repo][bleyvim].
  - Mike Skalnik (@skalnik), for inspiring me to actually make this my own instead of making very minor
  modifications to some else's config. And his [dotvim repo][skalvim] has also been helpful.

[bleyvim]: https://github.com/bleything/dotvim
[skalvim]: https://github.com/skalnik/dotvim
