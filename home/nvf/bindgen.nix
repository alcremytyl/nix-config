builtins.map (args:
let
  mode   = builtins.elemAt args 0;
  key    = builtins.elemAt args 1;
  action = builtins.elemAt args 2;
  desc   = builtins.elemAt args 3;
  extras = builtins.elemAt args 4 // {};
in
  { inherit mode key action desc; silent = true; } // extras 
)

