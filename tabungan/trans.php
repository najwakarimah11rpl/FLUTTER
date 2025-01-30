<?php
// Koneksi ke database
$host = 'localhost';
$username = 'root';
$password = '';
$dbname = 'ecommerce';
$conn = new mysqli($host, $username, $password, $dbname);

// Mengecek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Mulai transaksi
$conn->begin_transaction();

try {
    // Mengurangi stok barang
    $productId = 1;
    $quantityToBuy = 2;
    $sql1 = "UPDATE products SET stock = stock - ? WHERE id = ?";
    $stmt1 = $conn->prepare($sql1);
    $stmt1->bind_param("ii", $quantityToBuy, $productId);
    $stmt1->execute();

    // Memasukkan pembelian ke riwayat
    $userId = 3;
    $sql2 = "INSERT INTO purchase_history (user_id, product_id, quantity) VALUES (?, ?, ?)";
    $stmt2 = $conn->prepare($sql2);
    $stmt2->bind_param("iii", $userId, $productId, $quantityToBuy);
    $stmt2->execute();

    // Mengurangi saldo pelanggan
    $userBalance = 1000; // Misal harga total adalah 1000
    $sql3 = "UPDATE users SET balance = balance - ? WHERE id = ?";
    $stmt3 = $conn->prepare($sql3);
    $stmt3->bind_param("ii", $userBalance, $userId);
    $stmt3->execute();

    // Jika semua langkah sukses, commit transaksi
    $conn->commit();
    echo "Transaksi berhasil!";
} catch (Exception $e) {
    // Jika ada error, rollback transaksi
    $conn->rollback();
    echo "Terjadi kesalahan, transaksi dibatalkan: " . $e->getMessage();
}

// Menutup koneksi
$conn->close();
?>
