import 'package:alaska_barber/screens/barber_work/widget/video_controller.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
      autoPlay: false,
      autoInitialize: true,
      videoPlayerController:
      VideoPlayerController.asset("assets/video/barber.mp4"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: FlickVideoPlayer(
              flickManager: flickManager,
              flickVideoWithControls: const FlickVideoWithControls(
                videoFit: BoxFit.contain,
                controls: CustomOrientationControls(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
