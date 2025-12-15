import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xo_game/widgets/xo_button.dart';
import 'package:xo_game/utils/app_color.dart';
import 'package:xo_game/utils/app_textStyle.dart';

class GameBoard extends StatefulWidget {
  static const routeName = "game_board";
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int counter = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }
  late String firstPlayer;
  late String secondPlayer;
  @override
  Widget build(BuildContext context) {
    firstPlayer = ModalRoute.of(context)!.settings.arguments as String;
    secondPlayer = firstPlayer == "x" ? "o" : "x";
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.lightBlue, AppColor.blue],
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(height: 25),
              buildTimer(),
              SizedBox(height: 32),
              buildTextPlayerTurn(),
              SizedBox(height: 24),
              buildGameGrid(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimer() => Container(
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(44),
    ),
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 16),
    padding: EdgeInsets.symmetric(vertical: 18.5),
    child: Text(
      timerFormat(),
      textAlign: TextAlign.center,
      style: AppTextStyle.black32SemiBold,
    ),
  );
  Widget buildTextPlayerTurn() => Text(
    "Player ${counter % 2 == 0 ? "1's" : "2's"} Turn",
    style: AppTextStyle.white36Bold,
  );

  Widget buildGameGrid() => Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(44),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      XoButton(
                        symbol: board[0],
                        onClick: onPlayerClick,
                        buttonIndex: 0,
                      ),
                      XoButton(
                        symbol: board[1],
                        onClick: onPlayerClick,
                        buttonIndex: 1,
                      ),
                      XoButton(
                        symbol: board[2],
                        onClick: onPlayerClick,
                        buttonIndex: 2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      XoButton(
                        symbol: board[3],
                        onClick: onPlayerClick,
                        buttonIndex: 3,
                      ),
                      XoButton(
                        symbol: board[4],
                        onClick: onPlayerClick,
                        buttonIndex: 4,
                      ),
                      XoButton(
                        symbol: board[5],
                        onClick: onPlayerClick,
                        buttonIndex: 5,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      XoButton(
                        symbol: board[6],
                        onClick: onPlayerClick,
                        buttonIndex: 6,
                      ),
                      XoButton(
                        symbol: board[7],
                        onClick: onPlayerClick,
                        buttonIndex: 7,
                      ),
                      XoButton(
                        symbol: board[8],
                        onClick: onPlayerClick,
                        buttonIndex: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(vertical: 22.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalDivider(thickness: 1, color: AppColor.black),
                VerticalDivider(thickness: 1, color: AppColor.black),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Divider(thickness: 1, color: AppColor.black),
                Divider(thickness: 1, color: AppColor.black),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  void onPlayerClick(int buttonIndex) {
    if (board[buttonIndex].isNotEmpty) return;
    board[buttonIndex] = counter % 2 == 0 ? firstPlayer : secondPlayer;
    if (checkWinner() || counter == 8) {
      clearBoard();
      return;
    }
    counter++;
    setState(() {});
  }
  void clearBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }

  bool checkWinner() {
    String sympol = counter % 2 == 0 ? "0" : "x";
    if (board[0] == sympol && board[1] == sympol && board[2] == sympol) {
      return true;
    }
    if (board[3] == sympol && board[4] == sympol && board[5] == sympol) {
      return true;
    }
    if (board[6] == sympol && board[7] == sympol && board[8] == sympol) {
      return true;
    }
    if (board[0] == sympol && board[3] == sympol && board[6] == sympol) {
      return true;
    }
    if (board[1] == sympol && board[4] == sympol && board[7] == sympol) {
      return true;
    }
    if (board[2] == sympol && board[5] == sympol && board[8] == sympol) {
      return true;
    }
    if (board[0] == sympol && board[4] == sympol && board[8] == sympol) {
      return true;
    }
    if (board[2] == sympol && board[4] == sympol && board[6] == sympol) {
      return true;
    }
    return false;
  }

  String timerFormat() {
    int seconds = timer.tick;
    int mints = seconds ~/ 60;
    int remainingSeconds = seconds - mints * 60;
    return "${mints < 10 ? "0$mints" : mints}:${remainingSeconds < 10 ? "0$remainingSeconds" : remainingSeconds}";
  }
}
