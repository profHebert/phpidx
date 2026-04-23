{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [
    pkgs.php82
    pkgs.mysql80
    pkgs.php82Extensions.mysqli
    pkgs.php82Extensions.pdo_mysql
    pkgs.curl
    pkgs.gnutar
    pkgs.gzip
  ];

  services.mysql.enable = true;

  idx = {
    extensions = [ "bmewburn.vscode-intelephense-client" ];
    workspace.onCreate = {
      # Cria a pasta do site e baixa o phpMyAdmin automaticamente
      setup-ambiente = ''
        mkdir -p www
        if [ ! -d "phpmyadmin" ]; then
          mkdir phpmyadmin
          curl -L https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz | tar xz -C phpmyadmin --strip-components=1
        fi
      '';
    };
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["php" "-S" "0.0.0.0:8080" "-t" "www"];
          manager = "web";
        };
        pma = {
          command = ["php" "-S" "0.0.0.0:8081" "-t" "phpmyadmin"];
          manager = "web";
        };
      };
    };
  };
}
