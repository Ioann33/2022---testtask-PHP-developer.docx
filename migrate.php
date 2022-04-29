<?php


ini_set('display_errors', 0);

include_once 'config.php';


$sql = "CREATE TABLE notes (id int unsigned auto_increment primary key, text varchar(255));";

$db = new mysqli(DB_HOST, DB_USER,DB_PASS, DB_NAME);
if ($db->connect_errno!==0){
    exit($db->connect_error);
}
$result = $db->query($sql);
echo 'db structure: ' . ($result ? 'true' : 'false');
