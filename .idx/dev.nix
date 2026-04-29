{ pkgs, ... }: {
  channel = "stable-23.11";

  packages = [
    pkgs.php82
    pkgs.php82Packages.composer
    pkgs.mysql80
    pkgs.php82Extensions.mysqli
    pkgs.php82Extensions.pdo_mysql
  ];

  # Ativa o MySQL automaticamente
  services.mysql = {
    enable = true;
    package = pkgs.mysql80;
  };

  idx = {
    extensions = [
      "bmewburn.vscode-intelephense-client"
      "mynameless.php-extension-pack"
    ];

    # ESSA É A PARTE QUE O ERRO DIZ QUE ESTÁ FALTANDO:
    previews = {
      enable = true;
      previews = {
        web = {
          # Se o seu index.php estiver na raiz, mude "-t public" para "-t ."
          command = ["php" "-S" "0.0.0.0:$PORT" "-t" "public"];
          manager = "web";
        };
      };
    };
  };
}
