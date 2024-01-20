import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';

class FavoriteBox extends StatelessWidget {
  const FavoriteBox(
      {Key? key,
      this.bgColor = red,
      this.onTap,
      this.isFavorited = false,
      this.borderColor = Colors.transparent,
      this.radius = 50,
      this.size = 20})
      : super(key: key);
  final Color borderColor;
  final Color? bgColor;
  final bool isFavorited;
  final double radius;
  final double size;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isFavorited ? bgColor : primary,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Icon(
          isFavorited ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}
