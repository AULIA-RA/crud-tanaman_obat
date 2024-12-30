<?php
include('koneksi.php');

header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');

$sql = "SELECT `name`, `latin_name`, `description`, `usage`, `image_url`, `benefits`, `category` FROM plants";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $plants = [];
    while ($row = $result->fetch_assoc()) {
        $plants[] = $row;
    }
    echo json_encode(['status' => 200, 'message' => 'Success', 'result' => $plants], JSON_UNESCAPED_UNICODE);
} else {
    echo json_encode(['status' => 404, 'message' => 'No data found'], JSON_UNESCAPED_UNICODE);
}

$conn->close();
?>
