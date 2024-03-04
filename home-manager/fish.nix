{config, pkg, ...}:
{
  programs.fish.enable = true;
  
  programs.fish.shellAbbrs = {
    spicetify = "spicetify-cli";
    ls = "lsd";
  };

  programs.fish.shellAliases = {
    "..." = "cd ../..";
  };
}
