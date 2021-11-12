import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCourse extends StatelessWidget {
  const DetailCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: [
                  Text(
                    'Belajar Python Bahasa Indonesia [Versi Baru]',
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
                              'Video',
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
                              'Advanced',
                              style: secondaryTextStyle.copyWith(
                                color: primaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Submitted by Ray',
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 18,
                  right: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author',
                      style: headerTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Kelas Terbuka',
                      style: secondaryTextStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Deskripsi',
                      style: headerTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'At times, for some reason, you might want to generate random numbers in JavaScript. Instead of cracking your brain over this, there are two useful built-in methods provided by the Math module, and these are what we will use.',
                      style: secondaryTextStyle,
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
