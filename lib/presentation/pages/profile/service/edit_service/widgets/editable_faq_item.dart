import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/data/faq_data.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditableFaqItem extends StatelessWidget {
  final FaqData faq;
  final Function(String) onAnswerChange;
  final Function(String) onQuestionChange;
  final Function()? onDeleteFaq;

  const EditableFaqItem({
    super.key,
    required this.faq,
    required this.onAnswerChange,
    required this.onQuestionChange,
    required this.onDeleteFaq,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
      ),
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: REdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: UnderlinedTextField(
                  label: '${AppHelpers.getTranslation(TrKeys.question)}*',
                  inputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  initialText: faq.translation?.question ?? '',
                  onChanged: (s) => onQuestionChange(s),
                  validator: AppValidators.emptyCheck,
                ),
              ),
              if (onDeleteFaq != null)
                Padding(
                  padding: REdgeInsets.only(left: 10, top: 8),
                  child: ButtonEffectAnimation(
                    child: GestureDetector(
                      onTap: () => onDeleteFaq!(),
                      child: Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Style.greyColor,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Remix.delete_bin_line,
                          size: 18.r,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          8.verticalSpace,
          UnderlinedTextField(
            label: '${AppHelpers.getTranslation(TrKeys.answer)}*',
            inputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            initialText: faq.translation?.answer ?? '',
            onChanged: (s) => onAnswerChange(s),
            validator: AppValidators.emptyCheck,
          ),
        ],
      ),
    );
  }
}
