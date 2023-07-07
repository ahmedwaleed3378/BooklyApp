import 'package:bookly_app/core/utls/styles.dart';
import 'package:flutter/material.dart';

class BookActionsButton extends StatelessWidget {
  const BookActionsButton({
    super.key,
    required this.backGroundColor,
    required this.radius,
    required this.textColor,
    required this.text, this.onPressed,
  });
  final Color backGroundColor;
  final BorderRadius radius;
  final Color textColor;
  final String text;
  final Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: radius,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.titleStyle18R.copyWith(color: textColor),
          )),
    );
  }
}
