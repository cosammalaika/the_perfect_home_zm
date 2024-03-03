// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/screens/property_detail.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/utils/data.dart';
import 'package:the_perfect_home_zm/widgets/category_item.dart';
import 'package:the_perfect_home_zm/widgets/custom_textbox.dart';
import 'package:the_perfect_home_zm/widgets/property_item.dart';
import 'package:the_perfect_home_zm/widgets/icon_box.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({Key? key}) : super(key: key);

  @override
  _PropertyPageState createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
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
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Properties",
          style: TextStyle(
              color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // IconBox(child: Icon(Icons.search, color: Colors.white,), bgColor: primary.withOpacity(.8),)
      ],
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Row(
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
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          listCategories(),
          const SizedBox(
            height: 20,
          ),
          listProperties(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  int selectedCategory = 0;
  listCategories() {
    List<Widget> lists = List.generate(
        categories.length,
        (index) => CategoryItem(
              data: categories[index],
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

  listProperties() {
    return Column(
      children: List.generate(
          properties.length,
          (index) => PropertyItem(
              data: properties[index],
              index: index,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PropertyDetail(
                              data: properties[index],
                            )));
              },
              onFavoriteTap: () {
                setState(() {
                  properties[index]["is_favorited"] =
                      !properties[index]["is_favorited"];
                });
              })),
    );
  }
}
