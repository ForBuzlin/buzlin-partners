import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String? url;
  final VoidCallback? onDelete;

  const VideoPage({super.key, required this.url, this.onDelete});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url ?? ""))
          ..initialize().then((_) {
            _chewieController = ChewieController(
              videoPlayerController: videoPlayerController,
              autoPlay: true,
              looping: true,
              hideControlsTimer: const Duration(seconds: 1),
              materialProgressColors: ChewieProgressColors(
                playedColor: Style.red,
                handleColor: Style.primary,
                backgroundColor: Style.bgDark,
                bufferedColor: Style.white,
              ),
              placeholder: Container(
                color: Style.bgDark,
              ),
              autoInitialize: true,
            );
            setState(() {});
          });
    _chewieController =
        ChewieController(videoPlayerController: videoPlayerController);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgDark,
      body: Column(
        children: [
          CommonAppBar(
              color: Style.bgDark,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PopButton(color: Style.white),
                  if (widget.onDelete != null)
                    ButtonEffectAnimation(
                      onTap: () => widget.onDelete?.call(),
                      child: SizedBox(
                        height: 36.r,
                        width: 36.r,
                        child: Icon(
                          Remix.delete_bin_fill,
                          color: Style.white,
                          size: 20.r,
                        ),
                      ),
                    ),
                ],
              )),
          Expanded(
            child: Chewie(controller: _chewieController),
          ),
          MediaQuery.paddingOf(context).bottom.verticalSpace,
        ],
      ),
    );
  }
}
