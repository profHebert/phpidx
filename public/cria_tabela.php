<?php

// Conexão inicial sem selecionar o banco de dados para poder criá-lo
$host = '127.0.0.1';
$user = 'root';
$pass = '';
$dsn_server = "mysql:host=$host;charset=utf8mb4";

try {
    $pdo_server = new PDO($dsn_server, $user, $pass, [
       PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);

    // Cria o banco de dados se ele não existir
    $pdo_server->exec("CREATE DATABASE IF NOT EXISTS teste");
    //echo "<h1>Banco de dados 'teste' criado/verificado com sucesso!</h1>";

} catch (PDOException $e) {
    die("Erro ao criar o banco de dados: " . $e->getMessage());
}

// Agora que o DB existe, podemos nos conectar a ele
require_once 'conecta.php';

// Cria a tabela de produtos
$sql = "CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT DEFAULT 0
)";

$pdo->exec($sql);

echo "<h1>Tabela 'produtos' criada com sucesso!</h1>";

//header("Location: relatorio.php?msg=tabela_pronta");
