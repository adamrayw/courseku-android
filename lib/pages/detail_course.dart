// ignore_for_file: dead_code, deprecated_member_use, prefer_collection_literals, unused_local_variable, prefer_final_fields, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:http/http.dart' as http;
import 'package:courseku_mobile/models/CommentModel.dart';

class DetailCourse extends StatelessWidget {
  final String slug;
  DetailCourse({Key? key, required this.slug}) : super(key: key);

  Future<dynamic> fetchDetailCourse() async {
    final result = await http.get(
      Uri.parse('http://courseku.herokuapp.com/api/course/' + slug),
    );
    return json.decode(result.body)['datas'];
  }

  List<Comment> _comments = <Comment>[];

  Future<List<Comment>> fetchComment() async {
    final response = await http.get(
      Uri.parse('http://courseku.herokuapp.com/api/course/' + slug),
    );

    var comments = <Comment>[];

    if (response.statusCode == 200) {
      var commentsJson = json.decode(response.body);
      for (var commentJson in commentsJson) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }

  String _nameCourse(dynamic dataNameCourse) {
    return dataNameCourse['name'];
  }

  String _nameType(dynamic dataNameType) {
    return dataNameType['type'];
  }

  String _nameLevel(dynamic dataNameLevel) {
    return dataNameLevel['level'];
  }

  String _nameSubmitted(dynamic dataNameSubmitted) {
    return dataNameSubmitted['submitted_by'];
  }

  String _nameAuthor(dynamic dataNameAuthor) {
    return dataNameAuthor['author'];
  }

  String _commentLength(dynamic dataCommentLength) {
    var comment = dataCommentLength['comments'];
    return comment.length.toString();
  }

  // String _comments(dynamic dataComment) {
  //   return dataComment['comments'][1]['comment'].toString();
  // }

  String _nameDescription(dynamic dataNameDescription) {
    if (dataNameDescription['description'] != null) {
      return dataNameDescription['description'];
    } else {
      return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchComment().then((value) => _comments.addAll(value));
    Widget comment() {
      return Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Text(_comments[index].comment),
            );
          },
        ),
      );
    }

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
        child: FutureBuilder<dynamic>(
          future: fetchDetailCourse(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
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
                          _nameCourse(snapshot.data[0]),
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
                                    _nameType(snapshot.data[0]),
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
                                    _nameLevel(snapshot.data[0]),
                                    style: secondaryTextStyle.copyWith(
                                      color: primaryTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Disubmit oleh ' +
                                  _nameSubmitted(snapshot.data[0]),
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 18,
                      left: 18,
                      right: 18,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
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
                          _nameAuthor(snapshot.data[0]),
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
                          _nameDescription(snapshot.data[0]),
                          style: secondaryTextStyle,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InkWell(
                          onTap: () {},
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
                        Text(
                          _commentLength(snapshot.data[0]) + ' Comments',
                          style: headerTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                        comment(),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Text(
                'Loading...',
                style: secondaryTextStyle,
              );
            }
          },
        ),
      ),
    );
  }
}
