{config, pkg, ...}:
{
  programs.foot.enable = true;
  programs.foot.server.enable = true;
  
  programs.foot.settings = {
    main = {
      font = "Fira Code:size=13";
    };

    colors = {
      alpha = 0.7;
    };

    mouse = {
      hide-when-typing: "yes";
    };
  };
}
