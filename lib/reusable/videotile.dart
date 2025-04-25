import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'videoplayback.dart';


class VideoTile extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String channelName;
  final String views;
  final String uploadTime;
  final String avatarUrl;

  const VideoTile({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.channelName,
    required this.views,
    required this.uploadTime,
    required this.avatarUrl,
  });

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late final VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
    ..initialize().then((_){
      setState(() {

      });
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayBack(
              videoUrl: widget.videoUrl,
              title: widget.title,
              channelName: widget.channelName,
              views: widget.views,
              uploadTime: widget.uploadTime,
              avatarUrl: widget.avatarUrl,
              details: 'Lorem ipsum details',
              subscribers: '1M',
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(
                    child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 8),
            // Title and Avatar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfB7YJrbn3WVSrXkRJrJ2zagMHHbagFiLRmA&s'
                    ),
                    radius: 12,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.more_vert, size: 18),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                '${widget.channelName} • ${widget.views} views • ${widget.uploadTime}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
