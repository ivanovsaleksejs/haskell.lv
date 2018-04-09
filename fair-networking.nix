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
        ip4 = [
          { address="206.189.16.166"; prefixLength=20; }
        ];
        ip6 = [
          { address="fe80::6c44:bcff:fe7e:79a2"; prefixLength=64; }
        ];
      };
      
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="6e:44:bc:7e:79:a2", NAME="eth0"
    
  '';
}
