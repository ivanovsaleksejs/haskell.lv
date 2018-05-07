{ pkgs, ... }:

# https://nixos.wiki/wiki/OpenVPN
# https://nixos.org/nix-dev/2016-May/020447.html
# https://community.openvpn.net/openvpn/wiki/Openvpn24ManPage
# https://openvpn.net/index.php/open-source/documentation/howto.html#examples

let
  keydir = "/root";

  keys = builtins.listToAttrs (map (f: {
    name = baseNameOf f;
    value = {
      text = builtins.readFile f;
    };
  }) keyfiles);

  keyfiles = [
    ../secrets/pki/ca.crt
    ../secrets/pki/issued/server.crt
    ../secrets/pki/private/server.key
    ../secrets/pki/dh.pem
  ];

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

  deployment.keys = keys;

  systemd.services.nixops-keys.postStart = "cp /run/keys/* ${keydir}/";
  systemd.services.openvpn-fair.after = [ "nixops-keys.service" ];

  services.openvpn.servers.fair.config = ''
    dev ${vpn-dev}
    proto udp
    port ${toString port}

    mode server
    topology subnet
    server 10.8.0.0 255.255.255.0
    client-to-client

    ca ${keydir}/ca.crt
    cert ${keydir}/server.crt
    key ${keydir}/server.key
    dh ${keydir}/dh.pem

    cipher AES-256-CBC
    auth-nocache

    comp-lzo
    keepalive 10 60
    ping-timer-rem
    persist-tun
    persist-key
  '';
}
