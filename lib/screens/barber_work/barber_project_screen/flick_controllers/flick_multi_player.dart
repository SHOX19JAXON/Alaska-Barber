import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/portrait_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

import './flick_multi_manager.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FlickMultiPlayer extends StatefulWidget {
  const FlickMultiPlayer(
      {Key? key,
        required this.url,
        this.image,
        required this.flickMultiManager})
      : super(key: key);

  final String url;
  final String? image;
  final FlickMultiManager flickMultiManager;

  @override
  _FlickMultiPlayerState createState() => _FlickMultiPlayerState();
}

class _FlickMultiPlayerState extends State<FlickMultiPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.asset(widget.url)
        ..setLooping(true),
      autoPlay: false,
    );
    widget.flickMultiManager.init(flickManager);

    super.initState();
  }

  @override
  void dispose() {
    widget.flickMultiManager.remove(flickManager);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visiblityInfo) {
        if (visiblityInfo.visibleFraction > 0.9) {
          widget.flickMultiManager.play(flickManager);
        }
      },
      child: Container(
        height: 520,
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            videoFit: BoxFit.cover,
            playerLoadingFallback: Positioned.fill(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            controls: FeedPlayerPortraitControls(
              flickMultiManager: widget.flickMultiManager,
              flickManager: flickManager,
            ),
          ),
          flickVideoWithControlsFullscreen: FlickVideoWithControls(
            playerLoadingFallback: Center(
                child: Image.network(
                  widget.image!,
                  fit: BoxFit.fitWidth,
                )),
            controls: const FlickLandscapeControls(),
            iconThemeData: const IconThemeData(
              size: 40,
              color: Colors.white,
            ),
            textStyle: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}