import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: SafeArea(child: child),
    );
  }
}
