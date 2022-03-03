import 'package:uuid/uuid.dart';

class Transaction {
  final String id = const Uuid().v4();
  final String title;
  final double value;
  final DateTime date;

  Transaction({required this.title, required this.value, required this.date});
}
