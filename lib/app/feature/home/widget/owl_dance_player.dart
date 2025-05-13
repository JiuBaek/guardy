import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OwlDancePlayer extends StatefulWidget {
  const OwlDancePlayer({super.key});

  @override
  State<OwlDancePlayer> createState() => _OwlDancePlayerState();
}

class _OwlDancePlayerState extends State<OwlDancePlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/owlDance.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: const Text(
                  "⚠️ This can take more than a minute, please wait.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 180,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: VideoPlayer(_controller),
                ),
              ),
            ],
          )
        : const CircularProgressIndicator(
            color: Color(0xFF005DD8),
          );
  }
}
