import 'package:flutter/material.dart';

enum Mark { X, O, empty }

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  late String winner, currentPlayer;
  bool isDraw = false;
  List<Mark> boardState = List<Mark>.generate(9, (index) => Mark.empty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'T I C  T A C  T O E',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Player "X"'),
            SizedBox(
              width: 400,
              height: 400,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, index) {
                    return TileState(state: boardState[index]);
                  }),
            ),
            const Text('Player "O"'),
          ]),
    );
  }
}

// ignore: must_be_immutable
class TileState extends StatefulWidget {
  Mark? state;
  TileState({this.state, super.key});

  @override
  State<TileState> createState() => _TileStateState();
}

class _TileStateState extends State<TileState> {
  @override
  Widget build(BuildContext context) {
    if (widget.state == Mark.empty) {
      return MaterialButton(onPressed: () {}, color: Colors.red);
    } else if (widget.state == Mark.X) {
      return MaterialButton(onPressed: () {}, color: Colors.yellow);
    } else if (widget.state == Mark.O) {
      return MaterialButton(onPressed: () {}, color: Colors.orange);
    } else {
      return const Placeholder();
    }
    ;
  }
}
