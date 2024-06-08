import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Player"),
                  Icon(Icons.clear, size: 20, color: Colors.white),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              gapPadding: 20,
                              borderSide: BorderSide(
                                color: Colors.white,
                                strokeAlign: 20,
                                style: BorderStyle.solid,
                                width: 20,
                              ))),
                      controller: TextEditingController(text: 'Player X'),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      gapPadding: 20,
                      borderSide: BorderSide(
                        color: Colors.white,
                        strokeAlign: 20,
                        style: BorderStyle.solid,
                        width: 20,
                      ))),
              controller: TextEditingController(text: 'Player O'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gamepage');
                },
                child: Text('Start Game')),
          ]),
    );
  }
}
