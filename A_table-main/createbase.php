<!DOCTYPE html>
<html>
    <head>
        <title> MySQL</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="atable.css">
    </head>
    <body>
        <h1>CREATE DATABASE MySQL</h1>
        <?php
            $servername = 'localhost';
            $dbname= 'a_table';
            $username = 'root';
            $password = 'narbonne12';

            try{
                $dbco = new PDO("mysql:host=$servername", $username, $password);
                $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                $sql = "CREATE DATABASE a_table";
                $dbco->exec($sql);

                echo 'DATABASE is Created Successfully !';
            }

            catch(PDOException $e){
              echo "Error : " . $e->getMessage();
            }


            try{
                            $dbco = new PDO("mysql:host=$servname;dbname=$dbname");
                            $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                            $table_client = "CREATE TABLE IF NOT EXISTS 'clients'(
                                    numQR INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                                    smartphone VARCHAR(30) NOT NULL,
                                    langue VARCHAR(30) NOT NULL,
                                    dates DATETIME NOT NULL)";

                            $table_tables = "CREATE TABLE IF NOT EXISTS 'orga_tables'(
                                    numTABLES INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                                    emplacement VARCHAR(30) NOT NULL,
                                    situation VARCHAR(30) NOT NULL,
                                    chaises INT NOT NULL)";

                            $table_qrCodes = "CREATE TABLE IF NOT EXISTS 'qr_codes'(
                                    numQR INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                                    nom VARCHAR(30) NOT NULL,
                                    numTABLES INT NULL)";


                            $dbco->exec($table_client);
                            $dbco->exec($table_tables);
                            $dbco->exec($table_qrCodes);
                            echo 'Tables created Successfully !';
                        }

                        catch(PDOException $e){
                          echo "Erreur : " . $e->getMessage();
                        }



?>
    </body>
</html>
