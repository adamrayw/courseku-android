// ignore_for_file: avoid_unnecessary_containers, unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:courseku_mobile/widgets/list_tutorials.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TutorialPage extends StatelessWidget {
  final String slug;
  final String name;
  final String apiUrl = "http://courseku.herokuapp.com/api/learn/";
  const TutorialPage({Key? key, required this.slug, required this.name})
      : super(key: key);

  Future<List<dynamic>> fetchCourse() async {
    final result = await http
        .get(Uri.parse("http://courseku.herokuapp.com/api/learn/" + slug));
    return json.decode(result.body)['tutorial'];
  }

  String _nameCourse(dynamic dataNameCourse) {
    return dataNameCourse['name'];
  }

  String _nameAuthor(dynamic dataNameAuthor) {
    return dataNameAuthor['author'];
  }

  @override
  Widget build(BuildContext context) {
    Widget listTutorial() {
      return Container(
        child: Expanded(
          child: Container(
            height: 400,
            // color: Colors.amber,
            child: FutureBuilder<List<dynamic>>(
              future: fetchCourse(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    // padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(6.0),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 20,
                          ),
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            border: Border.all(
                              width: 0.5,
                              color: secondaryTextColor,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _nameCourse(
                                  snapshot.data[index],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _nameAuthor(
                                  snapshot.data[index],
                                ),
                                style: secondaryTextStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Container(
                    child: Text(
                      'Loading...',
                      style: secondaryTextStyle,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
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
                              image: NetworkImage(
                                  'https://i.imgur.com/BoN9kdC.png'),
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
              const SizedBox(
                height: 26,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Learn $name',
                        style: headerTextStyle.copyWith(
                          fontSize: 34,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        "Mari belajar $name, kursus ini di kirim oleh berbagai user",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      listTutorial()
                    ],
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
