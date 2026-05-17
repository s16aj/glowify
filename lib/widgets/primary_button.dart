import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final double elevation;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final MainAxisAlignment contentAlignment;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 14,
    this.elevation = 0,
    this.width,
    this.height = 55,
    this.padding,
    this.leading,
    this.contentAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: elevation,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: leading == null
            ? Text(text, style: textStyle)
            : Row(
                mainAxisAlignment: contentAlignment,
                children: [
                  leading!,
                  const SizedBox(width: 12),
                  Text(text, style: textStyle),
                ],
              ),
      ),
    );
  }
}
