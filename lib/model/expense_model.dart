import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  final String category;
  final double amount;
  final Timestamp timestamp;

  Expense({
    required this.category,
    required this.amount,
    required this.timestamp,
  });

  factory Expense.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Expense(
      category: data['category'] ?? '',
      amount: data['amount']?.toDouble() ?? 0.0,
      timestamp: data['timestamp'],
    );
  }
}
