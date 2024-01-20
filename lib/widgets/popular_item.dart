import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/widgets/favorite_box.dart';
import 'custom_image.dart';

class PopularItem extends StatelessWidget {
  PopularItem({Key? key, required this.data, this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 240,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImage(
              data["image"],
              radius: 25,
              width: double.infinity,
              height: 150,
            ),
            Positioned(
              right: 20,
              top: 130,
              child: FavoriteBox(
                isFavorited: data["is_favorited"],
              ),
            ),
            Positioned(
                left: 15,
                top: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.place_outlined,
                          color: darker,
                          size: 13,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          data["location"],
                          style: const TextStyle(fontSize: 13, color: darker),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data["price"],
                      style: const TextStyle(
                          fontSize: 15,
                          color: primary,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
