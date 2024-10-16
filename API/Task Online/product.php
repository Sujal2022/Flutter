<?php


    include('connect.php');

    $pname = $_POST["pname"];
    $pprice = $_POST["pprice"];
    $pdesc = $_POST["pdesc"];

    if($pname=="" && $price=="" && $pdesc=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into product(pname,pprice,pdesc) values ('$pname','$pprice','$pdesc')";
        mysqli_query($con,$sql);
    }





?>