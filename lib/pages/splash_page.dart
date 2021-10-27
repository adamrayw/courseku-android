import 'dart:async';

import 'package:courseku_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    setState(() {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/sign-up'),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'COURSEKU',
                style: GoogleFonts.poppins(
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'The best place to find Programming courses & tutorials',
                style: secondaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
