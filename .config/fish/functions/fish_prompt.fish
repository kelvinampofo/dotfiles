function fish_prompt
        set -l last_command_status $status
        set -l color_red (set_color -o red)
        set -l prompt_components

        if fish_is_root_user
                set -a prompt_components "$color_red#"
        else if test $last_command_status -ne 0
                set -a prompt_components "$color_red!"
        end

        set -a prompt_components (set_color -o cyan)(prompt_pwd)

        # fall back to the short commit hash when HEAD is detached
        set -l branch (git branch --show-current 2>/dev/null)
        and test -z "$branch"
        and set branch (git rev-parse --short HEAD 2>/dev/null)

        if test -n "$branch"
                set -a prompt_components (set_color B0B9F9)$branch
        end

        echo -n -s (string join ' ' $prompt_components) ' ' (set_color CBA6F7) '>' (set_color normal) ' '
end
