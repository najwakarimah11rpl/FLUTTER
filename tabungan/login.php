<?php
// Cek apakah pengguna sudah login sebelumnya
session_start();
if (isset($_SESSION['user_id'])) {
    header("Location: dashboard.php");  // Ganti dengan halaman dashboard atau halaman utama Anda
    exit;
}

// Cek apakah form login sudah disubmit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Mengambil data dari form
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Koneksi ke database (ganti dengan data koneksi yang sesuai)
    $db_host = 'localhost';
    $db_user = 'root';
    $db_pass = '';
    $db_name = 'database_nama';  // Ganti dengan nama database Anda

    $conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

    if ($conn->connect_error) {
        die("Koneksi gagal: " . $conn->connect_error);
    }

    // Mengecek apakah email terdaftar di database
    $sql = "SELECT id, name, email, password FROM users WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        // Verifikasi password
        if (password_verify($password, $row['password'])) {
            // Set session
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['user_name'] = $row['name']; // Menyimpan nama pengguna di session
            header("Location: dashboard.php");  // Arahkan ke halaman dashboard setelah login berhasil
            exit;
        } else {
            $error_message = "Password salah!";
        }
    } else {
        $error_message = "Email tidak ditemukan!";
    }

    // Menutup koneksi
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        /* Style yang sama dengan daftar.php */
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
    <h2>Login</h2>

    <?php
    // Menampilkan pesan error atau sukses
    if (isset($error_message)) {
        echo "<p class='error'>$error_message</p>";
    }
    ?>

    <form action="home.php" method="POST">
        <div class="input-field">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="input-field">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="input-field">
            <input type="submit" value="Login">
        </div>
    </form>

    <div class="message">
        <p>Belum punya akun? <a href="daftar.php">Daftar di sini</a></p>
    </div>
</div>

</body>
</html>
