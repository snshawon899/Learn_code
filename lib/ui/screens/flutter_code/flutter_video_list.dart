import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'flutter_chwie.dart';

class FlutterVideoList extends StatefulWidget {
  const FlutterVideoList({super.key});

  @override
  State<FlutterVideoList> createState() => _FlutterVideoListState();
}

class _FlutterVideoListState extends State<FlutterVideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          videoContainer("assets/flutter/flutter2.mp4"),
          const SizedBox(height: 10),
          videoContainer("assets/flutter/flutter3.mp4"),
          const SizedBox(height: 10),
          videoContainer("assets/flutter/flutter4.mp4"),
          const SizedBox(height: 10),
          videoContainer("assets/flutter/flutter5.mp4"),
        ],
      ),
    );
  }

  Widget videoContainer(String url) {
    return Container(
      width: double.infinity,
      height: 300,
      child: FlutterChewieListItem(
        videoPlayerController: VideoPlayerController.asset(
          url,
        ),
        looping: true,
      ),
    );
  }
}
