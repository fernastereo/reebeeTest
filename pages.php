<?php
session_start();
require_once 'config.php';

if (isset($argv[1]) && !is_numeric($argv[1])) {
  echo "The paremeter must be a number";
  return 0;
}

$flyer_id = isset($argv[1]) ? $argv[1] : 0;

$sqlPages = "select p.pagenumber, p.filename from pages p";
            if ($flyer_id != 0) {
              $sqlPages .= " where p.flyer_id = $flyer_id";
            }
            $sqlPages .= " order by p.pagenumber asc";

$queryResult = $pdo->query($sqlPages);
while ($row = $queryResult->fetch(PDO::FETCH_ASSOC)){
  echo $row['pagenumber'] . ' | ' . $row['filename'] . "\n";
}