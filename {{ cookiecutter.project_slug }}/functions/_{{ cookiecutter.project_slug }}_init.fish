function _{{ cookiecutter.project_slug }}_init -d "Initialize {{ cookiecutter.project_slug }} plugin"
    # Add your abbreviations/aliases here:

    # _{{ cookiecutter.project_slug }}_abbr foo 'bar'

    # Mark plugin as initialized
    set -U __{{ cookiecutter.project_slug }}_initialized 1
end
