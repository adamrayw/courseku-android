import 'dart:convert';

import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  late AuthProvider authProvider = Provider.of(context, listen: false);
  late UserModel user = authProvider.user;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCourseController = TextEditingController();
  TextEditingController descriptionCourseController = TextEditingController();
  TextEditingController authorCourseController = TextEditingController();
  TextEditingController courseCourseController = TextEditingController();
  TextEditingController typeCourseController = TextEditingController();
  TextEditingController levelCourseController = TextEditingController();
  TextEditingController sourceLinkCourseController = TextEditingController();

  String? _valLanguage;
  String? _valType;
  String? _valLevel;
  late List<dynamic> _dataLanguage = [];
  List type = ["Video", "Artikel"];
  List level = ["Beginner", "Advanced"];

  void getLanguage() async {
    final response =
        await http.get(Uri.parse('http://courseku.herokuapp.com/api/language'));
    var listData = jsonDecode(response.body);
    print("data : $listData");
    setState(() {
      _dataLanguage = listData;
    });
  }

  Future handleSubmit() async {
    final response = await http
        .post(Uri.parse('http://courseku.herokuapp.com/api/submit'), body: {
      "user_id": user.id.toString(),
      "course_id": _valLanguage.toString(),
      "comment_id": "0",
      "name": nameCourseController.text,
      "description": descriptionCourseController.text,
      "author": authorCourseController.text,
      "type": _valType,
      "level": _valLevel,
      "source_link": sourceLinkCourseController.text,
      "submitted_by": user.name,
      "views": "0",
    });

    print(json.encode(response.body));
  }

  @override
  void initState() {
    super.initState();
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    Widget nameCourse() {
      return TextFormField(
        controller: nameCourseController,
        decoration: InputDecoration(
          hintText: 'Nama Course',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Nama Course tidak boleh kosong!";
          }

          return null;
        },
      );
    }

    Widget descriptionCourse() {
      return TextFormField(
        controller: descriptionCourseController,
        minLines: 6,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: 'Description',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Description tidak boleh kosong!";
          }

          return null;
        },
      );
    }

    Widget authorCourse() {
      return TextFormField(
        controller: authorCourseController,
        decoration: InputDecoration(
          hintText: 'Author',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Author tidak boleh kosong!";
          }

          return null;
        },
      );
    }

    Widget courseCourse() {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        isExpanded: true,
        hint: const Text('Pilih Language'),
        value: _valLanguage,
        items: _dataLanguage.map(
          (item) {
            return DropdownMenuItem(
              child: Text(item['name']),
              value: item['id'].toString(),
            );
          },
        ).toList(),
        onChanged: (value) {
          setState(() {
            _valLanguage = value.toString();
          });
        },
        validator: (value) {
          if (value == null) {
            return "Course tidak boleh kosong!";
          }

          return null;
        },
      );
    }

    Widget typeCourse() {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        isExpanded: true,
        hint: const Text('Pilih Type'),
        value: _valType,
        items: type.map(
          (item) {
            return DropdownMenuItem(
              child: Text(item),
              value: item,
            );
          },
        ).toList(),
        onChanged: (value) {
          setState(() {
            _valType = value.toString();
          });
        },
        validator: (value) {
          if (value == null) {
            return "Author tidak boleh kosong!";
          }

          return null;
        },
      );
    }

    Widget levelCourse() {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        isExpanded: true,
        hint: const Text('Pilih Level'),
        value: _valLevel,
        items: level.map(
          (item) {
            return DropdownMenuItem(
              child: Text(item),
              value: item,
            );
          },
        ).toList(),
        onChanged: (value) {
          setState(() {
            _valLevel = value.toString();
          });
        },
        validator: (value) {
          if (value == null) {
            return "Level tidak boleh kosong!";
          }

          return null;
        },
      );
    }

    Widget sourceLinkCourse() {
      return TextFormField(
        controller: sourceLinkCourseController,
        decoration: InputDecoration(
          hintText: 'Source Link',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Source Link tidak boleh kosong!";
          }

          return null;
        },
      );
    }

    Widget buttonSubmit() {
      return Container(
        height: 48,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              handleSubmit();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(
                    seconds: 4,
                  ),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    'Terima Kasih sudah berkontribusi, submission kamu sedan direview.',
                    style: secondaryTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: primaryTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
              // Navigator.pushNamed(context, '/');
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          child: Text(
            'Submit',
            style: headerTextStyle.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
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
                                'Submit Course',
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
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        child: Expanded(
                          child: Container(
                            // height: 400,

                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              color: Colors.white,
                            ),
                            child: Form(
                              key: _formKey,
                              child: ListView(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        nameCourse(),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        descriptionCourse(),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        authorCourse(),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        courseCourse(),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        typeCourse(),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        levelCourse(),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        sourceLinkCourse(),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        buttonSubmit(),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
