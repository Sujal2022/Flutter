<?php


    include('connect.php');

    $id=$_POST["id"];
    
    $sql = "delete from baby_name where id='$id'";
    mysqli_query($con,$sql);

?>