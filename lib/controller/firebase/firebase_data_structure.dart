import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String uid;

  DatabaseService({required this.uid});

  // Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserBalance(double balance) async {
    return await userCollection.doc(uid).set({
      'balance': balance,
    }, SetOptions(merge: true));
  }

  Future<void> addExpense(double amount, String description) async {
    await userCollection.doc(uid).collection('expenses').add({
      'amount': amount,
      'description': description,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<DocumentSnapshot> get userData {
    return userCollection.doc(uid).snapshots();
  }

  Stream<QuerySnapshot> get userExpenses {
    return userCollection
        .doc(uid)
        .collection('expenses')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
