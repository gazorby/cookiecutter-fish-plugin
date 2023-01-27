function _{{ cookiecutter.project_slug }}_abbr -d "Create {{ cookiecutter.project_slug }} abbreviations and aliases"
    set -l name $argv[1]
    set -l body $argv[2..-1]
    abbr -a $name $body
    set -a __{{ cookiecutter.project_slug }}_abbreviations $name
end

