set opa $(rg "custom_opacity = 1.0" ~/.config/hypr/hyprland.conf | wc -l)
if test $opa = "1"
	sed -i -e "s/\$custom_opacity = 1.0/\$custom_opacity = 0.79/" ~/.config/hypr/hyprland.conf
else 
	sed -i -e "s/\$custom_opacity = 0.79/\$custom_opacity = 1.0/" ~/.config/hypr/hyprland.conf
end
