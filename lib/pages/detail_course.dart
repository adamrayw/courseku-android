import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class DetailCourse extends StatelessWidget {
  final String slug;
  const DetailCourse({Key? key, required this.slug}) : super(key: key);

  Future<dynamic> fetchDetailCourse() async {
    final result = await http.get(
      Uri.parse('http://courseku.herokuapp.com/api/course/' + slug),
    );
    return json.decode(result.body)['datas'];
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

  String _nameDescription(dynamic dataNameDescription) {
    if (dataNameDescription['description'] != null) {
      return dataNameDescription['description'];
    } else {
      return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 18,
                        left: 18,
                        right: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Author',
                            style: headerTextStyle.copyWith(
                              fontSize: 20,
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
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(_nameDescription(snapshot.data[0]),
                              style: secondaryTextStyle),
                        ],
                      ),
                    ),
                  )
                ],
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
    );
  }
}
