<?php

include 'koneksi.php';  // Memastikan koneksi ke database sudah benar

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

// Pastikan variabel $conn tersedia dan tidak null
if (!$conn) {
    echo json_encode([
        "status" => 500,
        "result" => "Koneksi ke database gagal"
    ]);
    exit();
}

try {
    // Query untuk mengambil data user dari database
    $query = 'SELECT * FROM users';  // Sesuaikan dengan tabel yang ada di database Anda

    // Menjalankan query
    $result = $conn->query($query);

    // Mengecek apakah ada data yang ditemukan
    if ($result && $result->num_rows > 0) {
        $data['status'] = 200;
        $data['result'] = [];

        // Menyusun data hasil query
        while ($row = $result->fetch_assoc()) {
            $data['result'][] = $row;
        }
    } else {
        // Jika tidak ada data ditemukan
        $data['status'] = 404;
        $data['result'] = 'Data tidak ada';
    }
} catch (Exception $e) {
    $data['status'] = 500;
    $data['result'] = "Terjadi kesalahan server: " . $e->getMessage();
}

// Menutup koneksi database
$conn->close();

// Mengirimkan hasil dalam format JSON
echo json_encode($data);

?>
