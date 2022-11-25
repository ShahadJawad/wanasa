import 'package:flutter/material.dart';

class detailsPublicPage extends StatefulWidget {
  const detailsPublicPage({Key? key}) : super(key: key);

  @override
  State<detailsPublicPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPublicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('details')),
    );
  }
}
