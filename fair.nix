{
  network.description = "NixOS droplet";

  webserver = { config, pkgs, ... }:
    { 
      imports = [
       ./fair/networking.nix # generated at runtime by nixos-infect
       ./fair/users.nix
      ];

      boot.cleanTmpDir = true;
      networking.hostName = "NixOS";
      networking.firewall.allowPing = true;
      services.nginx.enable = true;
      services.openssh = {
        enable = true;
        permitRootLogin = "yes";
      };
    };
}
