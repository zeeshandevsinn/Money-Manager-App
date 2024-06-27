import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kamino_app/utils/toast/flutter_toast.dart';

void addExpense(
    String userId, String date, String category, double amount) async {
  try {
    // Reference to the user's date collection
    CollectionReference dateCollectionRef = FirebaseFirestore.instance
        .collection('expense')
        .doc(userId)
        .collection('dates');

    // ignore: unused_local_variable

    // Query to find if the date document already exists
    QuerySnapshot querySnapshot =
        await dateCollectionRef.where('date', isEqualTo: date).get();

    if (querySnapshot.docs.isEmpty) {
      // If the date document does not exist, create a new document with the expense
      await dateCollectionRef.add({
        'date': date,
        'expenses': [
          {'category': category, 'amount': amount}
        ],
      });
      ToastUtil.showSuccessToast("Successfully Expense Added");
    } else {
      // If the date document exists, update the existing document
      DocumentSnapshot dateDoc = querySnapshot.docs.first;
      List<dynamic> existingExpenses = dateDoc['expenses'];

      existingExpenses.add({'category': category, 'amount': amount});

      await dateDoc.reference.update({
        'expenses': existingExpenses,
      });
    }

    print("Expense added successfully!");
  } catch (e) {
    print("Error adding expense: $e");
  }
}

UpdateExpense(amount, userId) async {
  DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

  // Check if the document exists and contains the 'Expense' field

  // Access the 'Expense' field value
  var expense = documentSnapshot.get('Expense');
  // ignore: unused_local_variable
  var doc = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .update({"Expense": expense + amount});
}

Future<List<Map<String, dynamic>>> fetchUserExpenses(String userId) async {
  List<Map<String, dynamic>> expensesByDate = [];

  try {
    QuerySnapshot dateSnapshots = await FirebaseFirestore.instance
        .collection('expense')
        .doc(userId)
        .collection('dates')
        .get();

    for (DocumentSnapshot dateDoc in dateSnapshots.docs) {
      String date = dateDoc['date'];
      List<dynamic> expenses = dateDoc['expenses'];

      expensesByDate.add({'date': date, 'expenses': expenses});
    }

    print('Fetched expenses: $expensesByDate');
    return expensesByDate;
  } catch (e) {
    print('Error fetching expenses: $e');
    return [];
  }
}

Future<void> fetchProfileData() async {
  try {
    // ignore: unused_local_variable
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    // setState(() {
    //   profileData = doc.data() as Map<String, dynamic>;
    //   isLoading = false;
    // });
  } catch (e) {
    print("Error fetching profile data: $e");
    // setState(() {
    //   isLoading = false;
    // });
  }
}
