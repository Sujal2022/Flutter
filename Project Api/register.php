<?php

    include('connect.php');

    $name = $_POST["name"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $password = $_POST["password"];

    if($name=="" && $email=="" && $phone=="" && $password=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into registerpage(name,email,phone,password) values ('$name','$email','$phone','$password')";
        mysqli_query($con,$sql);

        echo "inserted succesfully";

    }

?>