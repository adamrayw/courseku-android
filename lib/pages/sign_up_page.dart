import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  TextEditingController passwordConfirmationController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      )) {
        Navigator.pushNamed(context, '/main');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xff15D2A7),
            content: Text(
              'Register Berhasil!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xffff0f0f),
            content: Text(
              'Registration Failed!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget fullNameInput() {
      return TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: 'Nama Lengkap',
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
      return TextFormField(
        controller: emailController,
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
      return TextFormField(
        controller: passwordController,
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
        controller: passwordConfirmationController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Konfirmasi Password',
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

    Widget signUpButton() {
      return SizedBox(
        height: 48,
        width: double.infinity,
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
            backgroundColor: primaryTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          child: isLoading
              ? Text(
                  'Mohon Tunggu...',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
        ),
      );
    }

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
                  'Register',
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
                'Register untuk like, comment, dan masih banyak lagi!',
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
              signUpButton(),
              const SizedBox(
                height: 54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign-in');
                    },
                    child: Text(
                      ' Login',
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
