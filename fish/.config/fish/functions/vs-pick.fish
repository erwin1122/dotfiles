function vs-pick --description "Navigate to an open Visual Studio project (WSL2 → Windows)"
    set -l ps_script ~/.config/fish/scripts/vs_solutions.ps1

    if not test -f $ps_script
        echo "Error: $ps_script not found. Is your dotfiles symlink set up?" >&2
        return 1
    end

    set -l win_ps (wslpath -w $ps_script)
    # Redirect stdin to /dev/null so powershell.exe doesn't consume it
    set -l lines (/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -STA -ExecutionPolicy Bypass -File $win_ps </dev/null 2>/dev/null \
        | string trim --right --chars "\r")

    if test (count $lines) -eq 0
        echo "No open Visual Studio instances found." >&2
        return 1
    end

    set -l labels
    set -l dirs

    for line in $lines
        test -z $line && continue

        set -l parts (string split "|" $line)
        set -l win_path $parts[1]
        test -z $win_path && continue

        set -l wsl_path (wslpath $win_path 2>/dev/null)
        test $status -ne 0 && continue

        # Use directory of .sln/.slnx files; use path directly if it's a folder
        set -l wsl_dir
        if test -d $wsl_path
            set wsl_dir $wsl_path
        else
            set wsl_dir (dirname $wsl_path)
        end
        test -d $wsl_dir || continue

        # Extract project name from the Windows path (backslash-separated)
        set -l path_parts (string split "\\" $win_path)
        set -l proj_name (string replace -r '\.[^.]*$' '' $path_parts[-1])

        set labels $labels "$proj_name  →  $wsl_dir"
        set dirs $dirs $wsl_dir
    end

    if test (count $dirs) -eq 0
        echo "No accessible project directories found." >&2
        return 1
    end

    echo ""
    echo "Open Visual Studio projects:"
    echo ""
    for i in (seq 1 (count $dirs))
        printf "  [%d] %s\n" $i $labels[$i]
    end
    echo ""

    read -l -P "Select [1-"(count $dirs)"]: " choice

    if not string match -qr '^[0-9]+$' $choice
        echo "Invalid selection." >&2
        return 1
    end

    set -l idx (math $choice)
    if test $idx -lt 1; or test $idx -gt (count $dirs)
        echo "Invalid selection." >&2
        return 1
    end

    set -l target $dirs[$idx]
    echo ""
    echo "→ $target"
    cd $target
end
