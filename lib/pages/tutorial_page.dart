// ignore_for_file: avoid_unnecessary_containers, unused_import
import 'dart:convert';
import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:courseku_mobile/widgets/list_tutorials.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'detail_course.dart';

class TutorialPage extends StatefulWidget {
  final String slug;
  final String name;

  const TutorialPage({Key? key, required this.slug, required this.name})
      : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final String apiUrl = "http://courseku.herokuapp.com/api/learn/";
  late AuthProvider authProvider = Provider.of(context);
  late UserModel user = authProvider.user;

  Future fetchCourse() async {
    final result = await http.get(
        Uri.parse("http://courseku.herokuapp.com/api/learn/" + widget.slug));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    Widget listTutorial() {
      return Container(
        child: Expanded(
          child: Container(
            // height: 400,
            margin: const EdgeInsets.only(
              top: 14,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: FutureBuilder(
              future: fetchCourse(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    // padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data['tutorial'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(6.0),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailCourse(
                                    course: snapshot.data['tutorial'][index],
                                    user: user.id,
                                  ),
                                ),
                              ).then((value) {
                                setState(() {});
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                20,
                              ),
                              margin: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 18.0,
                              ),
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
                                    snapshot.data['tutorial'][index]['name'],
                                    style: headerTextStyle.copyWith(
                                      fontWeight: semiBold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data['tutorial'][index]
                                            ['author'],
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: primaryTextColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              snapshot.data['tutorial'][index]
                                                  ['type'],
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: primaryTextColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              snapshot.data['tutorial'][index]
                                                  ['level'],
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Disubmit Oleh " +
                                            snapshot.data['tutorial'][index]
                                                ['submitted_by'],
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 18, top: 4),
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
      backgroundColor: primaryTextColor,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            );
          },
        ),
        backgroundColor: primaryTextColor,
        elevation: 0,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Learn ${widget.name}',
                              style: headerTextStyle.copyWith(
                                fontSize: 28,
                                fontWeight: bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Mari belajar ${widget.name}, kursus ini di kirim oleh berbagai user",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
