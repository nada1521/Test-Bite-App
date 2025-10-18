import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Image.network(
        image,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}