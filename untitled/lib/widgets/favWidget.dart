import 'package:flutter/material.dart';

import '../constants.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  bool _isFavorite = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        _controller
            .reverse()
            .then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.7, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
        child: _isFavorite
            ? const Icon(
          Icons.favorite,
          size: 25,
          color: Colors.red,
        )
            :  Icon(
          Icons.favorite_border,
          color: Colors.grey[200],
          size: 22,
        ),
      ),
    );
  }
}









// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyFavWidget extends StatefulWidget {
//   @override
//   _MyFavWidgetState createState() => _MyFavWidgetState();
// }
//
// class _MyFavWidgetState extends State<MyFavWidget> {
//    //bool isPressed = true;
//   bool isPressed2 = true;
//   bool isHighlighted = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: InkWell(
//           highlightColor: Colors.transparent,
//           splashColor: Colors.transparent,
//           onHighlightChanged: (value) {
//             setState(() {
//               isHighlighted = !isHighlighted;
//             });
//           },
//           onTap: () {
//             setState(() {
//               isPressed2 = !isPressed2;
//             });
//           },
//           child: AnimatedContainer(
//             margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
//             height: isHighlighted ? 50 : 45,
//             width: isHighlighted ? 50 : 45,
//             curve: Curves.fastLinearToSlowEaseIn,
//             duration: Duration(milliseconds: 300),
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   blurRadius: 20,
//                   offset: Offset(5, 10),
//                 ),
//               ],
//                color: Colors.white,
//                shape: BoxShape.circle,
//             ),
//             child: isPressed2
//                 ? Icon(
//               Icons.favorite_border,
//               color: Colors.black.withOpacity(0.6),
//             )
//                 : Icon(
//               Icons.favorite,
//               color: Colors.red.withOpacity(1.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }