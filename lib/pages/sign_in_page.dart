import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
                  'Welcome \nBack!',
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
                'Want to learn something new?',
                style: secondaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              emailInput(),
              const SizedBox(
                height: 18,
              ),
              passwordInput(),
              const SizedBox(
                height: 18,
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
                    'Sign In',
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
                    'Dont have an account?',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: Text(
                      ' Sign Up',
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
