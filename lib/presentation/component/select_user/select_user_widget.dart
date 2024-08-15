import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'create_user_modal.dart';
import 'select_user_modal.dart';

class SelectUserWidget extends ConsumerWidget {
  const SelectUserWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userState = ref.watch(orderUserProvider);
    return Row(
      children: [
        Expanded(
          child: UnderlinedTextField(
            label: userState.selectedUser != null
                ? AppHelpers.getTranslation(TrKeys.selectedUser)
                : null,
            hint: AppHelpers.getTranslation(TrKeys.pleaseSelectAUser),
            readOnly: true,
            onTap: () => AppHelpers.showCustomModalBottomDragSheet(
              context: context,
              modal: (s) => const SelectUserModal(),
              radius: 18,
              isDrag: true,
              paddingTop: 60,
              initSize: 0.7,
            ),
            textController: userState.userTextController,
            descriptionText: userState.selectedUser == null
                ? null
                : userState.selectedUser?.email ?? '',
          ),
        ),
        8.horizontalSpace,
        if (AppHelpers.getUserRole != TrKeys.master)
          CustomIconButton(
            iconData: Icons.add,
            onTap: () => AppHelpers.showCustomModalBottomSheet(
              paddingTop: 72,
              context: context,
              modal: const CreateUserModal(),
            ),
          )
      ],
    );
  }
}
