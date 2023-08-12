import 'package:flutter/material.dart';
import 'package:laren_program_app/ui/screens/c++_code/c++_chewie_item.dart';
import 'package:video_player/video_player.dart';

class CPlusVideoList extends StatefulWidget {
  const CPlusVideoList({super.key});

  @override
  State<CPlusVideoList> createState() => _CPlusVideoListState();
}

class _CPlusVideoListState extends State<CPlusVideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
          );
        },
        child: ListView(
          children: <Widget>[
            videoContainer("assets/videos/c++2.mp4"),
            const SizedBox(height: 10),
            videoContainer("assets/videos/c++3.mp4"),
            const SizedBox(height: 10),
            videoContainer("assets/videos/c++4.mp4"),
            const SizedBox(height: 10),
            videoContainer("assets/videos/c++5.mp4"),
            SizedBox(height: 10),
            netVideoContainer("https://www.youtube.com/watch?v=OO_-MbnXQzY"),
          ],
        ),
      ),
    );
  }

  Widget videoContainer(String url) {
    return Container(
      width: double.infinity,
      height: 300,
      child: CPulsChewieListItem(
        videoPlayerController: VideoPlayerController.asset(
          url,
        ),
        looping: true,
      ),
    );
  }

  Widget netVideoContainer(String url) {
    return Container(
      width: double.infinity,
      height: 300,
      child: CPulsChewieListItem(
        videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(url),
        ),
        looping: true,
      ),
    );
  }
}
