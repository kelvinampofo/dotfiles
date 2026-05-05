function v
    if test (count $argv) -eq 0
        open . -a "Visual Studio Code"
    else
        open $argv -a "Visual Studio Code"
    end
end
