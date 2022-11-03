import 'package:flutter/material.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            spreadRadius: 0.0,
            color: Colors.grey.shade300,
            blurRadius: 3.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network('https://googleflutter.com/sample_image.jpg'),
      ),
    );
  }
}