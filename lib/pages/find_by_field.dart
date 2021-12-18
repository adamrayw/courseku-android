// ignore_for_file: avoid_unnecessary_containers, unused_import
import 'dart:convert';
import 'package:courseku_mobile/pages/tutorial_page.dart';
import 'package:http/http.dart' as http;
import 'package:courseku_mobile/widgets/list_tutorials.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'detail_course.dart';

class FindByField extends StatelessWidget {
  final String slug;
  final String name;
  const FindByField({Key? key, required this.slug, required this.name})
      : super(key: key);

  Future<List<dynamic>> fetchCourse() async {
    final result =
        await http.get(Uri.parse("http://courseku.herokuapp.com/api/" + slug));
    return json.decode(result.body)['field'][0]['course'];
  }

  String _nameCourse(dynamic dataNameCourse) {
    if (dataNameCourse['name'] != null) {
      return dataNameCourse['name'];
    } else {
      return "Course not available!";
    }
  }

  String _nameSlug(dynamic dataNameSlug) {
    if (dataNameSlug['slug'] != null) {
      return dataNameSlug['slug'];
    } else {
      return "Course not available!";
    }
  }

  String _img(dynamic dataImg) {
    if (dataImg['img_url'] != null) {
      return dataImg['img_url'];
    } else {
      return "Course not available!";
    }
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
            child: FutureBuilder<List<dynamic>>(
              future: fetchCourse(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(18),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(6.0),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TutorialPage(
                                slug: _nameSlug(snapshot.data[index]),
                                name: _nameCourse(snapshot.data[index]),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 64,
                          // height: 56.89,
                          // margin: const EdgeInsets.symmetric(
                          //   horizontal: 18,
                          //   vertical: 18,
                          // ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            border: Border.all(
                              width: 0.5,
                              color: secondaryTextColor,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Image.network(
                            _img(snapshot.data[index]),
                            width: 1,
                          ),
                        ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        child: Column(
                          children: [
                            Text(
                              name,
                              style: headerTextStyle.copyWith(
                                fontSize: 28,
                                fontWeight: bold,
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
