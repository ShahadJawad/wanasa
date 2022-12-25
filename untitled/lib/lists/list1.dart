import 'package:flutter/material.dart';

class puplicplice {
  String myimage ;
  puplicplice({
    required this.myimage
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
  category(name: 'انشطه في الهواء ',icon: Icon(Icons.sunny)),
  category(name: 'فن وثقافه',icon:  Icon(Icons.color_lens_outlined)),
  category(name: 'متاحف',icon: Icon(Icons.museum_outlined) ),
  category(name: 'مناسب للاطفال',icon: Icon(Icons.face) ),


];