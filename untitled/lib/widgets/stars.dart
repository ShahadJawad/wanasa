import 'package:flutter/material.dart';
class stars extends StatelessWidget {
   stars({required this.mysizs});
  double mysizs;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(Icons.star,color: Colors.yellow.shade700,size: mysizs,),
        Icon(Icons.star,color: Colors.yellow.shade700,size:mysizs),
        Icon(Icons.star,color: Colors.yellow.shade700,size:mysizs),
        Icon(Icons.star_half_rounded,color: Colors.yellow.shade700,size:mysizs),
        Icon(Icons.star_outline_rounded,color: Colors.yellow.shade700,size:mysizs)
      ],
    );
  }
}
