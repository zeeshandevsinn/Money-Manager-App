import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:kamino_app/controller/services/expense_services.dart';
import 'package:kamino_app/utils/input_format/dollar_input.dart';
import 'package:kamino_app/utils/toast/flutter_toast.dart';
import 'package:kamino_app/widgets/primary_button.dart';

class AddExpenseScreen extends StatefulWidget {
  final String userId;

  AddExpenseScreen({required this.userId});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _expenseController = TextEditingController();

  Map<String, dynamic>? profileData;
  bool isLoading1 = true;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  fetchProfileData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      setState(() {
        profileData = doc.data() as Map<String, dynamic>;
        isLoading1 = false;
      });
    } catch (e) {
      print("Error fetching profile data: $e");
      setState(() {
        isLoading1 = false;
      });
    }
  }

  void _addExpense(uid, _category, _amount) async {
    final DateTime now = DateTime.now();
    final String dateStr = "${now.year}-${now.month}-${now.day}";

    final DocumentReference userRef =
        FirebaseFirestore.instance.collection('expenses').doc(widget.userId);
    final CollectionReference dateCollectionRef = userRef.collection(dateStr);
    final DocumentReference expenseRef = dateCollectionRef.doc();

    final Map<String, dynamic> expenseData = {
      'category': _category,
      'amount': _amount,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      await expenseRef.set(expenseData);
      ToastUtil.showSuccessToast("Expense added successfully!");
      _categoryController.clear();
      _expenseController.clear();
      print("Success");
      // Navigator.of(context).pop();
    } catch (error) {
      ToastUtil.showErrorToast("Expense Error $error!");
      print("Error adding expense: $error");
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: isLoading1
            ? Center(child: CircularProgressIndicator.adaptive())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          profileData?['Name'] ?? "Janathon",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    CircleAvatarWithNetworkImage(
                        imageUrl: profileData?['ProfileImg'], radius: 30)
                  ],
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofillHints: const [AutofillHints.name],
                controller: _categoryController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  hintText: 'CategoryTitle',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _expenseController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DollarInputFormatter(),
                ],
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  labelText: 'Current Balance',
                ),
              ),
              SizedBox(height: 20),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : PrimaryButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final balance = _expenseController.text
                              .replaceAll(RegExp(r'[^\d]'), '');
                          final balance_value = double.tryParse(balance) ?? 0;
                          final DateTime now = DateTime.now();
                          final String dateStr =
                              "${now.year}-${now.month}-${now.day}";
                          var uid = FirebaseAuth.instance.currentUser!.uid;
                          setState(() {
                            isLoading = true;
                          });
                          var userId = FirebaseAuth.instance.currentUser?.uid;
                          await UpdateExpense(balance_value, userId);
                          addExpense(uid, dateStr,
                              _categoryController.text.trim(), balance_value);
                          setState(() {
                            isLoading = false;
                          });

                          _categoryController.clear();
                          _expenseController.clear();
                        } else {
                          ToastUtil.showErrorToast("Error Expense not Added");
                        }
                      },
                      text: "Add Expense",
                    ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildProfileView() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  profileData?['Name'] ?? "Janathon",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            CircleAvatarWithNetworkImage(
                imageUrl: profileData?['ProfileImg'], radius: 30)
          ],
        ),
      ),
    );
  }
}

class CircleAvatarWithNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  CircleAvatarWithNetworkImage({
    required this.imageUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[200], // Placeholder background color
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Icon(
              Icons.account_circle,
              size: radius * 2,
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
