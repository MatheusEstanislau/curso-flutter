import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import 'ExpenseCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            final tr = transactions[index];
            return ExpenseCard(title: tr.title, value: tr.value, date: tr.date);
          }),
    );
  }
}
