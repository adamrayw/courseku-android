import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryTextColor,
        title: Text(
          'Profile',
          style: headerTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: primaryTextColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  "A",
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              'Adam Ray',
              style: headerTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
