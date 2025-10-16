function fish_prompt
        set -l last_command_status $status

        if not set -q -g __fish_prompt_helpers_initialized
                # cache helper definitions to avoid repeatedly redefining them on each prompt draw
                set -g __fish_prompt_helpers_initialized

                function __fish_prompt_git_branch
                        # prefer the symbolic branch name; fall back to the short commit hash when detached
                        set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
                        if set -q branch[1]
                                echo (string replace -r '^refs/heads/' '' $branch)
                        else
                                echo (git rev-parse --short HEAD 2>/dev/null)
                        end
                end

                function __fish_prompt_is_git_repo
                        type -q git
                        or return 1
                        git rev-parse --git-dir >/dev/null 2>&1
                end
        end

        set -l color_cyan (set_color -o cyan)
        set -l color_red (set_color -o red)
        set -l color_green (set_color -o green)
        set -l color_blue (set_color -o blue)
        set -l color_reset (set_color normal)

        set -l prompt_indicator_color $color_green
        if test $last_command_status != 0
                set prompt_indicator_color $color_red
        end

        set -l prompt_indicator "$prompt_indicator_color➜"
        if fish_is_root_user
                set prompt_indicator "$prompt_indicator_color#"
        end

        set -l current_directory $color_cyan(prompt_pwd)

        set -l repository_segment

        # build git metadata segment if we are inside a repository
        if __fish_prompt_is_git_repo
                set -l branch_name (__fish_prompt_git_branch)
                set -l commit_hash (git rev-parse --short HEAD 2>/dev/null)
                if test -n "$branch_name"
                        set -l branch_text "$color_red$branch_name"
                        if test -n "$commit_hash"
                                set -l hash_text "$color_red$commit_hash"
                                set repository_segment (string join '' $color_blue $branch_text $color_blue '(' $hash_text $color_blue ')')
                        else
                                set repository_segment (string join '' $color_blue $branch_text $color_blue)
                        end
                end
        end

        if test -n "$repository_segment"
                echo -n -s $prompt_indicator ' ' $current_directory ' ' $repository_segment $color_reset ' '
        else
                echo -n -s $prompt_indicator ' ' $current_directory $color_reset ' '
        end
end
