import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/screens/auth/auth_page.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/utils/data.dart';
import 'package:the_perfect_home_zm/widgets/custom_image.dart';
import 'package:the_perfect_home_zm/widgets/setting_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            backgroundColor: appBgColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getHeader()),
        SliverToBoxAdapter(child: getBody())
      ],
    );
  }

  getHeader() {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Settings",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Column(
            children: [
              CustomImage(
                profile,
                width: 70,
                height: 70,
                radius: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Malaika Cosam",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   child: Text("Basic Info", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          // ),
          // SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: "Profile",
                leadingIcon: Icons.person,
                bgIconColor: Colors.orange.withOpacity(.2),
                leadingIconColor: Colors.orange,
                onTap: () {
                  // Get.toNamed('/space');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: "Notification",
                leadingIcon: Icons.notifications,
                bgIconColor: Colors.blue.withOpacity(.2),
                leadingIconColor: Colors.blue,
                onTap: () {
                  // Get.toNamed('/space');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: "Change Password",
                leadingIcon: Icons.lock,
                bgIconColor: Colors.green.withOpacity(.2),
                leadingIconColor: Colors.green,
                onTap: () {
                  // Get.toNamed('/space');
                },
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   child: Text("Others", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          // ),
          // SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: "Appearance",
                leadingIcon: Icons.dark_mode,
                bgIconColor: darker.withOpacity(.2),
                leadingIconColor: darker,
                onTap: () {
                  // Get.toNamed('/space');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: "Favorites",
                leadingIcon: Icons.favorite,
                bgIconColor: Colors.red.withOpacity(.2),
                leadingIconColor: Colors.red,
                onTap: () {
                  // Get.toNamed('/space');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: "Privacy Policy",
                leadingIcon: Icons.privacy_tip,
                bgIconColor: Colors.grey.withOpacity(.2),
                leadingIconColor: Colors.grey,
                onTap: () {
                  // Get.toNamed('/space');
                },
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: "Log Out",
                leadingIcon: Icons.logout_outlined,
                bgIconColor: Colors.grey.withOpacity(.2),
                leadingIconColor: Colors.red,
                onTap: () {
                  signUserOut();
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
