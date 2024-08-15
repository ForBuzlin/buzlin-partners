import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:flutter/material.dart';

class NotPermission extends StatelessWidget {
  const NotPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height/10),
      child: Center(
        child: Text(AppHelpers.getTranslation(TrKeys.dontPermission)),
      ),
    );
  }
}
