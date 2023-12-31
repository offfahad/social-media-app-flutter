import 'package:flutter/material.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/widgets/custom_drawer.dart';
import 'package:social_media_app/widgets/post_carousel.dart';
import 'package:social_media_app/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required this.user, super.key});

  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? _yourPostsPageController;
  PageController? _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: ProfileClipper(),
                child: Image(
                  height: 300.0,
                  width: double.infinity,
                  image: AssetImage(widget.user.backgroundImageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                left: 20.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                  ),
                  iconSize: 30.0,
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 0.6,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image(
                      height: 120.0,
                      width: 120,
                      image: AssetImage(widget.user.profileImageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.user.name!,
              style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'Followers',
                    style: TextStyle(color: Colors.black54, fontSize: 22.0),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    widget.user.followers.toString(),
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Following',
                    style: TextStyle(color: Colors.black54, fontSize: 22.0),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    widget.user.following.toString(),
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          PostCarousel(
              pageController: _yourPostsPageController!,
              title: 'Your Posts',
              posts: widget.user.posts!),
          PostCarousel(
              pageController: _favoritesPageController!,
              title: 'Favorite Posts',
              posts: widget.user.favorites!),
          const SizedBox(
            height: 50.0,
          ),
        ],
      )),
    );
  }
}
