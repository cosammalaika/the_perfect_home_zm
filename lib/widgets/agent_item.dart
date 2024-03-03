// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'custom_image.dart';

class AgentItem extends StatelessWidget {
  const AgentItem({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: .5,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomImage(
                data["image"],
                width: 35,
                height: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["name"],
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    data["type"],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data["description"],
            style: const TextStyle(height: 1.5, color: darker),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: yellow,
              ),
              Icon(
                Icons.star,
                size: 16,
                color: yellow,
              ),
              Icon(
                Icons.star,
                size: 16,
                color: yellow,
              ),
              Icon(
                Icons.star,
                size: 16,
                color: yellow,
              ),
              Icon(
                Icons.star_outline,
                size: 16,
                color: yellow,
              ),
            ],
          )
        ],
      ),
    );
  }
}
