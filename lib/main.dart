import 'package:flutter/material.dart';
import 'package:xo_game/screens/game_board.dart';
import 'package:xo_game/screens/xo_intro.dart';
//hello world!

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameBoard.routeName:(context)=>GameBoard(),
        XoIntro.routeName:(context)=>XoIntro()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: XoIntro.routeName,
    );
  }
}
//master test commit
//
//
///
