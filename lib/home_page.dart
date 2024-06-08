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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage("assets/images/app_logo.png"),
                  radius: 60,
                ),
                Text(
                  'Tic Tac Toe',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Players Name",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.clear, size: 65, color: Colors.white),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 6, 0),
                        child: Icon(
                          Icons.circle_outlined,
                          size: 58,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  gapPadding: 20,
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    strokeAlign: 20,
                                    style: BorderStyle.solid,
                                    width: 20,
                                  ))),
                          controller: TextEditingController(text: 'Player O'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 10, 0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/gamepage');
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.all(10)),
                      child: Text(
                        'Start Game',
                        style: TextStyle(fontSize: 22),
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
