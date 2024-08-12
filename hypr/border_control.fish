set border $(rg "border_switch " ~/.config/hypr/hyprland.conf | string replace "\$border_switch = " "" | string trim)
set new $(math  4 - $border)
sed -i -e "s/border_switch = $border/border_switch = $new/" ~/.config/hypr/hyprland.conf
