import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

List<String> python_videos = [
  "assets/python/python1.mp4",
  "assets/python/python2.mp4",
  "assets/python/python3.mp4",
  "assets/python/python4.mp4",
  "assets/python/python5.mp4",
];

VideoPlayerController pythonController = VideoPlayerController.asset("");
ValueNotifier<Future<void>?> pythonFuture = ValueNotifier(null);
