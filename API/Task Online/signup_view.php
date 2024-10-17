<?php

    include('connect.php');
    
    $sql ="select * from signup";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        $value["fname"]=$row["fname"];
        $value["lname"]=$row["lname"];
        $value["email"]=$row["email"];
        $value["password"]=$row["password"];
        $value["gender"]=$row["gender"];
        $value["city"]=$row["city"];
    
        
    
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>