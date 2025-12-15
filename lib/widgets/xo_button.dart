import 'package:flutter/material.dart';
import 'package:xo_game/utils/app_assets.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final Function onClick;
  final  int buttonIndex ;

  const XoButton({super.key, required this.onClick, required this.symbol,required this.buttonIndex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onClick(buttonIndex);
        },
        child: symbol.isEmpty
            ? SizedBox(height: double.infinity, width: double.infinity)
            : Container(
                child: symbol == "x"
                    ? Image.asset(AppAssets.icX)
                    : Image.asset(AppAssets.icO),
              ),
      ),
    );
  }
}
