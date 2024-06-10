// ignore: must_be_immutable
import 'package:flutter/material.dart';

enum Mark { X, O, empty }

class BannerDisplayed extends StatelessWidget {
  final String textDisplayed;
  final double height;
  const BannerDisplayed(
      {required this.height, required this.textDisplayed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Text(textDisplayed,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
            fontSize: height * 0.16,
          )),
    );
  }
}
