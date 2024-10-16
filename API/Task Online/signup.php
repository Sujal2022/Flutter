<?php


    include('connect.php');

    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $gender = $_POST["gender"];
    $city = $_POST["city"];

    if($fname=="" && $lname=="" && $email=="" && $password=="" && $gender=="" && $city=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into signup(fname,lname,email,password,gender,city) values ('$fname','$lname','$email','$password','$gender','$city')";
        mysqli_query($con,$sql);
    }





?>