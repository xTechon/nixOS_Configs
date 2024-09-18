{...}: {

  users.groups.march = {};
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.march = {
    isNormalUser = true;
    # createHome = true;
    group = "march";
    extraGroups = [
      "networkmanager"
      "users"
      "pipewire"
      ];
   home = "/home/march";
   openssh.authorizedKeys.keys = [
   ];
  };
}
