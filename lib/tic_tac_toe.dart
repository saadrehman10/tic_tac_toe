import 'package:flutter/material.dart';
import 'widgets.dart';
import 'dart:math';

enum Mark { X, O, empty }

extension StringCaps on String {
  String get captilize => this[0].toUpperCase() + this.substring(1);
}

class TicTacToe extends StatefulWidget {
  final String? playerX, playerO;
  const TicTacToe({this.playerX, this.playerO, super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  Mark currentPlayer = Mark.X, winner = Mark.empty;
  bool isDraw = false;
  List<Mark> boardState = List<Mark>.generate(9, (index) => Mark.empty);
  int drawCounter = 0, playerX = 0, playerO = 0;

  String _playerXname() {
    if (widget.playerX != "") {
      return widget.playerX!.captilize + " X";
    } else {
      return 'Player X';
    }
  }

  String _playerOname() {
    if (widget.playerO != "") {
      return widget.playerO!.captilize + " O";
    } else {
      return 'Player O';
    }
  }

  void _changeState(int index) {
    setState(() {
      if (boardState[index] == Mark.empty) {
        if (currentPlayer == Mark.X) {
          boardState[index] = Mark.X;
          currentPlayer = Mark.O;
        } else if (currentPlayer == Mark.O) {
          boardState[index] = Mark.O;
          currentPlayer = Mark.X;
        }
      } else {
        boardState[index] == Mark.empty;
      }
    });
  }

  void _checkIsDraw() {
    setState(() {
      bool allboxes = boardState.every((element) => element != Mark.empty);
      if (allboxes && winner == Mark.empty) {
        isDraw = true;
        drawCounter++;
      } else {
        isDraw = false;
      }
    });
  }

  void _resetState() {
    setState(() {
      boardState = List<Mark>.generate(9, (index) => Mark.empty);
      currentPlayer = Mark.X;
      isDraw = false;
      winner = Mark.empty;
    });
  }

  Icon? markIcon(state) {
    if (state == Mark.X) {
      return const Icon(Icons.clear, size: 80, color: Colors.white);
    } else if (state == Mark.O) {
      return const Icon(Icons.circle_outlined, size: 80, color: Colors.white);
    } else {
      return null;
    }
  }

  String _bannerText() {
    if (winner == Mark.O) {
      return 'Winner\n${_playerOname()}';
    } else if (winner == Mark.X) {
      return 'Winner\n${_playerXname()}';
    } else {
      return 'D R A W';
    }
  }

  bool _checkWinner(player) {
    if (boardState[0] == player &&
        boardState[4] == player &&
        boardState[8] == player) {
      return true;
    }
    if (boardState[2] == player &&
        boardState[4] == player &&
        boardState[6] == player) {
      return true;
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i * 3] == player &&
          boardState[i * 3 + 1] == player &&
          boardState[i * 3 + 2] == player) {
        return true;
      }
      if (boardState[i] == player &&
          boardState[i + 3] == player &&
          boardState[i + 6] == player) {
        return true;
      }
    }

    return false;
  }

  void _winupdate() {
    currentPlayer != Mark.empty
        ? currentPlayer == Mark.X
            ? playerO++
            : playerX++
        : null;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        title: const Text(
          'T I C  T A C  T O E',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: currentPlayer == Mark.X && isDraw == false
                            ? Colors.green
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: screenHeight * 0.13,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateX(pi)
                          ..rotateY(pi),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      12.0, 12.0, 0, 0),
                                  child: Text(
                                    'X - W I N S : $playerX',
                                    style: TextStyle(
                                      color: currentPlayer == Mark.X &&
                                              isDraw == false
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: screenWidth * 0.037,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(_playerXname(),
                                style: TextStyle(
                                  fontSize: 40,
                                  color:
                                      currentPlayer == Mark.X && isDraw == false
                                          ? Colors.white
                                          : Colors.black,
                                )),
                          ],
                        ),
                      )),
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenWidth,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 40, 40, 40),
                          borderRadius: BorderRadius.circular(8)),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
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
                                _checkWinner(currentPlayer)
                                    ? winner = currentPlayer
                                    : null;
                                _changeState(index);
                                _checkIsDraw();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: Colors.black,
                              child: Center(
                                child: markIcon(boardState[index]),
                              ),
                            );
                          }),
                    ),
                    Visibility(
                      visible: isDraw || winner != Mark.empty,
                      child: BannerDisplayed(
                        textDisplayed: _bannerText(),
                        height: screenWidth,
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: currentPlayer == Mark.O && isDraw == false
                          ? Colors.green
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: screenHeight * 0.13,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                              child: Text(
                                ' W I N S : $playerO',
                                style: TextStyle(
                                  color:
                                      currentPlayer == Mark.O && isDraw == false
                                          ? Colors.white
                                          : Colors.black,
                                  fontSize: screenWidth * 0.037,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(_playerOname(),
                            style: TextStyle(
                              fontSize: 40,
                              color: currentPlayer == Mark.O && isDraw == false
                                  ? Colors.white
                                  : Colors.black,
                            )),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: drawCounter != 0,
                        child: Text(
                          "DRAW COUNT: $drawCounter",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.02),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _winupdate();
                            _resetState();
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 23, 23, 23),
                            padding: const EdgeInsets.all(10),
                          ),
                          icon: Icon(Icons.loop,
                              size: screenHeight * 0.028, color: Colors.white)),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
