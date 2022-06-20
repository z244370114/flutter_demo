import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  String url;

  VideoScreen({Key? key, required this.url}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();

  _VideoScreenState();

  @override
  void initState() {
    super.initState();
    // var url = 'rtmp://192.168.0.34:8086/live/hxp';
    // var url = 'http://192.168.0.34:8000/live/hxp.flv';
    // var url = 'rtmp://192.168.0.34:8086/live/zy';
    // player.setDataSource(url, autoPlay: true);
    player.setDataSource(widget.url, autoPlay: true);
    // player.setVolume(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fijkplayer Example")),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: FijkView(
                player: player,
              ),
            ),
            Positioned(
              bottom: 0,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    widget.url = 'http://192.168.0.34:8000/live/hxp.flv';
                  });
                  player.release();
                  player.setDataSource(widget.url, autoPlay: true);
                },
                child: Text('http://192.168.0.34:8000/live/hxp.flv'),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.url =
                      'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv';
                });
                player.release();
                player.setDataSource(widget.url, autoPlay: true);
              },
              child: Text(
                  'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv'),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}
