import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabungan Ijo',
      theme: ThemeData(
        primarySwatch: Colors.green, // Menggunakan warna hijau sebagai tema utama
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double _saldo = 0.0; // Saldo tabungan
  List<String> _transactionHistory = []; // Riwayat transaksi
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Ada 2 tab: Tabungan dan History
      child: Scaffold(
        backgroundColor: Colors.green.shade200, // Mengubah warna latar belakang menjadi hijau muda
        appBar: AppBar(
          title: Text('Tabungan Ijo'),
          backgroundColor: Colors.green, // Menggunakan warna hijau untuk app bar
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tabungan'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tabungan Tab
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Saldo Tabungan: Rp ${_saldo.toStringAsFixed(0)}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green.shade800), // Text warna hijau gelap
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jumlah Uang',
                      hintText: 'Masukkan jumlah uang',
                      labelStyle: TextStyle(color: Colors.green.shade700), // Label berwarna hijau
                      hintStyle: TextStyle(color: Colors.green.shade400), // Hint berwarna hijau muda
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade500), // Border hijau
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          double? amount = double.tryParse(_amountController.text);
                          if (amount != null && amount > 0) {
                            setState(() {
                              _saldo += amount; // Menambahkan saldo
                              _transactionHistory.add('+ Rp ${amount.toStringAsFixed(0)}');
                            });
                            _amountController.clear();
                          } else {
                            // Menampilkan pesan error jika input tidak valid
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Masukkan jumlah uang yang valid')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700), // Tombol hijau tua
                        child: Text('Tambah'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          double? amount = double.tryParse(_amountController.text);
                          if (amount != null && amount > 0 && amount <= _saldo) {
                            setState(() {
                              _saldo -= amount; // Mengurangi saldo
                              _transactionHistory.add('- Rp ${amount.toStringAsFixed(0)}');
                            });
                            _amountController.clear();
                          } else {
                            // Menampilkan pesan error jika input tidak valid atau saldo tidak cukup
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Masukkan jumlah yang valid atau saldo tidak cukup')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700), // Tombol merah
                        child: Text('Tarik'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // History Tab
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _transactionHistory.isEmpty
                  ? Center(child: Text('Tidak ada riwayat transaksi', style: TextStyle(color: Colors.green.shade700)))
                  : ListView.builder(
                      itemCount: _transactionHistory.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_transactionHistory[index], style: TextStyle(color: Colors.green.shade700)), // History text hijau
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
