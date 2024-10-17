<?php

    include('connect.php');
    
    $sql ="select * from product_s";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        $value["pname"]=$row["pname"];
        $value["pprice"]=$row["pprice"];
        $value["pdesc"]=$row["pdesc"];
    
        
    
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>