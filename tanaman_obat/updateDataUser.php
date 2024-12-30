<?php
include 'koneksi.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
// Ambil data JSON dari body request
$data = json_decode(file_get_contents('php://input'), true);

// Validasi keberadaan data
if (isset($data['id']) && isset($data['username']) && isset($data['email'])) {
    $id = $data['id'];
    $username = $data['username'];
    $email = $data['email'];

    // Query untuk update
    $query = "UPDATE users SET username = '$username', email = '$email' WHERE id = $id";

    if (mysqli_query($koneksi, $query)) {
        // Cek apakah ada baris yang terpengaruh
        if (mysqli_affected_rows($koneksi) > 0) {
            echo json_encode(["status" => 200, "message" => "Data berhasil diupdate"]);
        } else {
            echo json_encode(["status" => 404, "message" => "Data tidak ditemukan atau tidak ada perubahan"]);
        }
    } else {
        echo json_encode(["status" => 500, "message" => "Gagal mengupdate data", "error" => mysqli_error($koneksi)]);
    }
} else {
    // Jika data tidak lengkap
    echo json_encode([
        "status" => 400,
        "result" => ["Data tidak boleh kosong"]
    ]);
}
?>
