import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class KeyboardDisable extends StatelessWidget {
  final Widget child;

  const KeyboardDisable({super.key, required this.child}) ;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: child),
    );
  }
}
