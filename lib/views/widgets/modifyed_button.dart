import 'package:flutter/material.dart';

class CustomButtonModifyed extends StatelessWidget {
  const CustomButtonModifyed({
    super.key,
    this.onTapButton,
    required this.text,
    this.child,
    this.width,
    this.radius,
    this.color,
  });
  final String text;
  final Widget? child;
  final double? width;
  final BorderRadiusGeometry? radius;
  final void Function()? onTapButton;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: onTapButton,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          borderRadius: radius ?? BorderRadius.circular(16),
          color: color ?? Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
