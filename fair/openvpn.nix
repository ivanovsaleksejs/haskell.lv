{ pkgs, ... }:

# https://nixos.wiki/wiki/OpenVPN
# https://nixos.org/nix-dev/2016-May/020447.html
# https://community.openvpn.net/openvpn/wiki/Openvpn24ManPage
# https://openvpn.net/index.php/open-source/documentation/howto.html#examples

let
  # generate via openvpn --genkey --secret your.key
  secret = builtins.readFile ../secrets/fair-openvpn.key;
  secret-path = "/root/openvpn.key";

  domain = "vpn.localhost.localdomain";
  vpn-dev = "tun0";
  port = 1194;
in {
  networking.nat = {
    enable = true;
    externalInterface = "eth0";
    internalInterfaces  = [ vpn-dev ];
  };

  networking.firewall.trustedInterfaces = [ vpn-dev ];
  networking.firewall.allowedUDPPorts = [ port ];

  deployment.keys.openvpn.text = secret;
  systemd.services.nixops-keys.postStart = "cp /run/keys/openvpn ${secret-path}";
  systemd.services.nixops-keys.wantedBy = [ "keys.target" ];
  systemd.services.openvpn-fair.after = [ "nixops-keys.service" ];

  services.openvpn.servers.fair.config = ''
    dev ${vpn-dev}
    proto udp
    ifconfig 10.8.0.1 10.8.0.2
    secret ${secret-path}
    port ${toString port}

    cipher AES-256-CBC
    auth-nocache

    comp-lzo
    keepalive 10 60
    ping-timer-rem
    persist-tun
    persist-key
  '';
}
