import 'package:firebase_core/firebase_core.dart';
// import 'package:kamino_app/controller/firebase_signup.dart';
import 'package:kamino_app/firebase_options.dart';
import 'package:kamino_app/page/auth/verify_otp_screen.dart';
import 'package:kamino_app/utils/k_strings.dart';
import 'package:kamino_app/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/services.dart';
import 'page/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Kstrings.appName,
        theme: MyTheme.theme,
        // ignore: body_might_complete_normally_nullable
        onGenerateRoute: (settings) {
          if (settings.name == '/verify-otp') {
            final args = settings.arguments as Map<String, String>;
            print(args);
            return MaterialPageRoute(
              builder: (context) {
                return VerifyOTPScreen(
                  VerificationID: args['verificationID']!,
                  resendToken: args['resendToken'],
                  password: args['password'],
                  phone_number: args['number'],
                );
              },
            );
          }
          // If no matching route is found, return null
        },
        initialRoute: Routes.home,
        routes: Routes.routes,
      ),
    );
  }
}
