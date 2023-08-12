import 'package:flutter/material.dart';
import 'package:laren_program_app/ui/screens/python_code/chwie_item_list.dart';
import 'package:video_player/video_player.dart';

class PythonVideoList extends StatefulWidget {
  const PythonVideoList({super.key});

  @override
  State<PythonVideoList> createState() => _PythonVideoListState();
}

class _PythonVideoListState extends State<PythonVideoList> {
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
            videoContainer("assets/python/python2.mp4"),
            const SizedBox(height: 10),
            videoContainer("assets/python/python3.mp4"),
            const SizedBox(height: 10),
            videoContainer("assets/python/python4.mp4"),
            const SizedBox(height: 10),
            videoContainer("assets/python/python5.mp4"),
          ],
        ),
      ),
    );
  }

  Widget videoContainer(String url) {
    return Container(
      width: double.infinity,
      height: 300,
      child: ChewieListItem(
        videoPlayerController: VideoPlayerController.asset(
          url,
        ),
        looping: true,
      ),
    );
  }
}
