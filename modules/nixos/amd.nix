{ pkgs, lib, ... }: {

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    rocmPackages.rocm-smi
    nvtopPackages.amd
  ];
  nixpkgs.config.rocmSupport = true;
  services.lact.enable = true;

  services.xserver.videoDrivers = lib.mkDefault [ "modesetting" "amdgpu" ];

  # enable amdgpu kernel module
  boot = {
    initrd.kernelModules =
      [ "amdgpu" ]; # load amdgpu kernel module as early as initrd
    kernelModules = [
      "amdgpu"
    ]; # if loading somehow fails during initrd but the boot continues, try again later
  };

  # enables AMDVLK & OpenCL support
  # hardware.graphics = {
  #   extraPackages = with pkgs;
  #     [
  #       # mesa
  #       mesa

  #       # vulkan
  #       vulkan-tools
  #       vulkan-loader
  #       vulkan-validation-layers
  #       vulkan-extension-layer
  #     ] ++ (
  #       # this is a backwards-compatible way of loading appropriate opencl packages
  #       # in case the host runs an older revision of nixpkgs
  #       if pkgs ? rocmPackages.clr then
  #         with pkgs.rocmPackages; [ clr clr.icd ]
  #       else
  #         with pkgs; [ rocm-opencl-icd rocm-opencl-runtime ]);

  # };
}
