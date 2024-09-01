import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTapButton,
    this.textButton,
    this.child,
    this.width,
    this.radius,
    this.color,
  });
  final Widget? textButton;
  final Widget? child;
  final double? width;
  final BorderRadiusGeometry? radius;
  final void Function()? onTapButton;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius ?? BorderRadius.circular(12),
          color: color ?? Colors.blue,
        ),
        height: 45,
        width: width ?? double.infinity,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
