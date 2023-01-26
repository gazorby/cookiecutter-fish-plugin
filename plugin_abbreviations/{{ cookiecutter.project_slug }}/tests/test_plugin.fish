source (string join "/" (dirname (status --current-filename)) "common.fish")

setup

@test "Plugin initialization" (
    setup_test
    _{{ cookiecutter.project_slug }}_init
    test "$__{{ cookiecutter.project_slug }}_initialized" = 1
) "$status" = 0

@test "Plugin removal abbreviations erased" (
    setup_test
    _{{ cookiecutter.project_slug }}_destroy
    not abbr -q _{{ cookiecutter.project_slug }}_foo
) "$status" = 0

@test "Plugin removal __{{ cookiecutter.project_slug }}_abbreviations erased" (
    setup_test
    _{{ cookiecutter.project_slug }}_destroy
    not set -q "__{{ cookiecutter.project_slug }}_abbreviations"
) "$status" = 0

teardown
