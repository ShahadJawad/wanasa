import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePicS extends GetWidget {
  final Image img;
  final double ImgRadius;
  final double IconRadius;
  final Icon myIcon;
  final Color myColor;
  final PosR;
  const ProfilePicS(
      {required this.img,
        required this.ImgRadius,
        required this.IconRadius,
        required this.myIcon,
        required this.myColor,
        this.PosR});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: ImgRadius,
            child: img,
          ),
          //icon
          Positioned(
            right: PosR,
            bottom: 0,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                  radius: IconRadius, backgroundColor: myColor, child: myIcon),
            ),
          ),
        ],
      ),
    );
  }
}
