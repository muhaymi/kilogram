import 'package:flutter/material.dart';
import 'package:kilogram/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListPostPage(),
    );
  }
}

class ListPostPage extends StatelessWidget {
  const ListPostPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 100, 
            height: 100, 
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummyPosts.length,
              itemBuilder: (context, index) {
                final post = dummyPosts[index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(post.profilePhotoUrl),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            post.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.all(0),
                        width: double.infinity,
                        child: Image.network(
                          post.photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Icon(Icons.favorite_border),
                              SizedBox(width: 4.0),
                              Icon(Icons.send),
                              SizedBox(width: 4.0),
                              Icon(Icons.chat_bubble),
                            ],
                          ),
                          Icon(Icons.bookmark),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
