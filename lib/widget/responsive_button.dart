import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widget/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  // String? text;

  ResponsiveButton({
    Key? key,
    this.width = 120,
    // this.text,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? AppText(text: 'Book Trip Now', color: Colors.white)
                : Container(),
            Image.asset('img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
