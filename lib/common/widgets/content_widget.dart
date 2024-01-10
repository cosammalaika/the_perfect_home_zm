// content_widget.dart

import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  final double paddingFactor;
  final String title;
  final String description;

  const ContentWidget(this.paddingFactor, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 6 * paddingFactor),
          constraints: BoxConstraints(maxWidth: 742 * paddingFactor),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25 * paddingFactor,
                fontWeight: FontWeight.w500,
                height: 1.6 * paddingFactor,
                letterSpacing: 0.75 * paddingFactor,
                color: const Color(0xff4d4d4d),
              ),
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25 * paddingFactor,
                    fontWeight: FontWeight.w500,
                    height: 1.6 * paddingFactor,
                    letterSpacing: 0.75 * paddingFactor,
                    color: const Color(0xff4d4d4d),
                  ),
                ),
                TextSpan(
                  text: description,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25 * paddingFactor,
                    fontWeight: FontWeight.w800,
                    height: 1.6 * paddingFactor,
                    letterSpacing: 0.75 * paddingFactor,
                    color: const Color(0xfff55422),
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25 * paddingFactor,
                    fontWeight: FontWeight.w500,
                    height: 1.6 * paddingFactor,
                    letterSpacing: 0.75 * paddingFactor,
                    color: const Color(0xfff55422),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 227 * paddingFactor),
          child: Text(
            '',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12 * paddingFactor,
              fontWeight: FontWeight.w400,
              height: 5 * paddingFactor,
              letterSpacing: 0.36 * paddingFactor,
              color: const Color(0xff292929),
            ),
          ),
        ),
      ],
    );
  }
}
