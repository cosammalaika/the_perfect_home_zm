import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/widgets/favorite_box.dart';
import 'custom_image.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem(
      {Key? key,
      required this.data,
      this.onTap,
      this.onFavoriteTap,
      this.index = 0})
      : super(key: key);
  final data;
  final int index;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: index % 2 == 0
              ? const EdgeInsets.only(left: 10)
              : const EdgeInsets.only(right: 10),
          child: Container(
            child: Row(
              children: [
                if (index % 2 == 0)
                  Hero(
                    tag: data["id"],
                    child: CustomImage(
                      data["image"],
                      width: 150,
                      height: 120,
                      radius: 15,
                    ),
                  ),
                Expanded(
                  child: Container(
                    height: 90,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.08),
                          spreadRadius: .5,
                          blurRadius: .5,
                          offset: const Offset(2, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["name"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.place_outlined,
                              size: 13,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Expanded(
                                child: Text(
                              data["location"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Text(data["price"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: primary,
                                    ))),
                            FavoriteBox(
                              isFavorited: data["is_favorited"],
                              size: 15,
                              onTap: onFavoriteTap,
                            )
                            // Icon(data["is_favorited"] ? Icons.favorite : Icons.favorite_border, color: data["is_favorited"] ? Colors.red : Colors.black, size: 22,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (index % 2 != 0)
                  Hero(
                    tag: data["id"],
                    child: CustomImage(
                      data["image"],
                      width: 150,
                      height: 120,
                      radius: 15,
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
