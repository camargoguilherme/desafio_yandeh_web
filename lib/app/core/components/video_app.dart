import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  final String path;
  final double? width, height;
  final BorderRadius? borderRadius;
  final bool showControls;
  final bool autoPlay;
  final bool looping;
  final Function? onClick;

  const VideoApp(
    this.path, {
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
    this.showControls = false,
    this.autoPlay = true,
    this.looping = true,
    this.onClick,
  }) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    // Inicializa o controller dependendo se o vídeo é da rede ou local
    _controller =
        (widget.path.startsWith('http') || widget.path.startsWith('https'))
            ? VideoPlayerController.networkUrl(Uri(host: widget.path))
            : VideoPlayerController.asset(widget.path);

    _controller.initialize().then((_) {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        showControls: widget.showControls,
        aspectRatio: widget.width != null && widget.height != null
            ? widget.width! / widget.height!
            : _controller.value.aspectRatio,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  // In the VideoApp build method
  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: GestureDetector(
          onTap: () {
            if (widget.onClick != null) {
              widget.onClick!();
            }
          },
          child: SizedBox(
            width: widget.width ?? double.infinity,
            height: widget.height ?? double.infinity,
            child: VideoPlayer(_controller),
          ),
        ),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
