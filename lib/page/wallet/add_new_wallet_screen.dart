import 'package:firebase_auth/firebase_auth.dart';
import 'package:kamino_app/page/add_expenses/add_expenses.dart';
import 'package:flutter/material.dart';

class AddNewWalletScreen extends StatefulWidget {
  const AddNewWalletScreen({Key? key}) : super(key: key);

  @override
  State<AddNewWalletScreen> createState() => _AddNewWalletScreenState();
}

class _AddNewWalletScreenState extends State<AddNewWalletScreen> {
  final formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  cardNumberDecoration(String labelText, String hintText) => InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.grey),
      );

  @override
  Widget build(BuildContext context) {
    return AddExpenseScreen(userId: FirebaseAuth.instance.currentUser!.uid);
    // Scaffold(
    //   appBar: AppBar(title: const Text('Add Your Expense')),
    //   resizeToAvoidBottomInset: false,
    //   body: ListView(
    //     children: [
    //       CreditCardWidget(
    //         cardNumber: cardNumber,
    //         expiryDate: expiryDate,
    //         cardHolderName: cardHolderName,
    //         cvvCode: cvvCode,
    //         showBackView: isCvvFocused,
    //         obscureCardNumber: true,
    //         obscureCardCvv: true,
    //         isHolderNameVisible: true,
    //         cardBgColor: deepBlueColor,
    //         isSwipeGestureEnabled: true,
    //         onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    //         customCardTypeIcons: <CustomCardTypeIcon>[
    //           CustomCardTypeIcon(
    //             cardType: CardType.mastercard,
    //             cardImage: Image.asset(
    //               'packages/flutter_credit_card/icons/mastercard.png',
    //               height: 48,
    //               width: 48,
    //             ),
    //           ),
    //           CustomCardTypeIcon(
    //             cardType: CardType.visa,
    //             cardImage: Image.asset(
    //               'packages/flutter_credit_card/icons/visa.png',
    //               height: 48,
    //               width: 48,
    //             ),
    //           ),
    //           CustomCardTypeIcon(
    //             cardType: CardType.americanExpress,
    //             cardImage: Image.asset(
    //               'packages/flutter_credit_card/icons/amex.png',
    //               height: 48,
    //               width: 48,
    //             ),
    //           ),
    //         ],
    //       ),
    //       CreditCardForm(
    //         formKey: formKey,
    //         cardNumber: cardNumber,
    //         expiryDate: expiryDate,
    //         cardHolderName: cardHolderName,
    //         cvvCode: cvvCode,
    //         onCreditCardModelChange: (CreditCardModel data) {
    //           setState(() {
    //             cardNumber = data.cardNumber;
    //             expiryDate = data.expiryDate;
    //             cvvCode = data.cvvCode;
    //             cardHolderName = data.cardHolderName;
    //             isCvvFocused = data.isCvvFocused;
    //           });
    //         },
    //         themeColor: primaryColor,
    //         obscureCvv: true,
    //         obscureNumber: false,
    //         isHolderNameVisible: true,
    //         isCardNumberVisible: true,
    //         isExpiryDateVisible: true,
    //         cardNumberDecoration:
    //             cardNumberDecoration('Number', 'XXXX XXXX XXXX XXXX'),
    //         expiryDateDecoration: cardNumberDecoration('Expired Date', 'XX/XX'),
    //         cvvCodeDecoration: cardNumberDecoration('CVV', 'XXX'),
    //         cardHolderDecoration: cardNumberDecoration('Card Holder', ''),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
    //         child: PrimaryButton(
    //           text: 'Setup - Wallet',
    //           onPressed: () {},
    //         ),
    //       ),
    //       const SizedBox(height: 20)
    //     ],
    //   ),
    // );
  }
}
