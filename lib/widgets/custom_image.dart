import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
    this.name, {
    Key? key,
    this.width = 100,
    this.height = 100,
    this.bgColor,
    this.borderWidth = 0,
    this.borderColor,
    this.trBackground = false,
    this.isNetwork = true,
    this.radius = 50,
    this.isShadow = true,
    this.onViewOrUpdateProfilePic, // Callback function for view or update profile picture
  }) : super(key: key);

  final String name;
  final double width;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final VoidCallback? onViewOrUpdateProfilePic; // Callback function for view or update profile picture

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewOrUpdateProfilePic, // Invoke the callback function when tapped
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            if (isShadow)
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
          ],
          image: DecorationImage(image: NetworkImage(name), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
