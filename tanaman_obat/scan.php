<?php
include('koneksi.php'); // Koneksi ke database

// Add these headers at the top of your PHP script
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil gambar dari request body
    $imageData = file_get_contents('php://input');
    
    // Simulasikan deteksi tanaman dengan mencocokkan gambar (di dunia nyata bisa menggunakan ML)
    // Untuk demo, kita akan mencocokkan tanaman berdasarkan ID dan bukan gambar
    $plants = [
        [
            "jenis" => "Kunyit",
            "namaLatin" => "Curcuma longa",
            "manfaat" => "Meningkatkan daya tahan tubuh, mengatasi peradangan.",
            "efekSamping" => "Dapat menyebabkan gangguan pencernaan bila dikonsumsi berlebihan.",
            "kelebihan" => "Mengandung antioksidan tinggi, mudah ditemukan.",
            "kekurangan" => "Efek penyembuhan memerlukan konsumsi jangka panjang.",
        ],
        [
            "jenis" => "Jahe",
            "namaLatin" => "Zingiber officinale",
            "manfaat" => "Mengatasi mual, meredakan flu dan batuk.",
            "efekSamping" => "Dapat menyebabkan iritasi lambung jika dikonsumsi berlebihan.",
            "kelebihan" => "Mudah digunakan dalam banyak bentuk (segar, bubuk, dll).",
            "kekurangan" => "Tidak cocok untuk penderita alergi tertentu.",
        ],
        [
            "jenis" => "Lidah Buaya",
            "namaLatin" => "Aloe vera",
            "manfaat" => "Menyembuhkan luka, melembapkan kulit.",
            "efekSamping" => "Dapat menyebabkan reaksi alergi pada beberapa orang.",
            "kelebihan" => "Mudah tumbuh, banyak manfaat untuk kulit.",
            "kekurangan" => "Harus digunakan dengan hati-hati jika memiliki kulit sensitif.",
        ]
    ];

    // Simulasi pengambilan tanaman secara acak (misalnya berdasarkan ID atau nama tanaman)
    $randomPlant = $plants[array_rand($plants)];

    // Mengirimkan hasil deteksi tanaman ke aplikasi Flutter
    echo json_encode([
        'status' => 200,
        'plant' => $randomPlant
    ]);
}
?>
