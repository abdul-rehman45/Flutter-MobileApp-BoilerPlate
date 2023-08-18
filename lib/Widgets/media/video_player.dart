import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import '../../constants/colors.dart';

class VideoController extends GetxController {
  String? videoUrl;
  VideoController(this.videoUrl);
  late VideoPlayerController videoController;

  @override
  void onInit() {
    if (videoUrl != null) {
      videoController = VideoPlayerController.networkUrl(
          Uri.parse(videoUrl ?? ''),
          videoPlayerOptions:
              VideoPlayerOptions(allowBackgroundPlayback: false))
        ..initialize().then((_) {
          update();
        });
    }
    super.onInit();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}

// ignore: must_be_immutable
class VideoPlayerCard extends StatelessWidget {
  VideoPlayerCard({
    super.key,
    required this.videoUrl,
  });

  final String? videoUrl;
  bool? showOverlay = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
        init: VideoController(videoUrl),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(AppTexts.video, style: Utilities.textStyle()),
              Container(
                height: 70.w,
                width: 90.w,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (controller.videoController.value.isPlaying) {
                            controller.videoController.pause();
                            controller.update();
                          }
                        },
                        child: VideoPlayer(controller.videoController)),
                    // ClosedCaption(
                    //     text: controller.videoController.value.caption.text),
                    _ControlsOverlay(
                      controller: controller,
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: VideoProgressIndicator(
                            controller.videoController,
                            allowScrubbing: true)),
                  ],
                ),
              )
            ],
          );
        });
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: GestureDetector(
            onTap: () {
              //showoverlay = true;
              controller.videoController.value.isPlaying
                  ? controller.videoController.pause()
                  : controller.videoController.play();

              controller.update();
            },
            child: controller.videoController.value.isInitialized == false
                ? const SizedBox.shrink()
                : controller.videoController.value.isPlaying
                    ? const SizedBox.shrink()
                    : Container(
                        color: Colors.black26,
                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Icon(
                                    controller.videoController.value.isPlaying
                                        ? Icons.pause
                                        : CupertinoIcons.play,
                                    color: Colors.white,
                                    size: 40.0,
                                    semanticLabel: 'Play'),
                              ),
                            ),
                          ),
                        ),
                      ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.videoController.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.videoController.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                '${controller.videoController.value.captionOffset.inMilliseconds}ms',
                style: Helper.textStyle(color: AppColors.white),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.videoController.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.videoController.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.videoController.value.playbackSpeed}x',
                  style: Helper.textStyle(color: AppColors.white)),
            ),
          ),
        ),
      ],
    );
  }
}

// class CustomVideoPlayer extends StatefulWidget {
//   const CustomVideoPlayer({
//     super.key,
//     this.url,
//     this.showControls = true,
//     this.autoPlay = false,
//     this.height,
//     this.width,
//   });
//   final String? url;
//   final double? height, width;
//   final bool autoPlay, showControls;

//   @override
//   State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
// }

// class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
//   late VideoPlayerController videoController;
//   ChewieController? chewieController;
//   bool isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideo();
//   }

//   void _initializeVideo() async {
//     if (widget.url != null) {
//       videoController = VideoPlayerController.networkUrl(
//           Uri.parse(widget.url ?? ''),
//           // 'https://flutter.github'
//           // '.io/assets-for-api-docs/assets/videos/bee.mp4',
//           videoPlayerOptions:
//               VideoPlayerOptions(allowBackgroundPlayback: false))
//         ..initialize().then((_) {
//           setState(() {});
//         });

//       //await videoController.initialize();

//       chewieController = ChewieController(
//         videoPlayerController: videoController,
//         showControls: widget.showControls,
//         autoPlay: widget.autoPlay,
//         aspectRatio: widget.height != null && widget.width != null
//             ? widget.width! / widget.height!
//             : null,
//         placeholder: Align(
//             alignment: Alignment.bottomCenter,
//             child:
//                 VideoProgressIndicator(videoController, allowScrubbing: true)),
//       );
//       isInitialized = true;
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     videoController.dispose();
//     chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(widget.autoPlay ? 0 : 10),
//           child: Chewie(
//             controller: chewieController!,
//           ),
//         ),
//       ],
//     );
//   }
// }
