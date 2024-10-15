import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(const MyApp(home: QuoteList()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.home});
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home,
    );
  }
}

class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  final List<Quote> quotes = [
    Quote(author: 'Kalimat sigma', text: 'aku? berlutut? tch tidak akan!'),
    Quote(author: 'Kalimat sigma', text: 'dingin tetapi tidak kejam'),
    Quote(author: 'Kalimat sigma', text: 'akulah satria hitam kegelapan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('KATA-KATA SIGMA HARI INI'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: quotes.map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                },
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
