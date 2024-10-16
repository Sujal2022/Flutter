<?php


    include('connect.php');

    $id=$_POST["id"];
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $gender = $_POST["gender"];
    $city = $_POST["city"];

    if($id=="" && $fname=="" && $lname=="" && $email=="" && $password=="" && $gender=="" && $city=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update signup set fname='$fname', lname='$lname', email='$email' , password=$password',gender='$gender',city='$city' where id='$id''";
        mysqli_query($con,$sql);
    }





?>