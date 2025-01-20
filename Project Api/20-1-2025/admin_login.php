<?php

    include('connect.php');

    $name = $_POST["name"];
    $password = $_POST["password"];

    if($name=="" && $password=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into adminlogin(name,password) values ('$name','$password')";
        mysqli_query($con,$sql);

        echo "inserted succesfully";

    }

?>