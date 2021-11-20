// ignore_for_file: avoid_unnecessary_containers

import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Profile'),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 195,
                decoration: BoxDecoration(
                  color: primaryTextColor,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 26,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: headerTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 78,
                          decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              user.name[0],
                              style: primaryTextStyle.copyWith(
                                fontSize: 36,
                                color: secondaryTextColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: primaryTextStyle.copyWith(
                                color: Colors.white,
                                fontWeight: bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Reputation',
                              style: secondaryTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '120 Points',
                              style: secondaryTextStyle.copyWith(
                                  // color: Colors.white,
                                  ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                length: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabBar(
                      labelColor: primaryTextColor,
                      tabs: const [
                        Tab(
                          text: 'Bookmarked',
                        ),
                        Tab(
                          text: 'Liked',
                        ),
                        Tab(
                          text: 'Submitted',
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: [
                          Container(
                            child: Text(
                              'Tab Bookmarked',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Text(
                              'Tab Liked',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Text(
                              'Tab Submitted',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
