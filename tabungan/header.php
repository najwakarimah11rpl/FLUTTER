<?php
// PHP Variables untuk konten halaman
$title = "Tabungan Keren";
$heroHeading = "Selamat Datang di Tabungan Keren!";
$heroSubheading = "Menabung dengan Keamanan dan Kemudahan Terjamin, Hidup Lebih Keren!";
$ctaText = "Mulai Menabung Sekarang!";
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title; ?></title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            color: #333;
        }

        /* Header */
        header {
            background-color: #00796b; /* Warna Hijau Keren */
            color: white;
            padding: 20px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header .logo img {
            width: 50px;
            margin-right: 10px;
        }

        header nav ul {
            list-style-type: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        header nav ul li {
            margin-right: 25px;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: color 0.3s;
        }

        header nav ul li a:hover {
            color: #ff5722; /* Warna Oranye untuk Hover */
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #009688, #4caf50); /* Gradient Warna Hijau dan Teal */
            color: white;
            padding: 120px 20px;
            text-align: center;
            background-size: cover;
            background-position: center;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        .hero h2 {
            font-size: 48px;
            font-weight: bold;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .hero p {
            font-size: 20px;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .cta-btn {
            background-color: #ff5722;
            color: white;
            padding: 15px 30px;
            border-radius: 50px;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s;
        }

        .cta-btn:hover {
            background-color: #e64a19;
            transform: scale(1.05);
        }

        /* Features Section */
        .features {
            padding: 80px 20px;
            background-color: #ffffff;
            text-align: center;
        }

        .features h2 {
            font-size: 36px;
            margin-bottom: 40px;
            color: #00796b;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .feature {
            display: inline-block;
            width: 30%;
            margin: 10px;
            text-align: center;
            padding: 20px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #fafafa;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature img {
            width: 80px;
            margin-bottom: 20px;
        }

        .feature h3 {
            font-size: 22px;
            margin-bottom: 10px;
            color: #00796b;
        }

        .feature p {
            font-size: 16px;
        }

        .feature:hover {
            transform: translateY(-10px);
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Footer */
        footer {
            background-color: #00796b;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        footer ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        footer ul li {
            display: inline;
            margin-right: 15px;
        }

        footer ul li a {
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        footer ul li a:hover {
            text-decoration: underline;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 768px) {
            .features {
                padding: 60px 20px;
            }

            .feature {
                width: 100%;
                margin: 10px 0;
            }

            .hero h2 {
                font-size: 36px;
            }

            .hero p {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <div class="logo">
            <img src="logo.png" alt="Tabungan Keren Logo">
            <h1>Tabungan Keren</h1>
        </div>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Fitur</a></li>
                <li><a href="#">Kontak</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <h2><?php echo $heroHeading; ?></h2>
        <p><?php echo $heroSubheading; ?></p>
        <a href="daftar.php" class="cta-btn"><?php echo $ctaText; ?></a>
    </section>

    <!-- Features Section -->
    <section class="features">
        <h2>Fitur Unggulan Tabungan Keren</h2>
        <div class="feature">
            <img src="secure-icon.png" alt="Keamanan Terjamin">
            <h3>Keamanan Terjamin</h3>
            <p>Tabungan Anda aman dengan teknologi enkripsi tingkat tinggi.</p>
        </div>
        <div class="feature">
            <img src="easy-icon.png" alt="Transaksi Mudah">
            <h3>Transaksi Mudah</h3>
            <p>Akses kapan saja dan dimana saja, cukup lewat aplikasi!</p>
        </div>
        <div class="feature">
            <img src="high-interest-icon.png" alt="Bunga Tinggi">
            <h3>Bunga Tinggi</h3>
            <p>Nikmati bunga yang lebih tinggi dibandingkan tabungan konvensional.</p>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Tabungan Keren. Semua hak cipta dilindungi.</p>
        <ul>
            <li><a href="#">Syarat & Ketentuan</a></li>
            <li><a href="#">Kebijakan Privasi</a></li>
            <li><a href="#">Kontak</a></li>
        </ul>
    </footer>

</body>
</html>
