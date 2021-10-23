import 'package:courseku_mobile/pages/detail_tutorial.dart';
import 'package:courseku_mobile/pages/home/main_page.dart';
import 'package:courseku_mobile/pages/splash_page.dart';
import 'package:courseku_mobile/pages/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'pages/sign_up_page.dart';
import 'pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-in': (context) => const SignInPage(),
        '/main': (context) => const MainPage(),
        '/tutorial': (context) => const TutorialPage(),
        '/detail-tutorial': (context) => const DetailTutorial(),
      },
    );
  }
}
