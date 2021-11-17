import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;

    bool isLoading = false;

    Widget nameInput() {
      return TextField(
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
      return TextField(
        enabled: false,
        controller: TextEditingController(text: user.email),
        decoration: InputDecoration(
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 28,
          horizontal: 28,
        ),
        child: Column(
          children: [
            emailInput(),
            const SizedBox(
              height: 18,
            ),
            nameInput(),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: primaryTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: isLoading
                    ? Text(
                        'Logging in...',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        'Update',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}