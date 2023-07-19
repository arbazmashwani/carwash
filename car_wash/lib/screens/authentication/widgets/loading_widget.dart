import 'package:car_wash/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final double size;

  LoadingWidget({this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        color: themecolorDarkBlue,
        size: size,
      ),
    );
  }
}

showloadingwidget(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: LoadingWidget(),
        );
      });
}
