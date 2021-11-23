// ignore_for_file: dead_code, deprecated_member_use, prefer_collection_literals, unused_local_variable, prefer_final_fields, must_be_immutable

import 'dart:convert';

import 'package:courseku_mobile/pages/webview_course.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:http/http.dart' as http;

class DetailCourse extends StatelessWidget {
  final Map course;
  const DetailCourse({Key? key, required this.course}) : super(key: key);

  Future fetchComments() async {
    final response = await http.get(Uri.parse(
        'http://courseku.herokuapp.com/api/course/' + course['slug']));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 18,
                left: 18,
                right: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['name'],
                    style: headerTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              course['type'],
                              style: secondaryTextStyle.copyWith(
                                color: primaryTextColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              course['level'],
                              style: secondaryTextStyle.copyWith(
                                color: primaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Disubmit oleh ' + course['submitted_by'],
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 18,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Author',
                            style: headerTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            course['author'],
                            style: secondaryTextStyle,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Deskripsi',
                            style: headerTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            course['description'] ?? '-',
                            style: secondaryTextStyle,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebviewCourse(
                                    link: course['source_link'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: primaryTextColor,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Text(
                                'Mulai Belajar',
                                style: secondaryTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.2,
                                color: secondaryTextColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        course['comments'].length.toString() + ' Comments',
                        style: headerTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 180,
                      child: FutureBuilder(
                        future: fetchComments(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  snapshot.data['datas'][0]['comments'].length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              color: secondaryTextColor,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Center(
                                              child: Text(
                                                snapshot.data['datas'][0]
                                                        ['comments'][index]
                                                    ['user']['name'][0],
                                                style: headerTextStyle,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data['datas'][0]
                                                        ['comments'][index]
                                                    ['user']['name'],
                                                style: headerTextStyle.copyWith(
                                                  fontWeight: medium,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                snapshot.data['datas'][0]
                                                        ['comments'][index]
                                                        ['comment']
                                                    .toString(),
                                                style:
                                                    secondaryTextStyle.copyWith(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                              ),
                              child: Text(
                                'Loading Komentar...',
                                style: secondaryTextStyle,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
