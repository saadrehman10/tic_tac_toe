import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/home_page.dart';
import 'package:tic_tac_toe/tic_tac_toe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      home: MyHomePage(),
      routes: {
        
        '/gamepage': (context) => const TicTacToe(),
      },
    );
  }
}
