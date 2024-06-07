import 'package:flutter/material.dart';
import 'dart:math';

enum Mark { X, O, empty }

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  late String winner;
  Mark currentPlayer = Mark.X;
  bool isDraw = false;
  List<Mark> boardState = List<Mark>.generate(9, (index) => Mark.empty);

  void changeState(int index) {
    if (boardState[index] == Mark.empty) {
      if (currentPlayer == Mark.X) {
        boardState[index] = Mark.X;
        currentPlayer = Mark.O;
      } else if (currentPlayer == Mark.O) {
        boardState[index] = Mark.O;
        currentPlayer = Mark.X;
      }
    } else {
      null;
    }
  }

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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color:
                          currentPlayer == Mark.X ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    width: 350,
                    height: 100,
                    child: Text('Player "X"',
                        style: TextStyle(
                          fontSize: 40,
                          color: currentPlayer == Mark.X
                              ? Colors.white
                              : Colors.black,
                        ))),
              ),
              SizedBox(
                width: 400,
                height: 400,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, index) {
                      return MaterialButton(
                        onLongPress: () {
                          setState(() {
                            boardState[index] = Mark.empty;
                          });
                        },
                        onPressed: () {
                          setState(() {
                            changeState(index);
                          });
                        },
                        color: const Color.fromRGBO(212, 212, 212, 1),
                        child: Center(
                          child: TileState(state: boardState[index]),
                        ),
                      );
                    }),
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color:
                          currentPlayer == Mark.O ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    width: 350,
                    height: 100,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateX(pi)
                        ..rotateY(pi),
                      child: Text('Player "O"',
                          style: TextStyle(
                            fontSize: 40,
                            color: currentPlayer == Mark.O
                                ? Colors.white
                                : Colors.black,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            boardState =
                                List<Mark>.generate(9, (index) => Mark.empty);
                            currentPlayer = Mark.X;
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.all(10),
                        ),
                        icon: const Icon(Icons.loop,
                            size: 23, color: Colors.white)),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class TileState extends StatelessWidget {
  Mark? state;
  TileState({this.state, super.key});

  @override
  Widget build(BuildContext context) {
    if (state == Mark.empty) {
      return const Icon(Icons.new_label, size: 0);
    } else if (state == Mark.X) {
      return const Icon(Icons.clear, size: 50);
    } else if (state == Mark.O) {
      return const Icon(Icons.circle_outlined, size: 50);
    } else {
      return const Placeholder();
    }
  }
}
