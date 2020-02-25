<?php
session_start();
require_once 'config.php';

$fileUploaded = $argv[1];

$fileExtension = explode(".", $fileUploaded);
if ($fileExtension[1] == 'csv') {
  $handle = fopen($fileUploaded, "r");
  
  $i = 0;
  $data = fgetcsv($handle);
  $lastRecord = [];
  while ($data = fgetcsv($handle)) {
    $currentRecord = array_slice($data, 0, 5);
    if ($currentRecord != $lastRecord) {
      //insertar la linea
      $startDate = $data[0];
      $endDate = $data[1];
      $storeName = $data[2];
      $flyerPriority = $data[3];
      $categoryName = $data[4];
      $pageNumber = $data[5];
      $fileName = $data[6];
      $timestamp = date("Y-m-d H:i:s");

      $category_id = getCategory($categoryName);
      if ($category_id == 0) {
        //create the category if it does not exist
        $sqlCategory = "Insert into categories (name, created_at, modified_at) values ('$categoryName', '$timestamp', '$timestamp')";
        $pdo->exec($sqlCategory);
      }
      $store_id = getStore($storeName);
      if ($store_id == 0) {
        //create the store if it does not exist
        $sqlStore = "Insert into stores (name, created_at, modified_at) values ('$storeName', '$timestamp', '$timestamp')";
        $pdo->exec($sqlStore);
      }

      $sqlFlyer = "Insert into flyers (startdate, enddate, store_id, flyerpriority, category_id, created_at, modified_at) 
                  values ('$startDate', '$endDate', $store_id, $flyerPriority, $category_id, '$timestamp', '$timestamp')";
      $pdo->exec($sqlFlyer);
      $flyer_id = $pdo->lastInsertId();
    }
    $lastRecord = $currentRecord;

    //insert the pages
    $sqlPages = "Insert into pages (flyer_id, pagenumber, filename, created_at, modified_at) 
                values ($flyer_id, $pageNumber, '$fileName', '$timestamp', '$timestamp')";
    $pdo->exec($sqlPages);
  }

  fclose($handle);
  echo "Import finished!";
}

function getCategory($categoryName){
  global $pdo;

  $sqlCategory = "select id from categories where name='" . $categoryName . "'";
  $queryResult = $pdo->query($sqlCategory);
  $row = $queryResult->fetch(PDO::FETCH_ASSOC);

  if($row !== false){
    return $row['id'];
  }else{
    return 0;
  }
}

function getStore($storeName){
  global $pdo;

  $sqlStore = "select id from stores where name='" . $storeName . "'";
  $queryResult = $pdo->query($sqlStore);
  $row = $queryResult->fetch(PDO::FETCH_ASSOC);

  if($row !== false){
    return $row['id'];
  }else{
    return 0;
  }
}