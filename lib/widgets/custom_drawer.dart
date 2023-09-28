import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/login_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  _buildDrawerOption(Icon icon, String title, void Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl!),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                          child: Image(
                        image: AssetImage(currentUser.profileImageUrl!),
                        fit: BoxFit.cover,
                      )),
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      currentUser.name!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    )
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(const Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(const Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(
              const Icon(Icons.account_circle), 'Your Profile', () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfileScreen(),
                ),
              ),),
          _buildDrawerOption(const Icon(Icons.settings), 'Setting', () {}),
          Expanded(
              child: Align(
            alignment: FractionalOffset.topCenter,
            child: _buildDrawerOption(
              const Icon(Icons.logout),
              'logout',
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
