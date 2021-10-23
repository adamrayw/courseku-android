// ignore_for_file: dead_code

import 'package:courseku_mobile/pages/home/bookmark_page.dart';
import 'package:courseku_mobile/pages/home/home_page.dart';
import 'package:courseku_mobile/pages/home/profile_page.dart';
import 'package:courseku_mobile/pages/home/submit_page.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customButtonNav() {
      return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home_icon.png',
              width: 20,
              color: currentIndex == 0 ? primaryTextColor : secondaryTextColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/bookmark_icon.png',
              width: 20,
              color: currentIndex == 1 ? primaryTextColor : secondaryTextColor,
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/submit_icon.png',
              width: 20,
              color: currentIndex == 2 ? primaryTextColor : secondaryTextColor,
            ),
            label: 'Submit',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/profile_icon.png',
              width: 20,
              color: currentIndex == 3 ? primaryTextColor : secondaryTextColor,
            ),
            label: 'Profile',
          ),
        ],
      );
    }

    Widget? body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
          break;
        case 1:
          return const BookmarkPage();
          break;
        case 2:
          return const SubmitPage();
          break;
        case 3:
          return const ProfilePage();
          break;
        default:
      }
    }

    return Scaffold(
      bottomNavigationBar: customButtonNav(),
      // appBar: AppBar(
      //   title: Row(
      //     children: <Widget>[
      //       Container(
      //         width: 40,
      //         height: 40,
      //         decoration: const BoxDecoration(
      //           shape: BoxShape.circle,
      //           image: DecorationImage(
      //             fit: BoxFit.fill,
      //             image: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         width: 14,
      //       ),
      //       Text(
      //         'Hi, Adam',
      //         style: primaryTextStyle.copyWith(
      //           fontSize: 18,
      //           fontWeight: medium,
      //         ),
      //       ),
      //     ],
      //   ),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   actions: <Widget>[
      //     Row(
      //       children: const [],
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Image.asset(
      //         'assets/setting_icon.png',
      //         width: 20,
      //       ),
      //     ),
      //   ],
      // ),
      body: body(),
    );
  }
}
