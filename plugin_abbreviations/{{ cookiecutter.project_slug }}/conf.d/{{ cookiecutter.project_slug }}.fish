function _{{ cookiecutter.project_slug }}_install --on-event {{ cookiecutter.project_slug }}_install
    set -U __{{ cookiecutter.project_slug }}_abbreviations
end

function _{{ cookiecutter.project_slug }}_update --on-event {{ cookiecutter.project_slug }}_update
    _{{ cookiecutter.project_slug }}_uninstall
    _{{ cookiecutter.project_slug }}_install
end

function _{{ cookiecutter.project_slug }}_uninstall --on-event {{ cookiecutter.project_slug }}_uninstall
    _{{ cookiecutter.project_slug }}_destroy
end

# Starting from fish 3.6.0, 'abbr' is a builtin and abbreviations are no longer stored in universal variables.
not builtin -q abbr; and set -q __{{ cookiecutter.project_slug }}_initialized; and return 0

_{{ cookiecutter.project_slug }}_init
