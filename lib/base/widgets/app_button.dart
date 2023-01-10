import 'package:flutter/material.dart';

import '../styles/app_color.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color? buttonBgColor;
  final Color? disableButtonBgColor;
  final bool loading;
  final bool disabled;
  final double? buttonHeight;
  final double? buttonWidth;
  final double radius;
  final TextStyle? textStyle;
  final TextStyle? disableTextStyle;
  final BorderSide? borderSide;
  final double? elevation;

  const AppButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.buttonBgColor,
    this.disableButtonBgColor,
    this.disabled = false,
    this.loading = false,
    this.buttonHeight = 45,
    this.buttonWidth,
    this.radius = 8,
    this.textStyle,
    this.disableTextStyle,
    this.borderSide,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ?? 40,
      child: MaterialButton(
        elevation: elevation,
        onPressed: disabled ? null : onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: borderSide ?? BorderSide.none,
        ),
        color: buttonBgColor ?? AppColor.primaryColor,
        disabledColor: disableButtonBgColor ?? Colors.grey.shade300,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            disabled
                ? Text(
              text ?? '',
              style: disableTextStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
            )
                : Text(
              text ?? '',
              style: textStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
            ),
            buildLoading(Colors.white)
          ],
        ),
      ),
    );
  }

  Widget buildLoading(Color color) {
    if (!loading) return const SizedBox.shrink();
    return Row(
      children: [
        const SizedBox(width: 8),
        SizedBox(
          width: 14,
          height: 14,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: color,
          ),
        )
      ],
    );
  }
}