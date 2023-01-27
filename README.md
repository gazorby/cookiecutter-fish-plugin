<div align="center">

# Cookiecutter fish plugin

[![CI](https://github.com/gazorby/cookiecutter-fish-plugin/actions/workflows/ci.yaml/badge.svg)](https://github.com/gazorby/cookiecutter-fish-plugin/actions/workflows/ci.yaml)

Easy to use templates to quickly create fish plugins

</div>

## ✨ Features

- Multiple templates to start with
- Generated plugin compatible with [fisher](https://github.com/cookiecutter/cookiecutter)
- Github action CI out of the box
- Pre-commit configuration

## 🔧 Usage

1. Install [cookiecutter](https://github.com/cookiecutter/cookiecutter):

   ```console
    python3 -m pip install --user cookiecutter
    # or
    pipx install cookiecutter
    # or
    brew install cookiecutter
   ```

2. Install the template you want:

    This template uses the directory feature of cookiecutter to provide multiple templates in the same repo, so you **must** provide the `--directory` option to select the desired template.

   ```console
   # Basic fisher plugin template
   cookiecutter gh:gazorby/cookiecutter-fish-plugin --directory=fisher_basic
   ```

   ```console
   # Fisher template to create an abbreviations/aliases plugin
   cookiecutter gh:gazorby/cookiecutter-fish-plugin --directory=fisher_abbreviations
   ```

## Available templates

### Fisher

Fisher plugins share the following base structure (given a plugin called 'fish-plug'):

```console
- conf.d/
    |
    fish_plug.fish
    |
- functions/
    |
    _fish_plug_destroy.fish
    _fish_plug_init.fish
    |
- tests/
    |
    common.fish
    test_plugin.fish
```

All fisher templates have the following optional configuration available:
- A working Github action CI workflow that runs tests using [fishtape](https://github.com/jorgebucaran/fishtape)
- A pre-commit configuration

#### fisher_basic

This template just creates the directory structure (`conf.d`, `functions` and `tests` folders).

#### fisher_abbreviations

An opiniated template for plugins that just add abbreviations/aliases. Compatible with all fish versions.

Generated template already include plugin (un)installation hooks and tests, you just need to add your abbreviations.

An extra function `_fish_plug_abbr.fish` will be created, that adds abbreviations and saves their names in a private variable (so they can be deleted when removing the plugin).

Abbreviations should be added in `functions/_fish_plug_init.fish`:

```fish
# functions/_fish_plug_init.fish

function _fish_plug_init -d "Initialize fish_plug plugin"
    # Add your abbreviations/aliases here:

    _fish_plug_abbr foo 'bar'

    # Mark plugin as initialized
    set -U __fish_plug_initialized 1
end

```

## 📝 License

[MIT](https://github.com/gazorby/cookiecutter-fish-plugin/blob/main/LICENSE)
