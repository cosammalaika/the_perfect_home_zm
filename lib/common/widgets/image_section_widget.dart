// image_section_widget.dart

import 'package:flutter/material.dart';

class ImageSectionWidget extends StatelessWidget {
  final double paddingFactor;
  final String imagePath;

  const ImageSectionWidget(this.paddingFactor, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          60 * paddingFactor, 390 * paddingFactor, 62 * paddingFactor, 43),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40 * paddingFactor),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16 * paddingFactor),
          Container(
            width: double.infinity,
            height: 54 * paddingFactor,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40 * paddingFactor),
                topRight: Radius.circular(40 * paddingFactor),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 21 * paddingFactor,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 190 * paddingFactor,
                        height: 54 * paddingFactor,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xfff55422),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 97.5 * paddingFactor,
                    top: 15 * paddingFactor,
                    child: Align(
                      child: SizedBox(
                        width: 38 * paddingFactor,
                        height: 20 * paddingFactor,
                        child: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14 * paddingFactor,
                            fontWeight: FontWeight.w700,
                            height: 1.2 * paddingFactor,
                            letterSpacing: 0.48 * paddingFactor,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
