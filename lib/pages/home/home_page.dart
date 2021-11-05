// ignore_for_file: avoid_unnecessary_containers, unused_element, unused_import, unused_local_variable

import 'dart:convert';
import 'package:courseku_mobile/models/carousel_artikel_model.dart';
import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:courseku_mobile/providers/carousel_artikel_provider.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:courseku_mobile/widgets/programming_card.dart';
import 'package:courseku_mobile/widgets/courses_by_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final String apiUrl = "http://courseku.herokuapp.com/api/home";
  final String apiUrl2 = "http://courseku.herokuapp.com/api/field";
  final String apiUrl3 = "http://courseku.herokuapp.com/api/carousel-artikel";

  Future<List<dynamic>> fetchProg() async {
    final result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  Future<List<dynamic>> fetchField() async {
    final result = await http.get(Uri.parse(apiUrl2));
    return json.decode(result.body);
  }

  String _name(dynamic data) {
    return data['name'];
  }

  String _img(dynamic dataImg) {
    return dataImg['img_url'];
  }

  String _nameField(dynamic dataField) {
    return dataField['name'];
  }

  String _imgField(dynamic dataFImg) {
    return dataFImg['img_url'];
  }

  final List<String> imageList = [
    "Text 1",
    "Text 2",
    "Text 3",
  ];

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;
    CarouselArtikelProvider artikelProvider =
        Provider.of<CarouselArtikelProvider>(context);

    Widget programmingCarousel() {
      return Container(
        height: 154,
        // color: Colors.amber,
        child: FutureBuilder<List<dynamic>>(
          future: fetchProg(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                // padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(6.0),
                    onTap: () {},
                    child: Container(
                      width: 64,
                      // height: 56.89,
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
                child: Text(
                  'Loading Data...',
                  style: secondaryTextStyle,
                ),
              );
            }
          },
        ),
      );
    }

    Widget coursesByField() {
      return Container(
        height: 154,
        // color: Colors.amber,
        child: FutureBuilder<List<dynamic>>(
          future: fetchField(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 4 / 2,
                ),
                // padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(6.0),
                    onTap: () {},
                    child: Container(
                      width: 64,
                      height: 20,
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 12,
                      //   vertical: 10,
                      // ),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(
                          width: 0.5,
                          color: secondaryTextColor,
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            _imgField(snapshot.data[index]),
                            width: 28,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            _nameField(
                              snapshot.data[index],
                            ),
                            style: secondaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
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
                  'Loading Data...',
                  style: secondaryTextStyle,
                ),
              );
            }
          },
        ),
      );
    }

    return Container(
      child: SafeArea(
        child: ListView(
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
                          color: Color(0xff3B82F6),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            user.name[0],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Hi, ${user.name}',
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
              height: 16,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 120,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
              items: artikelProvider.artikel
                  .map((e) => Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: secondaryTextColor,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/background_carousel.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 26, left: 18, right: 18),
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
