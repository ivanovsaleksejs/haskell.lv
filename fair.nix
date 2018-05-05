{
  network.description = "NixOS droplet";

  webserver = { config, pkgs, ... }:
    {
      imports = [
       ./fair/networking.nix # generated at runtime by nixos-infect
       ./fair/users.nix
       ./fair/packages.nix
      ];

      boot.cleanTmpDir = true;
      networking.hostName = "NixOS";
      networking.firewall.allowPing = true;

      programs.zsh.enable = true;

      services = {
        nginx.enable = true;
        openssh = {
          enable = true;
          permitRootLogin = "yes";
        };
      };

      security.sudo.wheelNeedsPassword = false;
    };
}
