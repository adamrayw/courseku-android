// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: secondaryTextColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'A',
                        style: headerTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adam Ray Wibowo',
                        style: headerTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        'So Helpfully!',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    '1 month ago',
                    style: secondaryTextStyle,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
