<?php
// Mengatur header untuk CORS agar aplikasi Flutter Web bisa mengakses API
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Content-Type: application/json; charset=UTF-8");

// Koneksi ke Database MySQL
$servername = "localhost"; // Ganti dengan alamat server MySQL kamu
$username = "root";        // Ganti dengan username database
$password = "";            // Ganti dengan password database
$dbname = "tanaman_obat"; // Ganti dengan nama database kamu

// Membuat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Mendapatkan data dari request POST
$data = json_decode(file_get_contents("php://input"));

// Memeriksa apakah data yang dibutuhkan sudah ada
if (isset($data->username) && isset($data->email) && isset($data->password) && isset($data->confirmPassword)) {
    $username = $data->username;
    $email = $data->email;
    $password = $data->password;
    $confirmPassword = $data->confirmPassword;

    // Validasi apakah password dan confirm password sama
    if ($password !== $confirmPassword) {
        echo json_encode([
            'status' => 400,
            'message' => 'Passwords do not match'
        ]);
        exit();
    }

    // Validasi email apakah sudah terdaftar
    $query = "SELECT * FROM users WHERE email = ? OR username = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ss", $email, $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo json_encode([
            'status' => 409,
            'message' => 'Email or Username already exists'
        ]);
        exit();
    }

    // Hash password sebelum disimpan ke database
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Menyimpan data pengguna baru ke database
    $insertQuery = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
    $stmtInsert = $conn->prepare($insertQuery);
    $stmtInsert->bind_param("sss", $username, $email, $hashedPassword);

    if ($stmtInsert->execute()) {
        echo json_encode([
            'status' => 200,
            'message' => 'Registration successful'
        ]);
    } else {
        echo json_encode([
            'status' => 500,
            'message' => 'Error during registration. Please try again.'
        ]);
    }
} else {
    // Jika ada data yang tidak ada
    echo json_encode([
        'status' => 400,
        'message' => 'Please provide username, email, password, and confirm password'
    ]);
}

// Menutup koneksi
$conn->close();
?>
