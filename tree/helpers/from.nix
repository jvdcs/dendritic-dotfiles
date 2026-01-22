# This helper allows you to override the `pkgs` argument for a specific module,
# letting you pin individual modules to different nixpkgs versions.
#
# Usage:
#   (helpers.from inputs.nixpkgs-stable feature-someThing)
#   (helpers.from inputs.nixpkgs-master feature-bleedingEdge)
{
  flake.helpers.from = nixpkgsInput: module:
  # the NixOS module system calls this function with standard module arguments.
  # this function intercepts them, builds an alternative pkgs from the provided nixpkgs input,
  # then forward to the actual module with our substituted pkgs.
  {pkgs, ...} @ args: let
    altPkgs = import nixpkgsInput {
      inherit (pkgs) system;

      # preserve nixpkgs config (allowUnfree, permittedInsecurePackages, etc.)
      # so the alternative pkgs behaves consistently with your global settings.
      # unless you want to override these too, in which case, just change this
      # function to take whatever config you need it to.
      config = pkgs.config;
    };
  in
    # call the actual module, replacing pkgs in the args with the alternative.
    # the module receives altPkgs as `pkgs`, but everything else (config, lib, etc.)
    # remains unchanged.
    module (args // {pkgs = altPkgs;});
}
