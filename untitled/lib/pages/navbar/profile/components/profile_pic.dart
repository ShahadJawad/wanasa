import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assest/images/person.jpg"),
          ),
          Positioned(
            right: -5,
            bottom: 3,
            child: SizedBox(
              height: 40,
              width: 40,
              child: InkWell(
                onTap: () {},

                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.camera,
                  color: kPrimaryColor,
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
