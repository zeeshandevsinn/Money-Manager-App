// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:kamino_app/controller/services/expense_services.dart';
// import 'package:kamino_app/model/expense_model.dart';
// import 'package:kamino_app/utils/constants.dart';
// import 'package:kamino_app/utils/k_images.dart';
// import 'package:kamino_app/widgets/custom_manage_appbar.dart';
// import 'package:kamino_app/widgets/transaction_card_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class TransactionPage extends StatefulWidget {
//   const TransactionPage({Key? key}) : super(key: key);

//   @override
//   State<TransactionPage> createState() => _TransactionPageState();
// }

// class _TransactionPageState extends State<TransactionPage> {
//   // final ExpenseService _expenseService = ExpenseService();
//   late Future<List<Map<String, dynamic>>> _expensesFuture;

//   @override
//   void initState() {
//     super.initState();
//     // _expensesFuture = fetchUserExpenses(FirebaseAuth.instance.currentUser.uid);
//   }

//   FetchData() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: CustomScrollView(slivers: [
//         _buildHeader(),
//         const SliverToBoxAdapter(child: SizedBox(height: 32)),
//         _buildTransaction(),
//         const SliverToBoxAdapter(child: SizedBox(height: 20)),
//         _buildIncomeExpense(),
//         const SliverToBoxAdapter(child: SizedBox(height: 32)),
//         const SliverToBoxAdapter(child: SizedBox(height: 32)),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(8, 0, 8, 14),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Friday",
//                           style: TextStyle(
//                               color: blackColor.withOpacity(0.7),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "19-06-2021",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w700),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       "View all",
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: blackColor.withOpacity(.7),
//                           fontWeight: FontWeight.w500),
//                     )
//                   ],
//                 ),
//                 ListView.builder(
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       return _transactionCard(Kimages.trendingDown,
//                           "Food & Drink", "02.00 pm, 19 Jun 2021", "-\$23");
//                     }),
//                 // _transactionCard(Kimages.trendingDown, "Food & Drink",
//                 //     "02.00 pm, 19 Jun 2021", "-\$23"),
//                 // _transactionCard(Kimages.trendingDown, "Food & Drink",
//                 //     "02.00 pm, 19 Jun 2021", "-\$23"),
//                 // _transactionCard(Kimages.trendingDown, "Food & Drink",
//                 //     "02.00 pm, 19 Jun 2021", "-\$23"),
//               ],
//             ),
//           ),
//         ),
//         const SliverToBoxAdapter(child: SizedBox(height: 32)),
//       ])),
//       // StreamBuilder(
//       //   stream: FirebaseFirestore.instance
//       //       .collection('expenses')
//       //       .doc(FirebaseAuth.instance.currentUser?.uid)
//       //       .collection('user_expenses')
//       //       .snapshots(),
//       //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       //     if (!snapshot.hasData) {
//       //       return Center(child: CircularProgressIndicator());
//       //     }
//       //     var dateDocs = snapshot.data!.docs;
//       //     return ListView.builder(
//       //       itemCount: dateDocs.length,
//       //       itemBuilder: (context, index) {
//       //         var dateDoc = dateDocs[index];
//       //         return StreamBuilder(
//       //           stream: FirebaseFirestore.instance
//       //               .collection('expenses')
//       //               .doc(FirebaseAuth.instance.currentUser?.uid)
//       //               .collection('user_expenses')
//       //               .doc(dateDoc.id)
//       //               .collection('expenses')
//       //               .snapshots(),
//       //           builder: (context,
//       //               AsyncSnapshot<QuerySnapshot> expenseSnapshot) {
//       //             if (!expenseSnapshot.hasData) {
//       //               return Center(child: CircularProgressIndicator());
//       //             }
//       //             var expenses = expenseSnapshot.data!.docs;
//       //             return ExpansionTile(
//       //               title: Text(dateDoc.id),
//       //               children: expenses.map((expense) {
//       //                 return ListTile(
//       //                   title: Text(expense['category']),
//       //                   subtitle: Text('Balance: ${expense['balance']}'),
//       //                   trailing:
//       //                       Text(expense['date'].toDate().toString()),
//       //                 );
//       //               }).toList(),
//       //             );
//       //           },
//       //         );
//       //       },
//       //     );
//       //   },
//       // ),

//       //       // SliverToBoxAdapter(
//       //       //   child: Padding(
//       //       //     padding: const EdgeInsets.fromLTRB(8, 0, 8, 14),
//       //       //     child: Column(
//       //       //       children: [
//       //       //         Row(
//       //       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //       //           crossAxisAlignment: CrossAxisAlignment.end,
//       //       //           children: [
//       //       //             Column(
//       //       //               crossAxisAlignment: CrossAxisAlignment.start,
//       //       //               children: [
//       //       //                 Text(
//       //       //                   "Friday",
//       //       //                   style: TextStyle(
//       //       //                       color: blackColor.withOpacity(0.7),
//       //       //                       fontSize: 12,
//       //       //                       fontWeight: FontWeight.w500),
//       //       //                 ),
//       //       //                 const SizedBox(height: 4),
//       //       //                 const Text(
//       //       //                   "19-06-2021",
//       //       //                   style: TextStyle(
//       //       //                       fontSize: 18, fontWeight: FontWeight.w700),
//       //       //                 ),
//       //       //               ],
//       //       //             ),
//       //       //             Text(
//       //       //               "View all",
//       //       //               style: TextStyle(
//       //       //                   fontSize: 12,
//       //       //                   color: blackColor.withOpacity(.7),
//       //       //                   fontWeight: FontWeight.w500),
//       //       //             )
//       //       //           ],
//       //       //         ),
//       //       //         _transactionCard(Kimages.trendingDown, "Food & Drink",
//       //       //             "02.00 pm, 19 Jun 2021", "-\$23"),
//       //       //         _transactionCard(Kimages.trendingDown, "Food & Drink",
//       //       //             "02.00 pm, 19 Jun 2021", "-\$23"),
//       //       //         _transactionCard(Kimages.trendingDown, "Food & Drink",
//       //       //             "02.00 pm, 19 Jun 2021", "-\$23"),
//       //       //         _transactionCard(Kimages.trendingDown, "Food & Drink",
//       //       //             "02.00 pm, 19 Jun 2021", "-\$23"),
//       //       //       ],
//       //       //     ),
//       //       //   ),
//       //       // ),

//       // ],
//       //   ),
//       // ),
//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:kamino_app/widgets/custom_manage_appbar.dart';
import 'package:kamino_app/widgets/transaction_card_item.dart';

class TransactionPage extends StatefulWidget {
  final String userUid;

  TransactionPage({Key? key, required this.userUid}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late Stream<QuerySnapshot> datesStream;

  @override
  void initState() {
    super.initState();
    datesStream = FirebaseFirestore.instance
        .collection('expense')
        .doc(widget.userUid)
        .collection('dates')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Expense Details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: datesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No expenses found.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var dateDoc = snapshot.data!.docs[index];
              var date =
                  dateDoc.get('date'); // assuming date is the document ID
              var expensesMap = dateDoc.get('expenses');

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Date: $date',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: expensesMap.length,
                      itemBuilder: (context, expenseIndex) {
                        var expense = expensesMap[expenseIndex];
                        return _transactionCard(
                            Kimages.trendingDown,
                            expense['category'],
                            "$date",
                            "-\$ ${expense['amount']}");
                        // ListTile(
                        //   title: Text(expense['description']),
                        //   subtitle: Text('Amount: ${expense['amount']}'),
                        // );
                      },
                    ),
                    Divider(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _buildIncomeExpense() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: _costCard(Kimages.trendingUp, "Income", "+ \$300")),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: _costCard(Kimages.trendingDown, "Expense", "- \$200")),
        ],
      ),
    );
  }

  Widget _costCard(String icon, String title, String price) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(36)),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                  colors: blueGrediantColor,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            ),
            child: Center(child: SvgPicture.asset(icon)),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Text(title, style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 2),
              Text(price,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  _transactionCard(String image, String title, String subTitle, String price) {
    return TransactionCardItem(
      subTitle: subTitle,
      price: price,
      image: image,
      title: title,
    );
  }

  SliverToBoxAdapter _buildTransaction() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Text(
              "All Expenses",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),

            const Spacer(),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                    colors: blueGrediantColor,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
              ),
              child: Center(child: SvgPicture.asset(Kimages.trendingDown)),
            ),

            const Spacer(),
            // Container(
            //   height: 48,
            //   width: 48,
            //   decoration: BoxDecoration(
            //       color: greyColor, borderRadius: BorderRadius.circular(24)),
            //   child: const Icon(Icons.search),
            // ),
            // const SizedBox(width: 10),
            // Container(
            //   height: 48,
            //   width: 48,
            //   decoration: BoxDecoration(
            //       color: greyColor, borderRadius: BorderRadius.circular(24)),
            //   child: const Icon(Icons.calendar_today),
            // ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHeader() {
    return const SliverToBoxAdapter(child: CustomManageAppBar());
  }
}
