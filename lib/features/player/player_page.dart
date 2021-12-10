import 'package:anilibria_app/features/player/player_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerPage extends ConsumerWidget {
  final String url;
  const PlayerPage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(playerPageControllerProvider(url));
    return FlickVideoPlayer(
      flickManager: controller.manager,
      flickVideoWithControls: FlickVideoWithControls(
        controls: FlickPortraitControls(
          iconSize: 32,
          fontSize: 16,
          progressBarSettings:
              FlickProgressBarSettings(height: 5, handleRadius: 5),
        ),
        videoFit: BoxFit.contain,
      ),
    );
  }
}
