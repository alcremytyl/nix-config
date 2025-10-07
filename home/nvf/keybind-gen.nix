builtins.map (args:
  let
    key    = builtins.elemAt args 0;
    action = builtins.elemAt args 1;
    desc   = builtins.elemAt args 2;
    extras = builtins.elemAt args 3 // {};
    mode   = extras.mode or ["n"];
    silent = if builtins.hasAttr "silent" extras then extras.silent else true;
  in
    { inherit key action desc mode silent; } // (builtins.removeAttrs extras ["mode" "silent"])
)
