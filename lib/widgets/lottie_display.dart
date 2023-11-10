import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieDisplay extends StatelessWidget {
  
  const LottieDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/LottieLogo1.json',
      width: 200,
      height: 200,
      fit: BoxFit.fill,
    );
  }
}
