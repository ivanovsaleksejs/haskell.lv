{
  network.description = "NixOS droplet";

  webserver = { config, pkgs, ... }: {
    imports = [
      ./fair-networking.nix # generated at runtime by nixos-infect
      ./users.nix
    ];

    boot.cleanTmpDir = true;
    networking.hostName = "NixOS";
    networking.firewall.allowPing = true;

    services = {
      nginx.enable = true;
      openssh = {
        enable = true;
        permitRootLogin = "yes";
      };
    };

    environment.systemPackages = with pkgs; [
      vim
    ];
  };
}
