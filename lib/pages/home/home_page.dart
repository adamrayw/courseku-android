// ignore_for_file: avoid_unnecessary_containers, unused_element, unused_import, unused_local_variable

import 'dart:convert';
import 'package:courseku_mobile/models/homeprog_model.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:courseku_mobile/widgets/programming_card.dart';
import 'package:courseku_mobile/widgets/courses_by_field.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/services/homeprog_service.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homes = <HomeProgModel>[];
  @override
  void initState() {
    super.initState();
  }

  final String apiUrl = "http://courseku.herokuapp.com/api/home";

  Future<List<dynamic>> fetchProg() async {
    final result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  String _name(dynamic data) {
    return data['name'];
  }

  String _img(dynamic data_img) {
    return data_img['img_url'];
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.all(8),
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
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    }

    Widget coursesByField() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                children: const [
                  CoursesByFieldCard(),
                  CoursesByFieldCard(),
                ],
              ),
            ],
          ),
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
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Hi, Adam',
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
