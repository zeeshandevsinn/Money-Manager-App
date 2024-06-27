import 'package:firebase_auth/firebase_auth.dart';
import 'package:kamino_app/Second_Dashboard/second_dashboard.dart';
import 'package:kamino_app/page/auth/account_setup.dart';
import 'package:kamino_app/page/auth/check_email_view_screen.dart';
import 'package:kamino_app/page/auth/forgot_password_screen.dart';
import 'package:kamino_app/page/auth/login_screen.dart';
import 'package:kamino_app/page/auth/register_screen.dart';
import 'package:kamino_app/page/auth/verify_otp_screen.dart';
import 'package:kamino_app/page/home/home_screen.dart';
import 'package:kamino_app/page/manage/manage_all_screen.dart';
import 'package:kamino_app/page/manage/manage_limit_screeen.dart';
import 'package:kamino_app/page/splash/splash_screen.dart';
import 'package:kamino_app/page/wallet/add_new_wallet_screen.dart';
import 'package:kamino_app/page/wallet/my_wallet_screen.dart';
import 'package:kamino_app/page/wallet/wallet_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:kamino_app/start_app.dart';

import 'add_manage_wallet/add_manage_wallet_screen.dart';
import 'add_manage_wallet_event/add_manage_wallet_event_screen.dart';
import 'add_manage_wallet_repeat/add_manage_wallet_repeat_screen.dart';
import 'home/home_screen.dart';
import 'menu_screen.dart';
import 'setting_screen.dart';
import 'transaction/transaction_page.dart';
import 'transaction_search/transaction_search_page.dart';

class Routes {
  static const String home = '/';
  static const String secondDashboard = '/second';
  static const String firstDashboard = '/splash';
  static const String manageLimit = '/manage-limit';
  static const String manageAll = '/manage-all';
  static const String walletScreen = '/wallet-screen';
  static const String addNewWallet = '/add-new-wallet';
  static const String myWallet = '/my-wallet';
  static const String verifyOTP = '/verify-otp';
  static const String checkEmailView = '/check-email-view';
  static const String forgotPassword = '/forgot-password';
  static const String accountSetup = '/account-setup';
  static const String register = '/register';
  static const String login = '/login';
  static const String homeScreen = '/home';
  static const String transactionPage = '/transaction-page';
  static const String menuScreen = '/menu-screen';
  static const String transactionSearchPage = '/transaction-search-page';
  static const String addManageWalletScreen = '/add-manage-wallet-screen';
  static const String addManageWalletEventScreen =
      '/add-manage-wallet-event-screen';
  static const String addManageWalletRepeatScreen =
      '/add-manage-wallet-repeat-screen';
  static const String settingScreen = '/settingScreen';
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => StartApp(),
    '/second': (context) => SecondDashboard(),
    '/splash': (context) => const SplashScreen(),
    '/manage-limit': (context) => const ManageLimitScreen(),
    '/manage-all': (context) => const ManageAllScreen(),
    '/wallet-screen': (context) => const WalletSuccessScreen(),
    '/add-new-wallet': (context) => const AddNewWalletScreen(),
    '/my-wallet': (context) => const MyWalletScreen(),
    // '/verify-otp': (context) => VerifyOTPScreen(
    //       VerificationID: '',
    //       password: '',
    //       resendToken: 0,
    //     ),
    '/check-email-view': (context) => const CheckEmailViewScreen(),
    '/forgot-password': (context) => const ForgotPasswordScreen(),
    '/account-setup': (context) => const AccountSetup(),
    '/register': (context) => const RegisterScreen(),
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(
          uid: "",
        ),
    '/transactionPage': (context) => TransactionPage(
          userUid: FirebaseAuth.instance.currentUser!.uid,
        ),
    '/MenuScreen': (context) => const MenuScreen(),
    '/transactionSearchPage': (context) => const TransactionSearchPage(),
    '/addManageWalletScreen': (context) => const AddManageWalletScreen(),
    '/addManageWalletEventScreen': (context) =>
        const AddManageWalletEventScreen(),
    '/addManageWalletRepeatScreen': (context) =>
        const AddManageWalletRepeatScreen(),
    '/settingScreen': (context) => const SettingScreen(),
  };
}
