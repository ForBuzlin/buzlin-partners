part of 'layout.dart';

class LayoutItem extends StatelessWidget {
  final LayoutType type;
  final LayoutType selectType;

  const LayoutItem({super.key, required this.type, required this.selectType})
      ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radius.r),
          border: Border.all(color: Style.white),
          color: Style.transparent),
      padding: EdgeInsets.all(10.r),
      child: type == LayoutType.twoH
          ? Row(
              children: [
                LayoutBox(
                  active: selectType == LayoutType.twoH,
                  width: 16,
                ),
                4.horizontalSpace,
                LayoutBox(
                  active: selectType == LayoutType.twoH,
                  width: 16,
                ),
              ],
            )
          : type == LayoutType.threeH
              ? Column(
                  children: [
                    Row(
                      children: [
                        LayoutBox(
                          active: selectType == LayoutType.threeH,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                        4.horizontalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.threeH,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                        4.horizontalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.threeH,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        LayoutBox(
                          active: selectType == LayoutType.threeH,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                        4.horizontalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.threeH,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                        4.horizontalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.threeH,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                      ],
                    ),
                  ],
                )
              : type == LayoutType.twoV
                  ? Column(
                      children: [
                        LayoutBox(
                          active: selectType == LayoutType.twoV,
                          height: 18,
                          width: 38,
                        ),
                        4.verticalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.twoV,
                          height: 18,
                          width: 38,
                        ),
                      ],
                    )
                  : Column(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: REdgeInsets.only(bottom: 3),
                          child: LayoutBox(
                            active: selectType == LayoutType.threeV,
                            height: 6,
                            width: 32,
                            radius: 2,
                          ),
                        ),
                      ),
                    ),
    );
  }
}
