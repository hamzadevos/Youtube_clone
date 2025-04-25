import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortScreen extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String details;

  const ShortScreen({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.details,
  });

  @override
  _ShortScreenState createState() => _ShortScreenState();
}

class _ShortScreenState extends State<ShortScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {}); // Ensure the video is ready to play
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Video as background
          _controller.value.isInitialized
              ? GestureDetector(
            onTap: _togglePlayPause,
            child: SizedBox(
                      height: MediaQuery.of(context).size.width*(16/7.6),

                child: VideoPlayer(_controller)),
          )
              : Center(child: CircularProgressIndicator()),

          Padding(
            padding: const EdgeInsets.only(left: 280, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.search, size: 40, color: Colors.white),
                SizedBox(width: 20),
                Icon(Icons.more_vert, size: 40, color: Colors.white),
              ],
            ),
          ),

          // Play/Pause Button (Center of the screen)
          Center(
            child: IconButton(
              icon: Icon(
                _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                size: 80,
                color: Colors.white,
              ),
              onPressed: _togglePlayPause,
            ),
          ),

          // Like, Dislike, Share and Avatar
          Positioned(
            right: 14,
            top: 430,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up_alt_outlined, size: 40, color: Colors.white),
                  onPressed: () {
                    // Handle like
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.thumb_down_alt_outlined, size: 40, color: Colors.white),
                  onPressed: () {
                    // Handle dislike
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.insert_comment_outlined, size: 40, color: Colors.white),
                  onPressed: () {
                    // Handle comment
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share_rounded, size: 40, color: Colors.white),
                  onPressed: () {
                    // Handle share
                  },
                ),
                const SizedBox(height: 50),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://img.freepik.com/free-vector/happy-new-year-2025-wishes-celebration-background_1035-29558.jpg?ga=GA1.1.1008401665.1733906914'),
                  radius: 20,
                ),
              ],
            ),
          ),

          // Channel info and subscribe button
          Positioned(
            left: 20,
            bottom: 60,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40, // Access MediaQuery here
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://img.freepik.com/free-vector/happy-new-year-2025-wishes-celebration-background_1035-29558.jpg?ga=GA1.1.1008401665.1733906914'),
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'My Channel',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                              ),
                              child: const Text('Subscribe'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.details,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
