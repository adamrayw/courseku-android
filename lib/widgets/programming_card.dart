import 'package:courseku_mobile/theme.dart';
import 'package:flutter/material.dart';

class ProgrammingCard extends StatelessWidget {
  const ProgrammingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tutorial');
      },
      child: Container(
        width: 200,
        height: 64,
        margin: const EdgeInsets.only(right: 22),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(
            width: 0.5,
            color: secondaryTextColor,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          children: [
            Image.network(
              'https://img.icons8.com/color/96/000000/python--v1.png',
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Python',
              style: headerTextStyle.copyWith(
                fontSize: 18,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
