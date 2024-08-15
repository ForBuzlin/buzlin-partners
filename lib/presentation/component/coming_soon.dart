import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height/8),
      child: Center(
        child: Text(AppHelpers.getTranslation(TrKeys.comingSoon)),
      ),
    );
  }
}
