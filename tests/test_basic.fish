#!/bin/env fish

argparse "directory=" -- $argv

# create a cache directory
mkdir -p .cache/basic/{$_flag_directory}
cd .cache/basic/{$_flag_directory}

# create the project using the default settings in cookiecutter.json
cookiecutter ../../../ --no-input --overwrite-if-exists --directory="$_flag_directory"

fishtape ./fish_plug/tests/test**.fish
