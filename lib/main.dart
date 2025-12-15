import 'package:flutter/material.dart';
import 'package:xo_game/screens/game_board.dart';
import 'package:xo_game/screens/xo_intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameBoard.routeName: (context) => GameBoard(),
        XoIntro.routeName: (context) => XoIntro(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: XoIntro.routeName,
    );
  }
}
//new command called reverse
//reverse: is undo changes made by specific commit
//push: upload your local commits to remote repository
//pull: download changes from remote to local repository
//Pull Request : when you work in team you edit in side branch and push it from local to remote
//and make pull request to merge this side branch to main branch
