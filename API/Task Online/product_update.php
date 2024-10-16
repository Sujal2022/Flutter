<?php


    include('connect.php');

    $id=$_POST["id"];
    $pname = $_POST["pname"];
    $pprice = $_POST["pprice"];
    $pdesc = $_POST["pdesc"];

    if($id=="" && $pname=="" && $pprice=="" && $pdesc=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update product set pname='$pname',pprice='$pprice',pdesc='$pdesc' where id='$id'";
        mysqli_query($con,$sql);
    }





?>