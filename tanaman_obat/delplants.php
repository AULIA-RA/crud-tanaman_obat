<?php
include('koneksi.php');

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['name']) || empty(trim($data['name']))) {
    echo json_encode(['status' => 400, 'message' => 'Missing or empty field: name']);
    exit();
}

$name = trim($data['name']);
$sql = "DELETE FROM plants WHERE `name` = ?";
$stmt = $conn->prepare($sql);

if ($stmt) {
    $stmt->bind_param("s", $name);
    if ($stmt->execute()) {
        if ($stmt->affected_rows > 0) {
            echo json_encode(['status' => 200, 'message' => 'Plant deleted successfully']);
        } else {
            echo json_encode(['status' => 404, 'message' => 'No plant found with the specified name']);
        }
    } else {
        echo json_encode(['status' => 500, 'message' => 'Failed to execute query: ' . $stmt->error]);
    }
    $stmt->close();
} else {
    echo json_encode(['status' => 500, 'message' => 'Failed to prepare query: ' . $conn->error]);
}

$conn->close();
?>
