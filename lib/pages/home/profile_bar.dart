// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';

import 'package:courseku_mobile/models/user_model.dart';
import 'package:courseku_mobile/pages/edit_profile.dart';
import 'package:courseku_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../theme.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late AuthProvider authProvider = Provider.of(context);
  late UserModel user = authProvider.user;
  Future fetchProfile() async {
    var response = await http.get(Uri.parse(
        'http://courseku.herokuapp.com/api/profile/' + user.id.toString()));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
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
                decoration: const BoxDecoration(
                  // color: primaryTextColor,
                  image: DecorationImage(
                    image: AssetImage('assets/background_carousel.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
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
                            Row(
                              children: [
                                Container(
                                  width: 160,
                                  child: Text(
                                    user.name,
                                    style: primaryTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: bold,
                                      fontSize: 24,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfile(
                                          id: user.id,
                                          name: user.name,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 6,
                            // ),
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
                              user.points.toString() + ' Points',
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
                          icon: Icon(Icons.bookmark),
                        ),
                        Tab(
                          icon: Icon(Icons.thumb_up),
                        ),
                        Tab(
                          icon: Icon(Icons.send),
                        ),
                      ],
                    ),
                    Container(
                      height: 500,
                      child: TabBarView(
                        children: [
                          Container(
                            child: FutureBuilder(
                              future: fetchProfile(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot
                                        .data['data']['bookmarked'].length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          right: 30,
                                          left: 30,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            snapshot.data['data']['bookmarked']
                                                            [index]['tutorials']
                                                        ['name'] !=
                                                    null
                                                ? Text(
                                                    snapshot.data['data']
                                                                ['bookmarked']
                                                            [index]['tutorials']
                                                        ['name'],
                                                    style: headerTextStyle
                                                        .copyWith(
                                                      fontWeight: medium,
                                                      fontSize: 18,
                                                    ))
                                                : const Text('No Bookmark'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Container(
                                    // width: 200,
                                    // height: 500,
                                    margin: const EdgeInsets.only(
                                      top: 60,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        CircularProgressIndicator(
                                          strokeWidth: 1,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Container(
                            child: FutureBuilder(
                              future: fetchProfile(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        snapshot.data['data']['liked'].length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          right: 30,
                                          left: 30,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data['data']['liked']
                                                  [index]['tutorial']['name'],
                                              style: headerTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Container(
                                    // width: 200,
                                    // height: 500,
                                    margin: const EdgeInsets.only(
                                      top: 60,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        CircularProgressIndicator(
                                          strokeWidth: 1,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Container(
                            child: FutureBuilder(
                              future: fetchProfile(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot
                                        .data['data']['submitted'].length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          right: 30,
                                          left: 30,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data['data']
                                                          ['submitted'][index]
                                                      ['name'],
                                                  style:
                                                      headerTextStyle.copyWith(
                                                    fontWeight: medium,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 6,
                                                      horizontal: 8),
                                                  margin: const EdgeInsets.only(
                                                    right: 6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: snapshot.data['data']
                                                                    [
                                                                    'submitted']
                                                                [
                                                                index]['status'] ==
                                                            'Draft'
                                                        ? Colors.grey
                                                        : Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text(
                                                    snapshot.data['data'][
                                                                    'submitted']
                                                                [
                                                                index]['status'] ==
                                                            'Draft'
                                                        ? 'Sedang direview'
                                                        : 'Disetujui',
                                                    style: headerTextStyle
                                                        .copyWith(
                                                      fontWeight: medium,
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Container(
                                    // width: 200,
                                    // height: 500,
                                    margin: const EdgeInsets.only(
                                      top: 60,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        CircularProgressIndicator(
                                          strokeWidth: 1,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
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
