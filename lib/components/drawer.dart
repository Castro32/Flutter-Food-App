import 'package:flutter/material.dart';
import 'package:flutter_application_4/Pages/profile_page.dart';
import 'package:flutter_application_4/components/draweTile.dart';
import 'package:flutter_application_4/services/auth/auth_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logout(){
    final authService = AuthService();
    authService.signOut();
    // Optionally, you can navigate to the login page after logout
    // Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build (BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Icon(Icons.ramen_dining,
                size: 80, color:Theme.of(context).colorScheme.inversePrimary,
                // color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
                thickness: 3.5,
              ),
            ),

            //lists
            DrawerTile(
              text: "Home",
              icon: Icons.home,
              onTap: () {
                Navigator.pop(  context); // Close the drawer
              },
            ),
            //profile
            DrawerTile(
              text: "Profile",
              icon: Icons.person,
              onTap: () {
                Navigator.pop(  context);
                // Navigator.pushNamed(context,ProfilePage());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            //settings
            DrawerTile(
              text: "Settings",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(  context);
                Navigator.pushNamed(context, '/settings');
              },
            ),

            //spacer
            const Spacer(),
            //logout
            DrawerTile(
              text: "Logout",
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            
          ],
        ),
      ),
    );
  }
}