import 'dart:ui';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingFactor = 1.0; // Adjust the value as needed

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50 * paddingFactor),
            ),
            child: Column(
              children: [
                _buildHeader(paddingFactor),
                _buildContent(paddingFactor),
                _buildImageSection(paddingFactor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double paddingFactor) {
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

  Widget _buildContent(double paddingFactor) {
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
                  text: 'Find best place \nto stay in',
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
                  text: ' good price',
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

  Widget _buildImageSection(double paddingFactor) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          60 * paddingFactor, 390 * paddingFactor, 62 * paddingFactor, 43),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40 * paddingFactor),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/splash.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16 * paddingFactor), // Add some spacing here
          Container(
            width: double.infinity,
            height: 54 * paddingFactor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10 * paddingFactor),
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
                          borderRadius:
                              BorderRadius.circular(10 * paddingFactor),
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
                        'Next\n',
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
        ],
      ),
    );
  }
}
