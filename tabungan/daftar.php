<?php
// Cek apakah pengguna sudah login sebelumnya, jika iya, arahkan ke halaman utama atau dashboard
session_start();
if (isset($_SESSION['user_id'])) {
    header("Location: login.php");  // Ganti dengan halaman yang sesuai
    exit;
}

// Cek apakah form pendaftaran sudah disubmit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Mengambil data dari form
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Melakukan validasi data
    if (empty($name) || empty($email) || empty($password)) {
        $error_message = "Semua kolom harus diisi!";
    } else {
        // Hash password sebelum disimpan
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Koneksi ke database (ganti dengan data koneksi yang sesuai)
        $db_host = 'localhost';
        $db_user = 'root';
        $db_pass = '';
        $db_name = 'database_nama';  // Ganti dengan nama database Anda

        $conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

        if ($conn->connect_error) {
            die("Koneksi gagal: " . $conn->connect_error);
        }

        // Menyimpan data pendaftaran ke database
        $sql = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$hashed_password')";

        if ($conn->query($sql) === TRUE) {
            $success_message = "Pendaftaran berhasil! Silakan <a href='login.php'>login</a>.";
        } else {
            $error_message = "Terjadi kesalahan: " . $conn->error;
        }

        // Menutup koneksi
        $conn->close();
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar</title>
    <style>
        /* Style yang sama dengan login.php */
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7e0; /* Warna latar belakang hijau muda */
            color: #2c6e2f; /* Warna teks hijau gelap */
            margin: 0;
            padding: 0;
        }

        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c6e2f; /* Warna hijau gelap untuk judul */
        }

        .input-field {
            margin-bottom: 15px;
        }

        .input-field label {
            display: block;
            margin-bottom: 5px;
            color: #2c6e2f;
        }

        .input-field input {
            width: 100%;
            padding: 10px;
            border: 1px solid #2c6e2f;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .input-field input[type="submit"] {
            background-color: #2c6e2f;
            color: white;
            cursor: pointer;
        }

        .input-field input[type="submit"]:hover {
            background-color: #236c2f;
        }

        .message {
            text-align: center;
            margin-top: 15px;
        }

        .message a {
            color: #2c6e2f;
            text-decoration: none;
        }

        .message a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Daftar</h2>

    <?php
    // Menampilkan pesan error atau sukses
    if (isset($error_message)) {
        echo "<p class='error'>$error_message</p>";
    }
    if (isset($success_message)) {
        echo "<p class='success'>$success_message</p>";
    }
    ?>

    <form action="home.php" method="POST">
        <div class="input-field">
            <label for="name">Nama:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="input-field">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="input-field">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="input-field">
            <input type="submit" value="Daftar">
        </div>
    </form>

    <div class="message">
        <p>Sudah punya akun? <a href="login.php">Login di sini</a></p>
    </div>
</div>

</body>
</html>
