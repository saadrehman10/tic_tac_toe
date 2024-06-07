// ignore: must_be_immutable
import 'package:flutter/material.dart';

enum Mark { X, O, empty }

class BannerDisplayed extends StatelessWidget {
  final String textDisplayed;
  const BannerDisplayed({required this.textDisplayed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 401,
      width: 401,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Text(textDisplayed,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60,
          )),
    );
  }
}
