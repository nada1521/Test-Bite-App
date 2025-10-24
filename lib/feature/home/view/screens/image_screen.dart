import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Image.network(
        image,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
