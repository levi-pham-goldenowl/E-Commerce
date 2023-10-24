import 'package:flutter/material.dart';

class TopImages extends StatelessWidget {
  final String urlImage;
  const TopImages({Key? key, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 413,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Image(
                image: NetworkImage(urlImage),
              ),
            );
          },
          itemCount: 3,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal),
    );
  }
}
