import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube/reusable/videotile.dart';



import '../reusable/yt_shorts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';

  final Map<String, List<Map<String, String>>> _videoData = {
    'All': [
      {
        'videoUrl': 'https://videos.pexels.com/video-files/1793014/1793014-sd_640_360_30fps.mp4',
        'title': 'How to clone Youtube App | All Video',
        'channelName': 'All Channel',
        'views': '1.5M',
        'uploadTime': '11 hours ago',
      },
      {
        'videoUrl': 'https://videos.pexels.com/video-files/3571264/3571264-sd_640_360_30fps.mp4',
        'title': 'Another All Video',
        'channelName': 'All Channel',
        'views': '500K',
        'uploadTime': '1 day ago',
      },
      {
        'videoUrl': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        'title': 'Another All Video',
        'channelName': 'All Channel',
        'views': '500K',
        'uploadTime': '1 day ago',
      },
      {
        'videoUrl': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        'title': 'Another All Video',
        'channelName': 'All Channel',
        'views': '500K',
        'uploadTime': '1 day ago',
      },
    ],
    'Games': [
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
    ],
    'Music': [
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'Top Music Video',
        'channelName': 'Music Channel',
        'views': '3M',
        'uploadTime': '1 week ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'Top Music Video',
        'channelName': 'Music Channel',
        'views': '3M',
        'uploadTime': '1 week ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'Top Music Video',
        'channelName': 'Music Channel',
        'views': '3M',
        'uploadTime': '1 week ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'Top Music Video',
        'channelName': 'Music Channel',
        'views': '3M',
        'uploadTime': '1 week ago',
      },
    ],
    'Tech': [
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
    ],
    'Cartoon': [
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'videoUrl': 'https://youtu.be/ufKRYe8ZPaw',
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
      {
        'title': 'How to Play Games | Games Video',
        'channelName': 'Gaming Channel',
        'views': '2M',
        'uploadTime': '5 hours ago',
      },
    ],
  };

  // Example data categorized by type for shorts
  final Map<String, List<Map<String, String>>> _shortsData = {
    'All': [
      {
        'videoUrl': ' https://videos.pexels.com/video-files/6624888/6624888-sd_360_640_30fps.mp4',
        'title': 'Short 1',
        'details': 'Details 1',
      },
      {
        'videoUrl':'https://videos.pexels.com/video-files/4937376/4937376-sd_360_640_24fps.mp4',
        'title': 'Short 2',
        'details': 'Details 2',
      },
      {
        'videoUrl': ' https://videos.pexels.com/video-files/6624888/6624888-sd_360_640_30fps.mp4',
        'title': 'Short 1',
        'details': 'Details 1',
      },
      {
        'videoUrl':'https://videos.pexels.com/video-files/4937376/4937376-sd_360_640_24fps.mp4',
        'title': 'Short 2',
        'details': 'Details 2',
      },
    ],
    'Games': [
      {
        'videoUrl': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        'title': 'Game Short 1',
        'details': 'Game Details 1',
      },
      {
        'videoUrl': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        'title': 'Game Short 1',
        'details': 'Game Details 1',
      },
      {
        'videoUrl': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        'title': 'Game Short 1',
        'details': 'Game Details 1',
      },
      {
        'videoUrl': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        'title': 'Game Short 1',
        'details': 'Game Details 1',
      },
    ],
    'Music': [
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
    ],
    'Tech': [
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
    ],
    'Cartoon': [
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
      {
        'thumbnail': 'https://img.freepik.com/free-vector/snow-cap-collection_23-2147996372.jpg',
        'title': 'Music Short 1',
        'details': 'Music Details 1',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 4,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/icons.png',
              fit: BoxFit.contain,
            ),
          ),
          title: Row(
            children: [
              const Text(
                'YouTube',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.cast, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                    Icons.notifications_none_outlined, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search_outlined, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _videoData.keys.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: _bar(category, isSelected: _selectedCategory ==
                        category),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoTile(
              videoUrl: _videoData[_selectedCategory]?.first['videoUrl'] ??
                  'default_video_url',
              title: _videoData[_selectedCategory]?.first['title'] ??
                  'Untitled',
              channelName: _videoData[_selectedCategory]
                  ?.first['channelName'] ?? 'Unknown Channel',
              views: _videoData[_selectedCategory]?.first['views'] ?? '0 views',
              uploadTime: _videoData[_selectedCategory]?.first['uploadTime'] ??
                  'Unknown',
              avatarUrl: _videoData[_selectedCategory]?.first['avatarUrl'] ??
                  '',
            ),

            const SizedBox(height: 2),

            // Shorts section
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                spacing: 10,
                children: [
                  SizedBox(
                    child: Icon(
                      Icons.video_call_outlined, size: 40, color: Colors.red,),
                  ),

                  Text(
                    'Shorts',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300, // Adjust as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _shortsData[_selectedCategory]!.map((shortData) {
                  return _shortTile(
                    shortData['videoUrl'] ?? 'Invalid',
                    shortData['title'] ?? 'Invalid data',
                    shortData['details'] ?? 'Invalid',
                    context,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            ..._videoData[_selectedCategory]!.skip(1).map((videoData) {
              return VideoTile(
                videoUrl: videoData['videoUrl'] ?? ' no data ',
                title: videoData['title'] ?? 'no data ',
                channelName: videoData['channelName'] ?? ' no data ',
                views: videoData['views'] ?? ' no data',
                uploadTime: videoData['uploadTime'] ?? '.',
                avatarUrl: '',
              );
            }).toList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_sharp), label: 'Shorts'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined), label: 'Subscriptions'),
          BottomNavigationBarItem(icon: CircleAvatar(), label: 'You'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _bar(String categoryName, {required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[600] : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          categoryName,
          style: TextStyle(
            fontSize: 15,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
Widget _shortTile(String videoUrl, String title, String details, BuildContext context) {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  // Initialize the video player
  _controller = VideoPlayerController.network(videoUrl);
  _initializeVideoPlayerFuture = _controller.initialize();

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShortScreen(
            videoUrl: videoUrl,
            title: title,
            details: details,
          ),
        ),
      );
    },
    child: AspectRatio(
      aspectRatio: 4.5 / 8,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return VideoPlayer(_controller);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    ),
  );
}
