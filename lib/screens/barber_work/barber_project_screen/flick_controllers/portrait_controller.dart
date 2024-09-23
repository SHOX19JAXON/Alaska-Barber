import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/flick_multi_manager.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:provider/provider.dart';

class FeedPlayerPortraitControls extends StatelessWidget {
  const FeedPlayerPortraitControls({
    Key? key,
    this.flickMultiManager,
    this.flickManager,
  }) : super(key: key);

  final FlickMultiManager? flickMultiManager;
  final FlickManager? flickManager;

  @override
  Widget build(BuildContext context) {
    // Ensure the FlickDisplayManager is available in the widget tree.
    final displayManager = Provider.of<FlickDisplayManager>(context, listen: false);

    return Container(
      color: Colors.transparent,  // Ensure transparent background for the player
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,  // Align children to the right end
        children: <Widget>[
          // Display remaining video duration at the top right
          FlickAutoHideChild(
            showIfVideoNotInitialized: false,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black38,  // Semi-transparent background for better contrast
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const FlickLeftDuration(),  // Displays time remaining in the video
              ),
            ),
          ),
          // Central area for play/pause toggle, buffer display and seek action
          Expanded(
            child: FlickToggleSoundAction(
              toggleMute: () {
                flickMultiManager?.toggleMute();  // Mute or unmute the video
                displayManager.handleShowPlayerControls();  // Ensure player controls are shown
              },
              child: const FlickSeekVideoAction(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FlickVideoBuffer(),  // Display buffering state in the background
                      FlickPlayToggle(size: 50),  // Centered play/pause button
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Bottom row with sound toggle
          FlickAutoHideChild(
            autoHide: true,  // Automatically hide controls after inactivity
            showIfVideoNotInitialized: false,  // Hide controls if video is not initialized
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Container for sound toggle
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black,  // Black for better visibility
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlickSoundToggle(
                    toggleMute: () => flickMultiManager?.toggleMute(),  // Toggle sound
                    color: Colors.white,  // White color for sound toggle button
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
