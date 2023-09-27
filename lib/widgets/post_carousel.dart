import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/post_model.dart';

class PostCarousel extends StatelessWidget {
  const PostCarousel(
      {required this.pageController,
      required this.title,
      required this.posts,
      super.key});

  final PageController pageController;
  final String title;
  final List<Post> posts;

  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              height: 400.0,
              width: 300.0,
              image: AssetImage(post.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      Container(
        height: 400.0,
        child: PageView.builder(
          controller: pageController,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return _buildPost(context, index);
          },
        ),
      )
    ]);
  }
}
