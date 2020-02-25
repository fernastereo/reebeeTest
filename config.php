<?php

//Add your credentials here:
$DBHOST = 'localhost';
$DBNAME = 'reebeeTest';
$DBUSER = 'root';
$DBPASS = '';

try {
  $pdo = new PDO("mysql:host=$DBHOST;dbname=$DBNAME", $DBUSER, $DBPASS);
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
  echo $e->getMessage();
}