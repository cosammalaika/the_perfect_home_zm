// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/utils/data.dart';
import 'package:the_perfect_home_zm/widgets/agent_item.dart';
import 'package:the_perfect_home_zm/widgets/company_item.dart';
import 'package:the_perfect_home_zm/widgets/custom_textbox.dart';
import 'package:the_perfect_home_zm/widgets/icon_box.dart';
import 'package:the_perfect_home_zm/widgets/recommend_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: getHeader(),
        ),
        SliverToBoxAdapter(child: getBody())
      ],
    );
  }

  getHeader() {
    return const Row(
      children: [
        Expanded(
            child: CustomTextBox(
          hint: "Search",
          prefix: Icon(Icons.search, color: Colors.grey),
        )),
        SizedBox(
          width: 10,
        ),
        IconBox(
          bgColor: secondary,
          radius: 10,
          child: Icon(Icons.filter_list_rounded, color: Colors.white),
        )
      ],
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
      ),
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: const Text(
          "Matched Properties",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      listRecommended(),
      const SizedBox(
        height: 20,
      ),
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: const Text(
          "Companies",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      listCompanies(),
      const SizedBox(
        height: 20,
      ),
      listAgents(),
      const SizedBox(
        height: 100,
      ),
    ]));
  }

  listRecommended() {
    List<Widget> lists = List.generate(
        recommended.length, (index) => RecommendItem(data: recommended[index]));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  int selectedCategory = 0;
  listCompanies() {
    List<Widget> lists = List.generate(
        companies.length,
        (index) => CompanyItem(
              data: companies[index],
              color: listColors[index % 10],
              selected: index == selectedCategory,
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },
            ));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  listAgents() {
    List<Widget> lists =
        List.generate(agents.length, (index) => AgentItem(data: agents[index]));

    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      child: Column(children: lists),
    );
  }
}
