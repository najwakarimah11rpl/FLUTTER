<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selamat Datang di Tabungan</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #00bcd4, #4caf50); /* Gradient background */
            overflow: hidden;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.1);
            padding: 50px 40px;
            max-width: 800px;
            width: 100%;
            animation: fadeIn 1.5s ease-in-out;
        }

        h1 {
            font-size: 42px;
            font-weight: bold;
            color: #4caf50;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        p {
            font-size: 18px;
            color: #333;
            margin-bottom: 40px;
            line-height: 1.6;
        }

        .welcome-btn {
            background-color: #ff5722;
            color: #fff;
            padding: 15px 30px;
            font-size: 20px;
            border: none;
            border-radius: 50px;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .welcome-btn:hover {
            background-color: #e64a19;
            transform: scale(1.05);
        }

        .footer {
            margin-top: 50px;
            color: #795548;
            font-size: 14px;
        }

        .footer a {
            text-decoration: none;
            color: #4caf50;
            font-weight: bold;
        }

        .footer a:hover {
            color: #ff5722;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(30px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Selamat Datang di Tabungan!</h1>
    <p>Selamat datang di platform pengelolaan tabungan kami. Kami menawarkan cara mudah, cepat, dan aman untuk mengatur tabungan Anda. Ayo mulai perjalanan tabungan Anda!</p>
    <a href="saldo.php" class="welcome-btn">Mulai Tabungan</a>
    <div class="footer">
        <p>© 2025 Tabungan - Semua Hak Dilindungi | <a href="header.php">Logout</a></p>
    </div>
</div>

</body>
</html>
