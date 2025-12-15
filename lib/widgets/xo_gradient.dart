import 'package:flutter/material.dart';

import '../utils/app_color.dart';
class XoGradient extends StatelessWidget {
  final Widget body;
  const XoGradient({
    super.key,
    required this.body
  });

  @override
  Widget build(BuildContext context) {
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
            body: body
        ),
      ),
    );
  }
}
