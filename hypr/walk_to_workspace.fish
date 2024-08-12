set curr $(hyprctl activewindow | rg "workspace" | string replace -r "workspace: . \(" "" | string replace ")" "" | string trim)

if test (count $argv) -gt 0 -o "$argv[1]" = "--dir"
	set dir $(math $curr + $argv[2])
	hyprctl dispatch workspace $dir
end
