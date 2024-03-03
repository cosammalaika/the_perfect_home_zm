// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/utils/constant.dart';
import 'package:the_perfect_home_zm/utils/data.dart';
import 'package:the_perfect_home_zm/widgets/custom_button.dart';
import 'package:the_perfect_home_zm/widgets/custom_image.dart';
import 'package:the_perfect_home_zm/widgets/facility_box.dart';
import 'package:the_perfect_home_zm/widgets/favorite_box.dart';
import 'package:the_perfect_home_zm/widgets/icon_box.dart';

class PropertyDetail extends StatefulWidget {
  const PropertyDetail({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  _PropertyDetailState createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail> {
  var data;
  bool showBody = false;
  @override
  void initState() {
    super.initState();

    data = widget.data;
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        showBody = true;
      });
    });
  }

  animatedBody() {
    return AnimatedCrossFade(
        firstChild: getBody(),
        secondChild: Container(),
        crossFadeState:
            showBody ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: ANIMATED_BODY_MS));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: animatedBody(),
    );
  }

  getStack() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 370,
      child: Stack(
        children: [
          CustomImage(
            data["image"],
            width: MediaQuery.of(context).size.width,
            height: 310,
            radius: 0,
            isShadow: false,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBox(
                    child:  const Icon(
                      Icons.arrow_back_ios_new,
                      color: darker,
                      size: 20,
                    ),
                    bgColor: Colors.white.withOpacity(.7),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 240,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: FavoriteBox(
                isFavorited: data["is_favorited"],
                onTap: () {
                  setState(() {
                    data["is_favorited"] = !data["is_favorited"];
                  });
                },
              ),
              // child: IconBox(
              //   child: Icon(data["is_favorited"] ? Icons.favorite : Icons.favorite_border,
              //   color: Colors.white, size: 20,), bgColor: red.withOpacity(.8),
              //   onTap: (){
              //     setState(() {
              //       data["is_favorited"] = !data["is_favorited"];
              //     });
              //   },
              // )
            ),
          ),
          Positioned(
            top: 290,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: appBgColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data["name"],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          data["price"],
                          style: const TextStyle(
                              fontSize: 17,
                              color: primary,
                              fontWeight: FontWeight.w600),
                        )
                      ],
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
                  ],
                )),
          ),
        ],
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          getStack(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listFacilities(),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  data["description"],
                  style: const TextStyle(height: 1.5, color: darker),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: getOwerBox()),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  listFacilities() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: [
        FacilityBox(
          info: "4 Bedrooms",
          icon: Icons.bed,
          bgColor: primary.withOpacity(.1),
        ),
        FacilityBox(
          info: "5 Bathrooms",
          icon: Icons.bathroom,
          bgColor: primary.withOpacity(.1),
        ),
        FacilityBox(
          info: "2 Kitchens",
          icon: Icons.kitchen,
          bgColor: primary.withOpacity(.1),
        ),
        FacilityBox(
          info: "1 Garage",
          icon: Icons.garage,
          bgColor: primary.withOpacity(.1),
        )
      ]),
    );
  }

  getOwerBox() {
    return Container(
      padding: const EdgeInsets.all(10),
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
        children: [
          Row(
            children: [
              CustomImage(
                profile,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Malaika Cosam",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Property Owner",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    height: 40,
                    bgColor: Colors.white,
                    title: "Get Schedule",
                    fsize: 13,
                    textColor: Colors.black,
                    onTap: () {}),
              ),
              const SizedBox(
                width: 10,
              ),
              CustomButton(
                  width: 120,
                  height: 40,
                  bgColor: secondary,
                  icon: Icons.call,
                  title: "Call",
                  fsize: 13,
                  onTap: () {})
            ],
          ),
        ],
      ),
    );
  }
}
