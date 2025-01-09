import 'dart:math';
import 'package:flutter/material.dart';

class Produk {
  final String imag;
  final String judul;
  final int harga;
  final String desk;

  Produk(this.imag, this.judul, this.harga, this.desk);
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Produk> data = List.generate(100, (index) {
      return Produk(
        "https://picsum.photos/id/$index/200", 
        "Produk ${index + 1}", 
        10000 + Random().nextInt(10000),  
        "This is a description for product ${index + 1}.",  
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Marketplace"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(data[index].imag),
            footer: Container(
              height: 80,
              color: Colors.green,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data[index].judul,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rp ${data[index].harga}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    data[index].desk,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}
