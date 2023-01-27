function _{{ cookiecutter.project_slug }}_install --on-event {{ cookiecutter.project_slug }}_install

end

function _{{ cookiecutter.project_slug }}_update --on-event {{ cookiecutter.project_slug }}_update
    _{{ cookiecutter.project_slug }}_uninstall
    _{{ cookiecutter.project_slug }}_install
end

function _{{ cookiecutter.project_slug }}_uninstall --on-event {{ cookiecutter.project_slug }}_uninstall
    _{{ cookiecutter.project_slug }}_destroy
end
