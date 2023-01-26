#!/bin/env fish

argparse "directory=" -- $argv

# create a cache directory
mkdir -p .cache/install/{$_flag_directory}
cd .cache/install/{$_flag_directory}


# create the project using the default settings in cookiecutter.json
cookiecutter ../../../ --no-input --overwrite-if-exists --directory="$_flag_directory"

fisher install ./fish_plug
fisher update (realpath ./fish_plug)
fisher remove (realpath ./fish_plug)
