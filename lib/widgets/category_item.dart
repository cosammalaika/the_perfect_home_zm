// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.data, this.selected = false, this.onTap})
      : super(key: key);
  final data;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
        margin: const EdgeInsets.only(right: 10),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: selected ? primary : cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: .5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(data["icon"],
                size: 25,
                color: selected ? Colors.white : const Color(0xFF4d4d4d)),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13, color: selected ? Colors.white : darker),
              ),
            ),
            // Visibility(
            //     visible: selected,
            //     child: Container(
            //       width: double.infinity, height: 2,
            //       decoration: BoxDecoration(
            //         color: primary,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
