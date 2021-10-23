// ignore_for_file: avoid_unnecessary_containers, unused_import

import 'package:courseku_mobile/widgets/list_tutorials.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget listTutorial() {
      return Container(
        child: Expanded(
          child: ListView(
            children: [
              ListTutorial(),
              ListTutorial(),
              ListTutorial(),
              ListTutorial(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
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
                              image: NetworkImage(
                                  'https://i.imgur.com/BoN9kdC.png'),
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
              const SizedBox(
                height: 26,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Learn Python',
                        style: headerTextStyle.copyWith(
                          fontSize: 34,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        "Let's learn python, this course is sent from the programming community",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
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
