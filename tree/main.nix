{
  library, #
  ...
}: {
  flake.nixosConfigurations = with library; (
    {}
    # // (createNixosSystem "x86_64-linux" "mutile")
    // (createNixosSystem "x86_64-linux" "frybo")
  );
}
