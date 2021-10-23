import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';

class CoursesByFieldCard extends StatelessWidget {
  const CoursesByFieldCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      // height: 64,
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
            'https://img.icons8.com/cotton/64/000000/source-code--v5.png',
            width: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Progamming',
                style: headerTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '10 Courses',
                style: secondaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
