import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube/reusable/videotile.dart';

class VideoPlayBack extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String channelName;
  final String views;
  final String uploadTime;
  final String avatarUrl;
  final String details;
  final String subscribers;

  const VideoPlayBack({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.channelName,
    required this.views,
    required this.uploadTime,
    required this.avatarUrl,
    required this.details,
    required this.subscribers,
  });

  @override
  State<VideoPlayBack> createState() => _VideoPlayBackState();
}

class _VideoPlayBackState extends State<VideoPlayBack> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 310,
              child: Stack(
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                      : Center(child: CircularProgressIndicator()),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                                size: 50,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.stop,
                                color: Colors.red,
                                size: 50,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.seekTo(Duration.zero);
                                  _controller.pause();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '${widget.views} views • ${widget.uploadTime} • ${widget.details}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
            // Channel Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.avatarUrl),
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${widget.channelName}  ${widget.subscribers}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
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
            ),
            const SizedBox(height: 5),
            // Action Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildActionRow(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Comments Section
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: 900,
                child: ListView(
                  children: [
                    commentSection(),
                    const SizedBox(height: 5),
                    // Sample Video Tiles
                    VideoTile(
                      videoUrl: 'https://www.w3schools.com/html/mov_bbb.mp4',
                      title: 'Another Video',
                      channelName: 'flutter dev',
                      views: '1.5M',
                      uploadTime: '11 hours ago',
                      avatarUrl: '',
                    ),
                    // Add more VideoTiles as needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActionRow() {
    return Row(
      children: [
        buildActionTile(icon: Icons.thumb_up, label: '1.5M'),
        buildActionTile(icon: Icons.thumb_down, label: '12K'),
        buildActionTile(icon: Icons.share, label: 'Share'),
        buildActionTile(icon: Icons.video_settings, label: 'Remix'),
        buildActionTile(icon: Icons.download, label: 'Download'),
      ],
    );
  }

  Widget buildActionTile({required IconData icon, required String label}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget commentSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Comments',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(widget.avatarUrl),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Write a comment...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}