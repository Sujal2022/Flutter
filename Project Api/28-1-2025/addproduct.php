<?php
    header('Content-Type: application/json'); // Return JSON response
    include 'connect.php';

    $upload_path = 'images/';
    $upload_url = 'https://' . $_SERVER['SERVER_NAME'] . "/Sujal/" . $upload_path;

    // Get POST parameters
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $p_name = isset($_POST['p_name']) ? $_POST['p_name'] : '';
    $p_price = isset($_POST['p_price']) ? $_POST['p_price'] : '';
    $p_detail = isset($_POST['p_detail']) ? $_POST['p_detail'] : '';
    $p_category = isset($_POST['p_category']) ? $_POST['p_category'] : '';

    // Check if file is uploaded
    if (isset($_FILES["p_img"]) && $_FILES["p_img"]["error"] === UPLOAD_ERR_OK) {
        $fileinfo = pathinfo($_FILES["p_img"]["name"]);
        $extension = $fileinfo["extension"];

        $random = 'image_' . rand(1000, 9999); // Generate a random filename
        $file_url = $upload_url . $random . '.' . $extension; // Full URL
        $file_path = $upload_path . $random . '.' . $extension; // Server path

        // Move the uploaded file to the server
        if (move_uploaded_file($_FILES["p_img"]["tmp_name"], $file_path)) {
            $p_img = $file_url;

            // Insert data into the database
            $insert = "INSERT INTO addproduct (id, p_img, p_name, p_price, p_detail, p_category) 
                       VALUES ('$id', '$p_img', '$p_name', '$p_price', '$p_detail', '$p_category')";
            $result = mysqli_query($con, $insert);

            if ($result) {
                // Successful response
                echo json_encode([
                    "success" => true,
                    "message" => "Product added successfully",
                    "data" => [
                        "id" => $id,
                        "p_img" => $p_img,
                        "p_name" => $p_name,
                        "p_price" => $p_price,
                        "p_detail" => $p_detail,
                        "p_category" => $p_category
                    ]
                ]);
            } else {
                // Database error response
                echo json_encode([
                    "success" => false,
                    "message" => "Database error: " . mysqli_error($con)
                ]);
            }
        } else {
            // File upload failed
            echo json_encode([
                "success" => false,
                "message" => "Failed to upload the image"
            ]);
        }
    } else {
        // File not uploaded or error occurred
        echo json_encode([
            "success" => false,
            "message" => "Image file not uploaded or invalid"
        ]);
    }
?>
