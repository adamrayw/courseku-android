import 'package:courseku_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListTutorial extends StatelessWidget {
  const ListTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-tutorial');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: secondaryTextColor,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Belajar Python Bahasa Indonesia [Versi Baru]',
                  style: headerTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Kelas Terbuka',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Submitted by Elon Musk',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.thumbsUp,
                              size: 16,
                              color: headerTextColor,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '2',
                              style: headerTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.comment,
                              size: 16,
                              color: headerTextColor,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '2',
                              style: headerTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
