import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;

  QuoteCard({required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              quote.author,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            TextButton.icon(
              onPressed: () => delete(),
              label: const Text('Delete Quote'),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
