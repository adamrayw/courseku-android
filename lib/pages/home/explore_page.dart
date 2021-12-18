import 'dart:convert';

import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../detail_course.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late AuthProvider authProvider = Provider.of(context, listen: false);
  late UserModel user = authProvider.user;
  Future getCourse() async {
    final response =
        await http.get(Uri.parse('http://courseku.herokuapp.com/api/explore'));
    return json.decode(response.body);
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
              future: getCourse(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    // padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data['data'].length,
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
                                    course: snapshot.data['data'][index],
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
                                    snapshot.data['data'][index]['name'],
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
                                        snapshot.data['data'][index]['author'],
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
                                              snapshot.data['data'][index]
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
                                              snapshot.data['data'][index]
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
                                            snapshot.data['data'][index]
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
                    // height: 500,
                    margin: const EdgeInsets.only(
                      top: 60,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      ],
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
                        // height: 80,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 28,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Explore Course',
                                style: headerTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 18,
                      // ),
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
