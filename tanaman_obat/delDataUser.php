<?php
include 'koneksi.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');


// Periksa apakah parameter 'id' tersedia
if (!isset($_GET['id']) || empty($_GET['id'])) {
    die("Parameter 'id' tidak ditemukan atau kosong.");
}

// Ambil nilai 'id' dari parameter GET
$id = intval($_GET['id']); // Pastikan nilai id berupa integer

// Periksa koneksi database
if (!isset($conn)) {
    die("Koneksi database tidak tersedia.");
}

try {
    // Gunakan prepared statement untuk menghindari SQL Injection
    $stmt = $conn->prepare("DELETE FROM Category WHERE id = ?");
    if ($stmt) {
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            echo "Data berhasil dihapus.";
        } else {
            echo "Gagal menghapus data: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "Gagal mempersiapkan query.";
    }
} catch (mysqli_sql_exception $e) {
    echo "Kesalahan SQL: " . $e->getMessage();
}

// Tutup koneksi database
$conn->close();
?>
