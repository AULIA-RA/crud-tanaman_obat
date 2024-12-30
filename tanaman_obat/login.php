<?php
// Include your database connection here
include_once 'koneksi.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Content-Type: application/json; charset=UTF-8");
// Handle POST request to login
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get POST data
    $usernameOrEmail = $_POST['username_or_email'];
    $password = $_POST['password'];

    // Check if username or email exists
    $query = "SELECT * FROM users WHERE username = '$usernameOrEmail' OR email = '$usernameOrEmail'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);

        // Verify password
        if (password_verify($password, $user['password'])) {
            echo json_encode([
                'status' => 200,
                'message' => 'Login successful'
            ]);
        } else {
            echo json_encode([
                'status' => 401,
                'message' => 'Invalid password'
            ]);
        }
    } else {
        echo json_encode([
            'status' => 404,
            'message' => 'User not found'
        ]);
    }
}
?>
