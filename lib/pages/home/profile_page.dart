import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:courseku_mobile/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryTextColor,
        // centerTitle: true,
        title: Text(
          'Profile',
          style: headerTextStyle.copyWith(
            color: Colors.white,
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(
              color: primaryTextColor,
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        user.name[0],
                        style: primaryTextStyle.copyWith(
                          fontSize: 48,
                          color: secondaryTextColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    user.name,
                    style: headerTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Column(
                  //   // crossAxisAlignment: CrossAxisAlignment.baseline,
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Icon(
                  //           Icons.star,
                  //           color: Colors.blue.shade900,
                  //         ),
                  //         const SizedBox(
                  //           width: 6,
                  //         ),
                  //         Text(
                  //           'Reputation',
                  //           style: headerTextStyle.copyWith(
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Text(
                  //       '120',
                  //       style: secondaryTextStyle.copyWith(
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 35,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: secondaryTextColor,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit Profile",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        Icon(
                          Icons.edit,
                          color: primaryTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: secondaryTextColor,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Log out",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.red.shade300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
