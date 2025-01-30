<?php
session_start();

// Cek apakah saldo dan riwayat transaksi sudah ada di session
if (!isset($_SESSION['saldo'])) {
    $_SESSION['saldo'] = 0.0;
}

if (!isset($_SESSION['transaction_history'])) {
    $_SESSION['transaction_history'] = [];
}

// Menangani proses tambah saldo atau tarik saldo
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $amount = isset($_POST['amount']) ? floatval($_POST['amount']) : 0;
    if ($amount > 0) {
        if (isset($_POST['deposit'])) {
            $_SESSION['saldo'] += $amount;
            $_SESSION['transaction_history'][] = "+ Rp " . number_format($amount, 0, ',', '.');
        } elseif (isset($_POST['withdraw']) && $amount <= $_SESSION['saldo']) {
            $_SESSION['saldo'] -= $amount;
            $_SESSION['transaction_history'][] = "- Rp " . number_format($amount, 0, ',', '.');
        } else {
            $error = "Saldo tidak cukup!";
        }
    } else {
        $error = "Masukkan jumlah uang yang valid!";
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #A5D6A7;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
        }
        .header {
            text-align: center;
            color: #388E3C;
        }
        .saldo {
            font-size: 24px;
            font-weight: bold;
            color: #388E3C;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #388E3C;
            border-radius: 4px;
        }
        button {
            width: 48%;
            padding: 10px;
            margin: 10px 1%;
            border: none;
            border-radius: 4px;
            color: white;
            font-weight: bold;
        }
        .deposit {
            background-color: #388E3C;
        }
        .withdraw {
            background-color: #D32F2F;
        }
        .transaction-history {
            margin-top: 30px;
            padding: 10px;
            background-color: #E8F5E9;
            border-radius: 4px;
        }
        .transaction-history ul {
            list-style-type: none;
            padding: 0;
        }
        .transaction-history li {
            margin: 5px 0;
        }
        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="header">Selamat Menabung!!</h1>

    <div class="saldo">
        Saldo Tabungan: Rp <?php echo number_format($_SESSION['saldo'], 0, ',', '.'); ?>
    </div>

    <form method="post">
        <input type="number" name="amount" placeholder="Masukkan jumlah uang" required>
        <div class="error"><?php echo isset($error) ? $error : ''; ?></div>
        <button type="submit" name="deposit" class="deposit">Tambah Saldo</button>
        <button type="submit" name="withdraw" class="withdraw">Tarik Saldo</button>
    </form>

    <div class="transaction-history">
        <h3>Riwayat Transaksi</h3>
        <?php if (empty($_SESSION['transaction_history'])): ?>
            <p>Tidak ada riwayat transaksi.</p>
        <?php else: ?>
            <ul>
                <?php foreach ($_SESSION['transaction_history'] as $transaction): ?>
                    <li><?php echo $transaction; ?></li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>
    </div>
    
    <a href="home.php" class="back-button">Kembali</a>
</div>

</body>
</html>
