import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'loading.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Style.white.withOpacity(0.2),
        ),
        child: Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          child: const Loading(),
        ),
      ),
    );
  }
}
