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
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      gapPadding: 2,
                      borderSide: BorderSide(
                        color:Colors.white,
                        strokeAlign: 4,
                        style: BorderStyle.solid,
                        width: 2,
                      ))),
              autofillHints: ['Defaut Player X'],
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
