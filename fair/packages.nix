{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    file
    htop
    iotop
    jq
    manpages
    ncdu
    nmap
    p7zip
    ranger
    ruby
    socat
    tmux
    utillinux
  ];
}
