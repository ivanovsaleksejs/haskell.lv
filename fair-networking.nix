{ ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [
      "67.207.67.2"
      "67.207.67.3"
    ];
    defaultGateway = "206.189.16.1";
    defaultGateway6 = "";
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address = "206.189.16.166"; prefixLength = 24; }
        ];
        ipv6.addresses = [
          { address = "fe80::6c44:bcff:fe7e:79a2"; prefixLength = 24; }
        ];
      };
      
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="6e:44:bc:7e:79:a2", NAME="eth0"
    
  '';
}
