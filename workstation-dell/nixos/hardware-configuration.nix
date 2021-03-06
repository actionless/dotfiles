# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "ata_generic" "uhci_hcd" "ehci_pci" "ahci" "firewire_ohci" "usb_storage" ];
  #boot.loader.grub.device = "/dev/sda";
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4b1b780a-d474-4d64-b536-08c15de2891c";
    fsType = "ext4";
  };
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/713e9bd1-6c7a-46c2-b082-85e035c9b535";
    fsType = "ext4";
  };
  fileSystems."/tmp" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = "size=512m";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/5737c44a-6bf1-4c7d-95bc-1ffe9082e971";
    }
  ];

  nix.maxJobs = 2;
}
