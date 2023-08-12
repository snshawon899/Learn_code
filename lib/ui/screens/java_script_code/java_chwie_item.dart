import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class JavaScriptChewieListItem extends StatefulWidget {
  const JavaScriptChewieListItem(
      {super.key, required this.videoPlayerController, required this.looping});
  final VideoPlayerController videoPlayerController;
  final bool looping;

  @override
  State<JavaScriptChewieListItem> createState() =>
      _JavaScriptChewieListItemState();
}

class _JavaScriptChewieListItemState extends State<JavaScriptChewieListItem> {
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
