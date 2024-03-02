import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/screens/auth/auth_page.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/utils/data.dart';
import 'package:the_perfect_home_zm/utils/user_service.dart';
import 'package:the_perfect_home_zm/widgets/custom_image.dart';
import 'package:the_perfect_home_zm/widgets/setting_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late User user;
  String userName = UserProvider.userName; // Use userName from UserProvider

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
    UserProvider.fetchUserName().then((name) {
      setState(() {
        userName = name;
      });
    }).catchError((error) {
      print("Error fetching user name: $error");
      setState(() {
        userName = "Error"; // Display an error message
      });
    });
  }

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
          title: _getHeader(),
        ),
        SliverToBoxAdapter(child: _getBody())
      ],
    );
  }

  Widget _getHeader() {
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

  Widget _getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
              const SizedBox(height: 10),
              Text(
                userName.isNotEmpty ? userName : 'Loading...',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSettingsContainer(),
          const SizedBox(height: 20),
          _buildOthersContainer(),
          const SizedBox(height: 20),
          _buildLogOutContainer(),
        ],
      ),
    );
  }

  Widget _buildSettingsContainer() {
    return Container(
      padding: const EdgeInsets.all(15),
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
      child: Column(
        children: [
          _buildSettingItem("Profile", Icons.person,
              Colors.orange.withOpacity(.2), Colors.orange),
          _buildDivider(),
          _buildSettingItem("Notification", Icons.notifications,
              Colors.blue.withOpacity(.2), Colors.blue),
          _buildDivider(),
          _buildSettingItem("Change Password", Icons.lock,
              Colors.green.withOpacity(.2), Colors.green),
        ],
      ),
    );
  }

  Widget _buildOthersContainer() {
    return Container(
      padding: const EdgeInsets.all(15),
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
      child: Column(
        children: [
          _buildSettingItem(
              "Appearance", Icons.dark_mode, darker.withOpacity(.2), darker),
          _buildDivider(),
          _buildSettingItem("Favorites", Icons.favorite,
              Colors.red.withOpacity(.2), Colors.red),
          _buildDivider(),
          _buildSettingItem("Privacy Policy", Icons.privacy_tip,
              Colors.grey.withOpacity(.2), Colors.grey),
        ],
      ),
    );
  }

  Widget _buildLogOutContainer() {
    return Container(
      padding: const EdgeInsets.all(15),
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
      child: Column(
        children: [
          _buildSettingItem("Log Out", Icons.logout_outlined,
              Colors.grey.withOpacity(.2), Colors.red,
              onTap: signUserOut),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData leadingIcon,
      Color bgIconColor, Color leadingIconColor,
      {VoidCallback? onTap}) {
    return SettingItem(
      title: title,
      leadingIcon: leadingIcon,
      bgIconColor: bgIconColor,
      leadingIconColor: leadingIconColor,
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 45),
      child: Divider(
        height: 0,
        color: Colors.grey.withOpacity(0.8),
      ),
    );
  }
}
