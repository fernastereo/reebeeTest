<?php
session_start();
require_once 'config.php';

if (!is_numeric($argv[1])) {
  echo "The paremeter must be a number";
  return 0;
}

$category_id = isset($argv[1]) ? $argv[1] : 0;

$currentDate = date("Y-m-d");

$sqlFlyers = "select f.id, f.startdate, f.enddate, c.name as category, f.flyerpriority, s.name as store
              from flyers f, categories c, stores s
              where f.category_id = c.id
              and f.store_id = s.id
              and (f.startdate <= '$currentDate' and f.enddate >= '$currentDate')";
              if ($category_id != 0) {
                $sqlFlyers .= " and f.category_id = $category_id";
              }
              $sqlFlyers .= " order by f.flyerpriority asc";

$queryResult = $pdo->query($sqlFlyers);
while ($row = $queryResult->fetch(PDO::FETCH_ASSOC)){
  echo $row['id'] . ' | ' . $row['startdate'] . ' | ' . $row['enddate'] . ' | ' . $row['category'] . ' | ' . $row['flyerpriority'] . ' | ' . $row['store'] . "\n";
}
