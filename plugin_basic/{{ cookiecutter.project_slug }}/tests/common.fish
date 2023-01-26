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

end

function teardown
    for var in $set_vars
        set -l tmp (string join "" _tmp $var)
        set -U $var $$tmp
    end
end

function setup_test

end
