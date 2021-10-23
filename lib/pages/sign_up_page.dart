import 'package:courseku_mobile/theme.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  Widget fullNameInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Full Name',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryTextColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }

  Widget emailInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryTextColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }

  Widget passwordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryTextColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }

  Widget confirmPasswordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryTextColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 28),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 46,
                ),
                child: Text(
                  'Welcome to \nCOURSEKU',
                  style: primaryTextStyle.copyWith(
                    fontSize: 38,
                    fontWeight: bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Sign up to submit, like, comment and more!',
                style: secondaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              fullNameInput(),
              const SizedBox(
                height: 18,
              ),
              emailInput(),
              const SizedBox(
                height: 18,
              ),
              passwordInput(),
              const SizedBox(
                height: 18,
              ),
              confirmPasswordInput(),
              const SizedBox(
                height: 38,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 48,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign-in');
                    },
                    child: Text(
                      ' Sign In',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 42,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
