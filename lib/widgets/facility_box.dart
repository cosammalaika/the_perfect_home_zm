import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';

class FacilityBox extends StatelessWidget {
  const FacilityBox(
      {Key? key,
      required this.info,
      this.icon = Icons.star,
      this.bgColor = Colors.white,
      this.color = primary})
      : super(key: key);
  final IconData icon;
  final String info;
  final Color bgColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.01),
            spreadRadius: .5,
            blurRadius: .5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color.withOpacity(.2)),
          child: Icon(icon, color: color),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          info,
          maxLines: 1,
          style: const TextStyle(fontSize: 13),
        ),
      ]),
    );
  }
}
