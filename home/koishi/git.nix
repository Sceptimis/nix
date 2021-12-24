{ ... }: {
  programs.git = {
    enable = true;
    userName = "Lleyton van Sambeeck";
    userEmail = "sceptimis@tuta.io";
    signing = {
      key = "2DF8904C3EC6EDCA";
      signByDefault = true;
    };
  };
}
