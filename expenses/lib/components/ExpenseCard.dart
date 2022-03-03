import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final double value;

  const ExpenseCard(
      {Key? key, required this.title, required this.value, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
          padding: const EdgeInsets.all(10),
          child: Text(
            'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              DateFormat('d MMM y').format(date),
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    ));
  }
}
