import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isOutlined;
  final Color bgColor;
  final Color textColor;
  final double borderRadius;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.bgColor = ColorConstraint.buttonColor,
    this.textColor = Colors.white,
    this.borderRadius = 12,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = isOutlined
        ? OutlinedButton.styleFrom(
            foregroundColor: bgColor,
            side: BorderSide(color: bgColor, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            minimumSize: Size(width ?? double.infinity, height ?? 48),
          )
        : ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            minimumSize: Size(width ?? double.infinity, height ?? 48),
          );

    return isOutlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
            ),
          );
  }
}
