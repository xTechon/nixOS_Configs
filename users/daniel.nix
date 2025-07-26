{ ... }: {



  #imports = [ import builtins.baseNameOf "./containers.nix" ];

  users.groups.daniel = { };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.daniel = {
    isNormalUser = true;
    # createHome = true;
    group = "daniel";
    extraGroups = [
      "wheel"
      "networkmanager"
      "users"
      "pipewire"
      "containers"
      "docker"
      "tss" # tss group has access to TPM devices
    ];
    home = "/home/daniel";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEvZ3nBKkN7NPFdip1p5jpBtoaeJAoDGiLxTZOdNR+Ma daniel@NixLaptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAbH/JNOuvv3/rb87XPtxeBbtUFUXlnWcNcTdhNLw/55 daniel@GamingPC"
    ];
  };
}
