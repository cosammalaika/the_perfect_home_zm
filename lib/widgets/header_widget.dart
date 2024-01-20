// header_widget.dart

import 'dart:ui';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final double paddingFactor;

  const HeaderWidget(this.paddingFactor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(0, 0, 14 * paddingFactor, 30.59 * paddingFactor),
      width: double.infinity,
      height: 74.41 * paddingFactor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 175.98 * paddingFactor, 0),
            width: 80.02 * paddingFactor,
            height: 80.41 * paddingFactor,
            child: Image.asset(
              'assets/images/Light.png',
              width: 79.02 * paddingFactor,
              height: 74.41 * paddingFactor,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                0, 18 * paddingFactor, 0, 18.41 * paddingFactor),
            width: 86 * paddingFactor,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100 * paddingFactor),
            ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 6 * paddingFactor,
                  sigmaY: 6 * paddingFactor,
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xfff55422),
                    borderRadius: BorderRadius.circular(100 * paddingFactor),
                  ),
                  child: Center(
                    child: Text(
                      'skip',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12 * paddingFactor,
                        fontWeight: FontWeight.w400,
                        height: 1.8333333333 * paddingFactor,
                        letterSpacing: 0.36 * paddingFactor,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
