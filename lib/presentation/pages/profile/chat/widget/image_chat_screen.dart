import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ImageChatPage extends StatelessWidget {
  final String image;

  const ImageChatPage({super.key, required this.image}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.black,
      body: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Remix.close_circle_fill,
                      color: Style.white,
                      size: 26.r,
                    )),
                const Spacer(),
              ],
            ),
          ),
          32.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 2,
            child: PhotoView(
              imageProvider: NetworkImage(image),
            ),
          ),
        ],
      ),
    );
  }
}
