import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,  // Ubah warna utama menjadi merah
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DaftarDiriPage(),
    );
  }
}

class DaftarDiriPage extends StatefulWidget {
  @override
  _DaftarDiriPageState createState() => _DaftarDiriPageState();
}

class _DaftarDiriPageState extends State<DaftarDiriPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _usiaController = TextEditingController();

  String _nama = '';
  String _email = '';
  String _usia = '';

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _nama = _namaController.text;
        _email = _emailController.text;
        _usia = _usiaController.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disubmit')),
      );

      _namaController.clear();
      _emailController.clear();
      _usiaController.clear();
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _usiaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Diri"),
        backgroundColor: Colors.red,  // Ubah warna AppBar menjadi merah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  hintText: 'Masukkan nama Anda',
                  labelStyle: TextStyle(color: Colors.red),  // Ubah warna label menjadi merah
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),  // Ubah border saat fokus menjadi merah
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan email Anda',
                  labelStyle: TextStyle(color: Colors.red),  // Ubah warna label menjadi merah
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),  // Ubah border saat fokus menjadi merah
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _usiaController,
                decoration: InputDecoration(
                  labelText: 'Usia',
                  hintText: 'Masukkan usia Anda',
                  labelStyle: TextStyle(color: Colors.red),  // Ubah warna label menjadi merah
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),  // Ubah border saat fokus menjadi merah
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Usia tidak boleh kosong';
                  } else if (int.tryParse(value) == null) {
                    return 'Usia harus berupa angka';
                  } else if (int.parse(value) <= 0) {
                    return 'Usia harus lebih dari 0';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Daftar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,  // Ubah warna tombol menjadi merah
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              if (_nama.isNotEmpty && _email.isNotEmpty && _usia.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama: $_nama'),
                      Text('Email: $_email'),
                      Text('Usia: $_usia'),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
