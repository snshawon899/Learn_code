import 'package:flutter/material.dart';
import 'package:laren_program_app/ui/screens/java_script_code/java_chwie_item.dart';
import 'package:video_player/video_player.dart';

class JavaScriptVideoList extends StatefulWidget {
  const JavaScriptVideoList({super.key});

  @override
  State<JavaScriptVideoList> createState() => _JavaScriptVideoListState();
}

class _JavaScriptVideoListState extends State<JavaScriptVideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JavaScript Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          // videoContainer("assets/java/javaScript1.mp4"),
          videoContainer("assets/java/javaScript2.mp4"),
          const SizedBox(height: 10),
          videoContainer("assets/java/javaScript3.mp4"),
          const SizedBox(height: 10),
          videoContainer("assets/java/javaScript4.mp4"),
          const SizedBox(height: 10),
          videoContainer("assets/java/javaScript5.mp4"),
          const SizedBox(height: 10),
          // videoContainer("assets/javaScript/javaScript1.mp4"),
        ],
      ),
    );
  }

  Widget videoContainer(String url) {
    return Container(
      width: double.infinity,
      height: 300,
      child: JavaScriptChewieListItem(
        videoPlayerController: VideoPlayerController.asset(
          url,
        ),
        looping: true,
      ),
    );
  }
}
