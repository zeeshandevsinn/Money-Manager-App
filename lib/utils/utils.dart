import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kamino_app/page/routes.dart';

class Utils {
  static Future showCongratsAlertDialog(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check,
                      color: Theme.of(context).colorScheme.secondary),
                  Text('Congrats', style: textTheme.headline2),
                  const SizedBox(height: 8),
                  const Text('You did succsessfully transfer \$85.00 Amount',
                      textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        });
  }

  static showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Log out?"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            CupertinoDialogAction(
                isDefaultAction: false,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            CupertinoDialogAction(
                textStyle: const TextStyle(color: Colors.red),
                isDefaultAction: true,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.login, (route) => false);
                },
                child: const Text("Log out")),
          ],
        );
      },
    );
  }
}
