import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _playerXController = TextEditingController();
  final TextEditingController _playerOController = TextEditingController();

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
          child: Form(
            key: _formKey,
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
                        child: TextFormField(
                          controller: _playerXController,
                          decoration: InputDecoration(
                              hintText: 'Default Player X',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(61, 131, 131, 131),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    strokeAlign: 20,
                                    style: BorderStyle.solid,
                                    width: 20,
                                  ))),
                          style: TextStyle(
                              color: const Color.fromARGB(191, 255, 255, 255)),
                          validator: (value) {
                            if (value!.length >= 10) {
                              return 'Name must be less than 10 characters';
                            }
                            return null;
                          },
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
                        child: TextFormField(
                          controller: _playerOController,
                          decoration: InputDecoration(
                              hintText: 'Default Player O',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(61, 131, 131, 131),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    strokeAlign: 20,
                                    style: BorderStyle.solid,
                                    width: 20,
                                  ))),
                          style: TextStyle(
                              color: const Color.fromARGB(191, 255, 255, 255)),
                          validator: (value) {
                            if (value!.length >= 10) {
                              return 'Name must be less than 10 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 10, 0),
                  child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/gamepage');
                        }
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.all(10)),
                      child: Text(
                        'Start Game',
                        style: TextStyle(fontSize: 22),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
