{
  network.description = "NixOS droplet";

  webserver = { config, pkgs, ... }:
    {
      imports = [
       ./fair/networking.nix # generated at runtime by nixos-infect
       ./fair/openvpn.nix
       ./fair/users.nix
       ./fair/packages.nix
      ];

      boot.cleanTmpDir = true;
      networking.hostName = "NixOS";
      networking.firewall.allowPing = true;
      networking.firewall.allowedTCPPorts = [ 64550 ];

      programs.zsh.enable = true;

      services = {
        nginx.enable = true;
        openssh = {
          enable = true;
          permitRootLogin = "yes";
          gatewayPorts = "yes";
        };
      };

      security.sudo.wheelNeedsPassword = false;
    };
}
