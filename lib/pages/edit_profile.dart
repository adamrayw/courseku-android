// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  final int id;
  final String name;
  const EditProfile({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  Future handelEdit() async {
    final response = await http.put(
        Uri.parse('http://courseku.herokuapp.com/api/update-profile/' +
            widget.id.toString()),
        body: {
          "name": nameController.text,
        });
    return json.decode(response.body);
  }

  Widget nameInput() {
    return TextFormField(
      controller: nameController..text = widget.name,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Nama tidak boleh kosong!";
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;

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
          vertical: 60,
          horizontal: 28,
        ),
        child: Form(
          key: _formKey,
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      handelEdit();
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: Text(
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
      ),
    );
  }
}
