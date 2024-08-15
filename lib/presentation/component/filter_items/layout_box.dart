part of 'layout.dart';

class LayoutBox extends StatelessWidget {
  final bool active;
  final double height;
  final double width;
  final double radius;

  const LayoutBox(
      {super.key,
      required this.active,
      this.height = 40,
      this.width = 18,
      this.radius = 6})
      ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
        color: active ? Style.primary : Style.unselectLayout,
      ),
      height: height.r,
      width: width.r,
    );
  }
}
