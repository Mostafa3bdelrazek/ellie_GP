import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.height,
    required this.moveName,
  });
  final double height;
  final String moveName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Positioned.fill(
        child: ModelViewer(
          src: "assets/movements/$moveName.glb",
          backgroundColor: Colors.white,
          autoPlay: true,
          autoRotate: false,
          ar: true,
          cameraControls: false, // Disables camera controls
          disableTap: true, // Disables tap interactions
          interactionPrompt:
              InteractionPrompt.none, // Disables interaction prompts
        ),
      ),
    );
  }
}
