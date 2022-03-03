import 'package:expenses/components/Chart.dart';
import 'package:expenses/components/TransactionForm.dart';
import 'package:expenses/components/TransactionList.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'theme/Theme.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> transactions = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  void handleAddTransactions() {
    if (titleController.text.isNotEmpty &&
        double.parse(valueController.text.replaceAll(',', '.')) >= 0) {
      setState(() {
        var transaction = Transaction(
            title: titleController.text,
            value: double.tryParse(valueController.text.replaceAll(',', '.')) ??
                0.0,
            date: DateTime.now());
        transactions.add(transaction);
      });
    }
    Navigator.of(context).pop();
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onPress: handleAddTransactions,
            title: titleController,
            value: valueController,
          );
        });
  }

  List<Transaction> get recentTransactions {
    return transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses App"),
        actions: [
          IconButton(
              onPressed: () => openTransactionFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: transactions.isEmpty
            ? Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Nenhuma transação cadastrada",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Chart(
                    transactions: recentTransactions,
                  ),
                  TransactionList(transactions: transactions),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
