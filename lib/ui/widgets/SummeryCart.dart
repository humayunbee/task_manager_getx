import 'package:flutter/material.dart';

class SummeryCart extends StatelessWidget {
  const SummeryCart({
    super.key,
    required this.count,
    required this.title,
  });

  final String count, title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        child: Column(
          children: [
            Text(
              count,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
