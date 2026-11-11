{ lib, ... }:
let 
  inherit (lib.generators) mkLuaInline;
  mod = "SUPER";
  terminal = "kitty";
  file_manager = "thunar";
  menu = "rofi -show drun"; # TODO: check out hyprlauncher
  screenshot = "hyprshot -m";

  bind' = key: value: opts: {
    _args = [key value] ++ lib.optional(opts != {}) opts; 
  } ;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    # https://mynixos.com/home-manager/option/wayland.windowManager.hyprland.settings
    # forced to use lua ver in hypr 0.57
    configType = "lua";
    settings = {

      # startup processes
      on._args = [
        "hyprland.start"
        (mkLuaInline '' function()
          hl.exec_cmd("waybar")
        end '')
      ];

      bind = [
        (bind' "${mod} + SPACE"     (mkLuaInline ''hl.dsp.exec_cmd("${terminal}")'') {})
        (bind' "${mod} + RETURN"    (mkLuaInline ''hl.dsp.exec_cmd("${menu}")'') {})
        (bind' "${mod} + E"         (mkLuaInline ''hl.dsp.exec_cmd("${file_manager}")'') {})
        (bind' "${mod} + S"         (mkLuaInline ''hl.dsp.exec_cmd("${screenshot} region -o $HOME/Pictures/Screenshots/")'') {})
        (bind' "${mod} + SHIFT + S" (mkLuaInline ''hl.dsp.exec_cmd("${screenshot} output -o $HOME/Pictures/Screenshots/")'') {})


        # swap to next and put to top
        (bind' "${mod} + TAB" (mkLuaInline '' function()
          hl.dispatch(hl.dsp.window.cycle_next())
          hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
        end '') {})

        (bind' "${mod} + W" (mkLuaInline ''hl.dsp.window.close()'') {})
        (bind' "${mod} + V" (mkLuaInline ''hl.dsp.window.float({ action = "toggle" })'') {})
        (bind' "${mod} + F" (mkLuaInline ''hl.dsp.window.fullscreen({ action = "toggle" })'') {})
        (bind' "${mod} + P" (mkLuaInline ''hl.dsp.window.pin({ action = "toggle" })'') {}) # TODO: red border when highlighted

        (bind' "${mod} + LEFT"  (mkLuaInline ''hl.dsp.focus({ direction = "left" })'') {})
        (bind' "${mod} + RIGHT" (mkLuaInline ''hl.dsp.focus({ direction = "right" })'') {})
        (bind' "${mod} + UP"    (mkLuaInline ''hl.dsp.focus({ direction = "up" })'') {})
        (bind' "${mod} + DOWN"  (mkLuaInline ''hl.dsp.focus({ direction = "down" })'') {})

        (bind' "${mod} + CTRL + LEFT"   (mkLuaInline ''hl.dsp.window.swap({ direction = "left" })'') {})
        (bind' "${mod} + CTRL + RIGHT"  (mkLuaInline ''hl.dsp.window.swap({ direction = "right" })'') {})
        (bind' "${mod} + CTRL + UP"     (mkLuaInline ''hl.dsp.window.swap({ direction = "up" })'') {})
        (bind' "${mod} + CTRL + DOWN"   (mkLuaInline ''hl.dsp.window.swap({ direction = "down" })'') {})

        (bind' "${mod} + 1" (mkLuaInline ''hl.dsp.focus({ workspace = 1 })'') {})
        (bind' "${mod} + 2" (mkLuaInline ''hl.dsp.focus({ workspace = 2 })'') {})
        (bind' "${mod} + 3" (mkLuaInline ''hl.dsp.focus({ workspace = 3 })'') {})
        (bind' "${mod} + 4" (mkLuaInline ''hl.dsp.focus({ workspace = 4 })'') {})
        (bind' "${mod} + 5" (mkLuaInline ''hl.dsp.focus({ workspace = 5 })'') {})
        (bind' "${mod} + 6" (mkLuaInline ''hl.dsp.focus({ workspace = 6 })'') {})
        (bind' "${mod} + 7" (mkLuaInline ''hl.dsp.focus({ workspace = 7 })'') {})
        (bind' "${mod} + 8" (mkLuaInline ''hl.dsp.focus({ workspace = 8 })'') {})
        (bind' "${mod} + 9" (mkLuaInline ''hl.dsp.focus({ workspace = 9 })'') {})
        (bind' "${mod} + 0" (mkLuaInline ''hl.dsp.focus({ workspace = 10 })'') {})

        (bind' "${mod} + SHIFT + 1" (mkLuaInline ''hl.dsp.window.move({ workspace = 1, follow = true })'') {})
        (bind' "${mod} + SHIFT + 2" (mkLuaInline ''hl.dsp.window.move({ workspace = 2, follow = true })'') {})
        (bind' "${mod} + SHIFT + 3" (mkLuaInline ''hl.dsp.window.move({ workspace = 3, follow = true })'') {})
        (bind' "${mod} + SHIFT + 4" (mkLuaInline ''hl.dsp.window.move({ workspace = 4, follow = true })'') {})
        (bind' "${mod} + SHIFT + 5" (mkLuaInline ''hl.dsp.window.move({ workspace = 5, follow = true })'') {})
        (bind' "${mod} + SHIFT + 6" (mkLuaInline ''hl.dsp.window.move({ workspace = 6, follow = true })'') {})
        (bind' "${mod} + SHIFT + 7" (mkLuaInline ''hl.dsp.window.move({ workspace = 7, follow = true })'') {})
        (bind' "${mod} + SHIFT + 8" (mkLuaInline ''hl.dsp.window.move({ workspace = 8, follow = true })'') {})
        (bind' "${mod} + SHIFT + 9" (mkLuaInline ''hl.dsp.window.move({ workspace = 9, follow = true })'') {})
        (bind' "${mod} + SHIFT + 0" (mkLuaInline ''hl.dsp.window.move({ workspace = 0, follow = true })'') {})

        (bind' "${mod} + mouse:272" (mkLuaInline ''hl.dsp.window.drag()'') { mouse = true; })
        (bind' "${mod} + mouse:273" (mkLuaInline ''hl.dsp.window.resize()'') { mouse = true; })

        (bind' "${mod} + ALT + LEFT"  (mkLuaInline ''hl.dsp.window.resize({ x = -50, y = 0,   relative = true;})'') { repeating = true; })
        (bind' "${mod} + ALT + RIGHT" (mkLuaInline ''hl.dsp.window.resize({ x = 50,  y = 0,   relative = true;})'') { repeating = true; })
        (bind' "${mod} + ALT + UP"    (mkLuaInline ''hl.dsp.window.resize({ x = 0,   y = -50, relative = true;})'') { repeating = true; })
        (bind' "${mod} + ALT + DOWN"  (mkLuaInline ''hl.dsp.window.resize({ x = 0,   y = 50,  relative = true;})'') { repeating = true; })

        (bind' "XF86AudioRaiseVolume" (mkLuaInline ''hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")'') { locked = true; repeating = true; })
        (bind' "XF86AudioLowerVolume" (mkLuaInline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'')      { locked = true; repeating = true; })
        (bind' "XF86AudioMute"	      (mkLuaInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'')     { locked = true; repeating = true; })
        (bind' "XF86AudioMicMute"	    (mkLuaInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'')   { locked = true; repeating = true; })

        (bind' "XF86MonBrightnessUp"   (mkLuaInline  ''hl.dsp.exec_cmd("brightnessctl -e -n2 set 5%+")'') { locked = true; repeating = true; })
        (bind' "XF86MonBrightnessDown" (mkLuaInline ''hl.dsp.exec_cmd("brightnessctl -e -n2 set 5%-")'')  { locked = true; repeating = true; })

        (bind' "XF86AudioNext"  (mkLuaInline ''hl.dsp.exec_cmd("playerctl next")'')       { locked = true; })
        (bind' "XF86AudioPause" (mkLuaInline ''hl.dsp.exec_cmd("playerctl play-pause")'') { locked = true; })
        (bind' "XF86AudioPlay"  (mkLuaInline ''hl.dsp.exec_cmd("playerctl play-pause")'') { locked = true; })
        (bind' "XF86AudioPrev"  (mkLuaInline ''hl.dsp.exec_cmd("playerctl previous")'')   { locked = true; })
      ];

      env = [
        (bind' "XCURSOR_SIZE" 24 {})
        (bind' "HYPRCURSOR_SIZE" 24 {})
      ];


      config.general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";

        col.active_border = { colors = ["rgba(33ccffee)" "rgba(00ff99ee)"]; angle = 45; };
        col.inactive_border = "rgba(595959aa)";
      };

      config.animations.enabled = true;

      config.decoration = {

        rounding = 10;
        rounding_power = 2;

        active_opacity = 1.0;
        inactive_opacity = 0.9;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.169;
        };
      };

      config.misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      config.input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = 0;

        touchpad.natural_scroll = true;
      };
    };
  };

  services.hyprpaper = 
  let
    wallpaper = toString ./wallpaper.png;
    monitors = [ "HDMI-A-1" "HDMI-A-2" "HDMI-A-3" "DP-1" "DP-2" "eDP-1" ];
  in {
    enable = true;
    settings = {
      wallpaper = map(monitor: { monitor=monitor; path=wallpaper; }) monitors;
    };
  };

  programs.hyprshot = {
    enable = true;
    saveLocation = "$HOME/Pictures/Screenshots"; # does NOTHING
  };
}
