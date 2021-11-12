// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:courseku_mobile/pages/detail_course.dart';
import 'package:courseku_mobile/pages/home/main_page.dart';
import 'package:courseku_mobile/pages/splash_page.dart';
import 'package:courseku_mobile/pages/tutorial_page.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:courseku_mobile/providers/carousel_artikel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarouselArtikelProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-in': (context) => const SignInPage(),
          '/main': (context) => const MainPage(),
          '/detail-course': (context) => const DetailCourse()
        },
      ),
    );
  }
}
