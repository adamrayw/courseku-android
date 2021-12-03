// ignore_for_file: dead_code, deprecated_member_use, prefer_collection_literals, unused_local_variable, prefer_final_fields, must_be_immutable, prefer_typing_uninitialized_variables, unused_element

import 'dart:convert';
// import 'dart:html';

import 'package:courseku_mobile/pages/webview_course.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:http/http.dart' as http;

class DetailCourse extends StatefulWidget {
  final Map course;
  final dynamic user;
  const DetailCourse({Key? key, required this.course, required this.user})
      : super(key: key);

  @override
  State<DetailCourse> createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  @override
  initState() {
    super.initState();
    checkIfVoted();
    checkifBookmarked();
    fetchComments();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController commentController = TextEditingController();

  bool _isVoted = false;
  var _iconVote = Icons.thumb_up_alt_outlined;

  bool _isSaved = false;
  var _iconSave = Icons.bookmark_add_outlined;

  checkIfVoted() {
    for (var i = 0; i < widget.course['votes'].length; i++) {
      // ignore: curly_braces_in_flow_control_structures
      if (widget.course['votes'][i]['user_id'] == widget.user) {
        _isVoted = true;
        _iconVote = Icons.thumb_up_alt;
      } else {
        _isVoted = false;
      }
    }
  }

  checkifBookmarked() {
    for (var i = 0; i < widget.course['saves'].length; i++) {
      // ignore: curly_braces_in_flow_control_structures
      if (widget.course['saves'][i]['user_id'] == widget.user) {
        _isSaved = true;
        _iconSave = Icons.bookmark_add;
      } else {
        _isSaved = false;
      }
    }
  }

  Future fetchComments() async {
    final response = await http.get(Uri.parse(
        'http://courseku.herokuapp.com/api/course/' + widget.course['slug']));

    return json.decode(response.body);
  }

  Future storevote() async {
    final response = await http.post(
      Uri.parse('http://courseku.herokuapp.com/api/storevote'),
      body: {
        'user_id': widget.user.toString(),
        'tutorials_id': widget.course['id'].toString(),
        'vote': "1",
      },
    );
    return json.encode(response.body);
  }

  Future removevote() async {
    final response = await http.delete(
      Uri.parse(
        'http://courseku.herokuapp.com/api/' +
            widget.course['id'].toString() +
            '/' +
            widget.user.toString(),
      ),
    );
    return json.encode(response.body);
  }

  Future storesave() async {
    final response = await http.post(
      Uri.parse('http://courseku.herokuapp.com/api/storesave'),
      body: {
        'user_id': widget.user.toString(),
        'tutorials_id': widget.course['id'].toString(),
        'save': "1",
      },
    );
    return json.encode(response.body);
  }

  Future removesave() async {
    final response = await http.delete(
      Uri.parse(
        'http://courseku.herokuapp.com/api/save/' +
            widget.course['id'].toString() +
            '/' +
            widget.user.toString(),
      ),
    );
    return json.encode(response.body);
  }

  Future handleComment() async {
    final response = await http
        .post(Uri.parse('http://courseku.herokuapp.com/api/comment'), body: {
      'users_id': widget.user.toString(),
      'tutorials_id': widget.course['id'].toString(),
      'comment': commentController.text,
    });
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
                    widget.course['name'],
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
                              widget.course['type'],
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
                              widget.course['level'],
                              style: secondaryTextStyle.copyWith(
                                color: primaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Disubmit oleh ' + widget.course['submitted_by'],
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
                          const SizedBox(height: 18),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
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
                                    widget.course['author'],
                                    style: secondaryTextStyle,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_isVoted == true) {
                                              _isVoted = false;
                                              _iconVote =
                                                  Icons.thumb_up_alt_outlined;
                                              removevote();
                                            } else {
                                              _isVoted = true;
                                              _iconVote = Icons.thumb_up_alt;
                                              storevote();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  duration: const Duration(
                                                    seconds: 1,
                                                  ),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content: Text(
                                                    'Course disukai',
                                                    style: secondaryTextStyle
                                                        .copyWith(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      primaryTextColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              );
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          _iconVote,
                                          color: primaryTextColor,
                                          size: 30.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (_isSaved == true) {
                                          _isSaved = false;
                                          _iconSave =
                                              Icons.bookmark_add_outlined;
                                          removesave();
                                        } else {
                                          _isSaved = true;
                                          _iconSave = Icons.bookmark_add;
                                          storesave();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration: const Duration(
                                                seconds: 1,
                                              ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                'Course di bookmark',
                                                style:
                                                    secondaryTextStyle.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              backgroundColor: primaryTextColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          );
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      _iconSave,
                                      color: primaryTextColor,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                            widget.course['description'] ?? '-',
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
                                    link: widget.course['source_link'],
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
                          Form(
                            key: _formKey,
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: commentController,
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Tulis Komentar...',
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              handleComment();
                                              commentController.clear();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                              fetchComments();
                                            });
                                          }
                                        },
                                        icon: const Icon(Icons.send),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Komentar tidak boleh kosong!";
                                      }
                                      if (value.length < 6) {
                                        return "Komentar harus lebih dari 6 huruf!";
                                      }

                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // height: 250,
                      child: FutureBuilder(
                        future: fetchComments(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 18,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {});
                                      },
                                      child: Text(
                                        snapshot.data['datas'][0]['comments']
                                                .length
                                                .toString() +
                                            ' Comments',
                                        style: headerTextStyle.copyWith(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 240,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot
                                        .data['datas'][0]['comments'].length,
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 12,
                                                    horizontal: 15,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: secondaryTextColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      snapshot.data['datas'][0]
                                                                  ['comments']
                                                              [index]['user']
                                                          ['name'][0],
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
                                                                  ['comments']
                                                              [index]['user']
                                                          ['name'],
                                                      style: headerTextStyle
                                                          .copyWith(
                                                        fontWeight: medium,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      snapshot.data['datas'][0]
                                                              ['comments']
                                                              [index]['comment']
                                                          .toString(),
                                                      style: secondaryTextStyle
                                                          .copyWith(
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
                                  ),
                                ),
                              ],
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
