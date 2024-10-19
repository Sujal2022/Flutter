<?php


    include('connect.php');

    $id=$_POST["id"];
    $name = $_POST["name"];
    $meaning = $_POST["meaning"];
    $gender = $_POST["gender"];
    $religion = $_POST["religion"];
    $rashi = $_POST["rashi"];

    if($name=="" && $meaning=="" && $gender=="" && $religion=="" && $rashi=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update baby_name set name='$name',meaning='$meaning',gender='$gender',religion='$religion',rashi='$rashi' where id='$id'";
        mysqli_query($con,$sql);
    }





?>