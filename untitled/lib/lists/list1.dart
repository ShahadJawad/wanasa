import 'package:flutter/material.dart';

import '../constants.dart';

class puplicplice {
  String myimage ;
  puplicplice({
    required this.myimage
});
}
class nameplaces {
   String name ;

   nameplaces({
     required this.name
});
}

List<puplicplice> imagelist =[
  puplicplice(myimage:'assest/images/img1.jpg'),
  puplicplice(myimage: 'assest/images/img2.jpg'),
  puplicplice(myimage: 'assest/images/img3.jpg'),
  puplicplice(myimage: 'assest/images/img4.jpg'),
  puplicplice(myimage: 'assest/images/img5.jpg'),


];


List<puplicplice> imagelist2 =[
  puplicplice(myimage: 'assest/images/img4.jpg'),
  puplicplice(myimage: 'assest/images/img3.jpg'),
  puplicplice(myimage: 'assest/images/img5.jpg'),
 puplicplice(myimage:'assest/images/img1.jpg'),
  puplicplice(myimage: 'assest/images/img2.jpg'),



];



// تصنبفات

class category {
  String name ;
  Icon icon;
  category({
    required this.name,
    required this.icon

  });
}

List<category> mycategorylist =[
  category(name: 'ترفيهيه ',
      icon:const Icon(Icons.sunny,
        color: kPrimaryColor,
        size: 20,
      )),

  category(name: 'فن وثقافه',
      icon: const Icon(Icons.color_lens_outlined,
          color: kPrimaryColor,
          size: 20,
      )),

  category(name: 'متاحف',
      icon:const Icon(Icons.museum_outlined,
          color: kPrimaryColor,
          size: 20,
      )),

  category(name: 'دينيه',
      icon:const Icon(Icons.museum_outlined,
        color: kPrimaryColor,
        size: 20,
      )),

  category(name: 'مناسب للاطفال',
      icon: const Icon(Icons.face,
          color: kPrimaryColor,
         size: 20,
      ),),


];