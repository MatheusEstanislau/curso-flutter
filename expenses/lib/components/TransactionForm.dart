import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final void Function() onPress;
  final TextEditingController title;
  final TextEditingController value;

  const TransactionForm(
      {required this.onPress, required this.title, required this.value});

  handleSubmit() {
    if (title.text.isEmpty || double.parse(value.text.replaceAll(',', '.')) <= 0){
      return;
    }

    onPress();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Título"),
              controller: title,
              onSubmitted: (_) => handleSubmit(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Valor (R\$)"),
              controller: value,
              onSubmitted: (_) => handleSubmit(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () => handleSubmit(),
                child: const Text("Nova Transação"),
                style: TextButton.styleFrom(primary: Colors.purple),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
