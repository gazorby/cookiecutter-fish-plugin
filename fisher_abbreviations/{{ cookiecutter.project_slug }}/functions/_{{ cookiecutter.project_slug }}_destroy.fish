function _{{ cookiecutter.project_slug }}_destroy -d "Initialize {{ cookiecutter.project_slug }} plugin"
    for ab in $__{{ cookiecutter.project_slug }}_abbreviations
        abbr --erase $ab
    end
    set -Ue __{{ cookiecutter.project_slug }}_abbreviations
end
