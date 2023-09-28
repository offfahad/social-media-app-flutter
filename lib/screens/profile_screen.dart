import 'package:flutter/material.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/widgets/custom_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required this.user, super.key});

  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
              Image(
                height: 300.0,
                width: double.infinity,
                image: AssetImage(widget.user.backgroundImageUrl!),
                fit: BoxFit.cover,
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
          )
        ],
      )),
    );
  }
}
