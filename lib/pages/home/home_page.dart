// ignore_for_file: avoid_unnecessary_containers, unused_element, unused_import, unused_local_variable

import 'dart:convert';
import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:courseku_mobile/widgets/programming_card.dart';
import 'package:courseku_mobile/widgets/courses_by_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final String apiUrl = "http://courseku.herokuapp.com/api/home";
  final String apiUrl2 = "http://courseku.herokuapp.com/api/field";

  Future<List<dynamic>> fetchProg() async {
    final result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  Future<List<dynamic>> fetchField() async {
    final result = await http.get(Uri.parse(apiUrl2));
    return json.decode(result.body);
  }

  String _name(dynamic data) {
    return data['name'];
  }

  String _img(dynamic dataImg) {
    return dataImg['img_url'];
  }

  String _nameField(dynamic dataField) {
    return dataField['name'];
  }

  String _imgField(dynamic dataFImg) {
    return dataFImg['img_url'];
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;

    Widget programmingCarousel() {
      return Container(
        height: 80,
        width: double.infinity,
        child: FutureBuilder<List<dynamic>>(
          future: fetchProg(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          width: 200,
                          height: 64,
                          margin: const EdgeInsets.only(right: 22),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            border: Border.all(
                              width: 0.5,
                              color: secondaryTextColor,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                _img(snapshot.data[index]),
                                width: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _name(snapshot.data[index]),
                                style: headerTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    }

    Widget coursesByField() {
      return Container(
        height: 80,
        width: double.infinity,
        child: FutureBuilder<List<dynamic>>(
          future: fetchField(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          width: 200,
                          height: 64,
                          margin: const EdgeInsets.only(right: 22),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            border: Border.all(
                              width: 0.5,
                              color: secondaryTextColor,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                _imgField(snapshot.data[index]),
                                width: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _nameField(snapshot.data[index]),
                                style: headerTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    }

    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 18, left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xff3B82F6),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            user.name[0],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Hi, ${user.name}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/setting_icon.png',
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 26, left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What do you want to learn?',
                    style: headerTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  programmingCarousel(),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    'Find courses by field',
                    style: headerTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  coursesByField()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
