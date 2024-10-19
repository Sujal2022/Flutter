<?php


    include('connect.php');

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
        $sql = "insert into baby_name(name,meaning,gender,religion,rashi) values ('$name','$meaning','$gender','$religion','$rashi')";
        mysqli_query($con,$sql);
    }





?>