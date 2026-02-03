let 
  fg = "#cdd6f4";
  bg = "#1e1e2e";
  frame = "#89b4fa";
  frame-critical = "#fab387";
in {
  enable = true;
  settings =  {
    global = {
      frame_color = frame;
      separator_color= "#89b4fa";
      highlight = "#89b4fa";
    };

    urgency_low = {
      background = bg;
      foreground = fg;
    };

    urgency_normal = {
      background = bg;
      foreground = fg;
    };

    urgency_critical = {
      background = bg;
      foreground = fg;
      frame_color = frame-critical;
    };
  };
}
