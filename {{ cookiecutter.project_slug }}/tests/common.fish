set current_dir (dirname (status --current-filename))
set set_vars

for file in {$current_dir}/../functions/*.fish
    source $file
end

function _get_set_universal_vars
    for var in $argv
        if set -q $var
            set -a set_vars $var
        end
    end
end

function setup
    _get_set_universal_vars __{{ cookiecutter.project_slug }}_initialized __{{ cookiecutter.project_slug }}_abbreviations

    set -g __tmp_{{ cookiecutter.project_slug }}_initialized $__{{ cookiecutter.project_slug }}_initialized
    set -g __tmp_{{ cookiecutter.project_slug }}_abbreviations $__{{ cookiecutter.project_slug }}_abbreviations
end

function teardown
    for var in $set_vars
        set -l tmp (string join "" _tmp $var)
        set -U $var $$tmp
    end
end

function setup_test
    set -U __{{ cookiecutter.project_slug }}_initialized
    abbr -a _{{ cookiecutter.project_slug }}_foo bar
    set -U __{{ cookiecutter.project_slug }}_abbreviations _{{ cookiecutter.project_slug }}_foo
end
