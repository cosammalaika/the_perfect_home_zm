// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/utils/data.dart';
import 'package:the_perfect_home_zm/widgets/chat_item.dart';
import 'package:the_perfect_home_zm/widgets/icon_box.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
            "Chats",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          IconBox(
              child: Icon(
                Icons.search,
                color: darker,
              ),
              bgColor: appBgColor)
        ],
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getChats(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  getChats() {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        children: List.generate(
            chats.length,
            (index) => ChatItem(
                  chats[index],
                  onTap: () {},
                )));
  }
}
