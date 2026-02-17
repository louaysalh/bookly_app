import 'package:flutter/material.dart';

class slidingText extends StatelessWidget {
  const slidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position:
              slidingAnimation, // position take value of type offset mean value through x axis and y axis (offset)
          child: const Text('Enjoying About It', textAlign: TextAlign.center),
        );
      },
    );
  }
}
