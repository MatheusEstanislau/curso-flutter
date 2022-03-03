import 'package:expenses/components/ChartBar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart({required this.transactions});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < transactions.length; i++) {
        bool sameDay = transactions[i].date.day == weekDay.day;
        bool sameMonth = transactions[i].date.month == weekDay.month;
        bool sameYear = transactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += transactions[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);

    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: (tr['day'] as String),
                  value: (tr['value'] as double),
                  percentage: (tr['value'] as double) / weekTotalValue),
            );
          }).toList(),
        ),
      ),
    );
  }
}
