<?php
include('koneksi.php');

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

$data = json_decode(file_get_contents("php://input"), true);

if ($data === null) {
    echo json_encode(["status" => 400, "message" => "Invalid JSON format"]);
    exit();
}

if (!isset($data['name'], $data['latin_name'], $data['description'], $data['usage'], $data['image_url'], $data['benefits'], $data['category'])) {
    echo json_encode(["status" => 400, "message" => "Missing required fields"]);
    exit();
}

$name = $data['name'];
$latin_name = $data['latin_name'];
$description = $data['description'];
$usage = $data['usage'];
$image_url = $data['image_url'];
$benefits = $data['benefits'];
$category = $data['category'];

$sql = "UPDATE plants SET `latin_name` = ?, `description` = ?, `usage` = ?, `image_url` = ?, `benefits` = ?, `category` = ? 
        WHERE `name` = ?";
$stmt = $conn->prepare($sql);

if ($stmt) {
    $stmt->bind_param("sssssss", $latin_name, $description, $usage, $image_url, $benefits, $category, $name);
    if ($stmt->execute()) {
        if ($stmt->affected_rows > 0) {
            echo json_encode(["status" => 200, "message" => "Plant updated successfully"]);
        } else {
            echo json_encode(["status" => 404, "message" => "No matching plant found"]);
        }
    } else {
        echo json_encode(["status" => 500, "message" => "Error updating plant: " . $stmt->error]);
    }
    $stmt->close();
} else {
    echo json_encode(["status" => 500, "message" => "Failed to prepare the query: " . $conn->error]);
}

$conn->close();
?>
