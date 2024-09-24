import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/flick_multi_manager.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:provider/provider.dart';

class FeedPlayerPortraitControls extends StatelessWidget {
  const FeedPlayerPortraitControls({
    super.key,
    this.flickMultiManager,
    this.flickManager,
  });

  final FlickMultiManager? flickMultiManager;
  final FlickManager? flickManager;

  @override
  Widget build(BuildContext context) {
    final displayManager = Provider.of<FlickDisplayManager>(context, listen: false);

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[
          FlickAutoHideChild(
            showIfVideoNotInitialized: false,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black38, 
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const FlickLeftDuration(),
              ),
            ),
          ),
          Expanded(
            child: FlickToggleSoundAction(
              toggleMute: () {
                flickMultiManager?.toggleMute(); 
                displayManager.handleShowPlayerControls();
              },
              child: const FlickSeekVideoAction(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FlickVideoBuffer(),
                      FlickPlayToggle(size: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
          FlickAutoHideChild(
            autoHide: true,
            showIfVideoNotInitialized: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlickSoundToggle(
                    toggleMute: () => flickMultiManager?.toggleMute(),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
