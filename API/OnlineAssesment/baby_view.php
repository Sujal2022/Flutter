<?php

    include('connect.php');
    
    $sql ="select * from baby_name";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"];
        $value["name"] = $row["name"];
        $value["meaning"] = $row["meaning"];
        $value["gender"] = $row["gender"];
        $value["religion"] = $row["religion"];
        $value["rashi"] = $row["rashi"];
    
  
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>