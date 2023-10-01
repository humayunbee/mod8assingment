import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageFeedScreen(),
    );
  }
}

class ImageFeedScreen extends StatefulWidget {
  @override
  _ImageFeedScreenState createState() => _ImageFeedScreenState();
}

class _ImageFeedScreenState extends State<ImageFeedScreen> {
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: isPortrait
                ? Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(height: 10),
                Text(
                  'Humayun Farid',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5), // Add some spacing
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry', // Your subtitle text
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey, // You can customize the color
                  ),
                ),
              ],
            )
                : Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10), // Add some spacing
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5), // Add some spacing
                    Text(
                      'Subtitle Here', // Your subtitle text
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey, // You can customize the color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPortrait ? 3 : 3,
            ),
            itemCount: 9,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
