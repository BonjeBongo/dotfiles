{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  config = {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot = {
      initrd = {
        avaliableKernelModules = [
          "nvme"
          "xhci_pci"
          "ahci"
          "usb_storage"
          "sd_mod"
          "rtsx_pci_sdmmc"
        ];
        kernelModules = [ ];

      };
      kernelModules = [ "kvm-amd" ];
      extraModulePackages = [ ];
    };

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/nixos";
        fsType = "btrfs";
      };
      "/boot" = {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
        options = [ 
          "fmask=077"
          "dmask=077"
        ];
      };
    };

    swapDevices = lib.mkForce [ ];

    networking = {
      useDHCP = lib.mkDefault false; 
      interfaces = {
        eno1.ipv4.addresses = [{
          address = "192.168.0.7";
          prefixLength = 24;
        }];
        wlo1.useDHCP = lib.mkDefault true;
      };
      defaultGateway = {
        address = "192.168.0.9";
        interface = "eno1";
      };
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  }
}