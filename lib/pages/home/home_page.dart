// ignore_for_file: avoid_unnecessary_containers

import 'package:courseku_mobile/theme.dart';
import 'package:courseku_mobile/widgets/programming_card.dart';
import 'package:courseku_mobile/widgets/courses_by_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget programmingCarousel() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                children: const [
                  ProgrammingCard(),
                  ProgrammingCard(),
                  ProgrammingCard(),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget coursesByField() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                children: const [
                  CoursesByFieldCard(),
                  CoursesByFieldCard(),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Container(
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
                            image:
                                NetworkImage('https://i.imgur.com/BoN9kdC.png'),
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
            Container(
              margin: const EdgeInsets.only(top: 26, left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
