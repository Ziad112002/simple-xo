import 'package:flutter/material.dart';
import 'package:xo_game/screens/game_board.dart';
import 'package:xo_game/utils/app_assets.dart';
import 'package:xo_game/utils/app_textStyle.dart';
import 'package:xo_game/widgets/xo_gradient.dart';

import '../utils/app_color.dart';

class XoIntro extends StatelessWidget {
  static const routeName = "xo_intro";
  const XoIntro({super.key});
  @override
  Widget build(BuildContext context) {
    return XoGradient(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 264,
              bottom: 203,
              left: 65,
              right: 66,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.introBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Text("Tix-Tac-Toe", style: AppTextStyle.white40Bold),
            ),
          ),
          SizedBox(height: 60),
          Text('Pick who goes first?', style: AppTextStyle.white24Medium),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSymbolContainer(AppAssets.icX,context,"x"),
              buildSymbolContainer(AppAssets.icO,context,"o")
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSymbolContainer(String asset,BuildContext context,String symbol) => InkWell(
    onTap:(){
      Navigator.pushNamed(context, GameBoard.routeName,arguments:symbol );
    } ,
    child: Container(
      padding: EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Image(image: AssetImage(asset)),
    ),
  );
}
