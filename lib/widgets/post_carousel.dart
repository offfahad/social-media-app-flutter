import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/post_model.dart';

class PostCarousel extends StatelessWidget {
  const PostCarousel({required this.pageController, required this.title, required this.posts,super.key});

  final PageController pageController;
  final String title;
  final List<Post> posts;


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}