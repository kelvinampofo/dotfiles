function fish_right_prompt
        set -l time_str (date "+%H:%M:%S %Z")
        set_color a98ad3
        printf '%s ' $time_str
        set_color normal
end
