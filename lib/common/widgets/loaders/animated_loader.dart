import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLoader extends StatelessWidget {
  const AnimatedLoader({this.text, required this.animation, super.key});

  final String? text;
  final String animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(animation),
          const SizedBox(height: 50),
          text == null ? const SizedBox() : Text(text!),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
