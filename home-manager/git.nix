{config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgsign = true;
      user.signingkey = "98BAFFD4123543A8412D15D2DD6D66939396C90E";
    };
  };
}
