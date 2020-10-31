import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
List list = ['Introduction','Early life', 'Non-Film work', '2012-present', 'Controversy'];

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 =
        VideoPlayerController.asset('assets/zawarudo.mp4');
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        aspectRatio: 9 / 16,
        autoPlay: false,
        looping: true,
        // Try playing around with some of these other options:

        //showControls: false,
        // materialProgressColors: ChewieProgressColors(
        //   playedColor: Colors.red,
        //   handleColor: Colors.blue,
        //   backgroundColor: Colors.grey,
        //   bufferedColor: Colors.lightGreen,
        // ),
        // placeholder: Container(
        //   color: Colors.grey,
        // ),
        autoInitialize: true,
        overlay: 
          Container(
  child: new Stack(
    fit: StackFit.expand,
    children: <Widget>[
    new Scaffold(
      appBar: new AppBar(
        title: new Text("Video Title"),
        elevation: 0.0,
        backgroundColor: const Color(0x00000000).withOpacity(0.5),
      ),
      backgroundColor: Colors.transparent,
      body: new Center(
        child: new Center(
          // child: new BackdropFilter(
          //       filter: new ImageFilter.blur(
          //         sigmaX: 6.0,
          //         sigmaY: 6.0,
          //       ),
          //       child: new Container(
          //         margin: EdgeInsets.all(20.0),
          //         padding: EdgeInsets.all(20.0),
          //         decoration: BoxDecoration(
          //           color: const Color(0xFFB4C56C).withOpacity(0.01),
          //           borderRadius: BorderRadius.all(Radius.circular(50.0)),
          //         ),
          //         child: Text("hi")
          //       ),
          //     ),
          //   
      ),
    )
          )],),)
          // RaisedButton(child:
        //   Text("Za warudo"),
        //   onPressed: () {
        //     if (_videoPlayerController1.value.isPlaying) {
        //       _chewieController.pause();
        //     } else {
        //       _chewieController.play();
        //     }
        //   },
        // )
        );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: new Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Chewie(controller: _chewieController);
                },
                itemCount: 10,
                viewportFraction: 0.8,
                scale: 0.9,
                pagination: new SwiperPagination(
                    builder: SwiperPagination.fraction,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                control: new SwiperControl(
                    iconNext: Icons.navigate_next_rounded,
                    iconPrevious: Icons.navigate_before_rounded,
                    size: 125),
                loop: false,
              ))),
    );
  }
}
