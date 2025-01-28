<?php
    include('connect.php');
        
    $select= "SELECT * FROM addproduct";
    $result = mysqli_query($con,$select);
    
    $response= array();
         
    while ($row = mysqli_fetch_array($result))
    {
        $value = array();
        $value["id"] = $row["id"];
        $value["p_name"] = $row["p_name"];
        $value["p_price"] = $row["p_price"];
        $value["p_detail"] = $row["p_detail"];
        $value["p_category"] = $row["p_category"];
        $value["p_img"] = $row["p_img"];
    
        array_push($response, $value);
    }
    echo json_encode($response);
?>