set opa $(rg "# fullscreen_opacity =" ~/.config/hypr/hyprland.conf | wc -l)
if test $opa -eq 1
	sed -i -e "s/# fullscreen_opacity =/fullscreen_opacity =/" ~/.config/hypr/hyprland.conf
else 
	sed -i -e "s/fullscreen_opacity =/# fullscreen_opacity =/" ~/.config/hypr/hyprland.conf
end
