// ignore: must_be_immutable
import 'package:flutter/material.dart';

enum Mark { X, O, empty }

// ignore: must_be_immutable
class TileState extends StatelessWidget {
  Mark state;
  TileState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    if (state == Mark.empty) {
      return const Icon(Icons.new_label, size: 0);
    } else if (state == Mark.X) {
      return const Icon(Icons.clear, size: 50, color: Colors.white);
    } else if (state == Mark.O) {
      return const Icon(Icons.circle_outlined, size: 50, color: Colors.white);
    } else {
      return const Placeholder();
    }
  }
}
