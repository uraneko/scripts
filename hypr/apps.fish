# notify-send $(hyprctl clients | rg "class" | string replace "class: " "" | xargs)
set apps $(hyprctl clients | rg "class:|workspace:" -U | string trim)

set workspace $(hyprctl activewindow | rg "workspace" | string replace -r "\(\d\)" "" | string trim)
set workspace_n $(echo $workspace | string replace "workspace: " "" | string trim)

set relevant 

for idx in (seq (count $apps))
	set take_app $(echo $apps[$idx] |  sed "/workspace: $workspace_n/!d" | string trim)
	if test "$take_app" != ""
		set item $apps[$(math $idx+1)] 
		set item $(echo $item | string replace "class: " "" | string trim)
		set -a relevant "$item"
	end
end

set relevant $(string join ", "  $relevant)

notify-send "🖵 $workspace"
notify-send $relevant
