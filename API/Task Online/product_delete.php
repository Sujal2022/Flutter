<?php


    include('connect.php');

    $id=$_POST["id"];
    
    $sql = "delete from product_s where id='$id'";
    mysqli_query($con,$sql);

    
?>