import 'package:flutter/material.dart';

import '../pages/setting_page.dart';
import '../services/auth/auth_service.dart';
import '../pages/login_page.dart'; // Add this import for redirection

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) async {
    try {
      final _auth = AuthService();
      await _auth.signOut();

      // Navigate to the login page or initial route
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage(onTap: null)),
      );
    } catch (e) {
      // Optional: Show an error if logout fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),

              // Home List Tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("H O M E", style: TextStyle(color: Colors.grey)),
                  leading: Icon(Icons.home, color: Colors.grey.shade500),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Settings List Tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("S E T T I N G", style: TextStyle(color: Colors.grey)),
                  leading: Icon(Icons.settings, color: Colors.grey.shade500),
                  onTap: () {
                    // Pop the drawer
                    Navigator.pop(context);

                    // Navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingPage()),
                    );
                  },
                ),
              ),
            ],
          ),

          // Logout List Tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: Text("L O G O U T", style: TextStyle(color: Colors.grey)),
              leading: Icon(Icons.logout_outlined, color: Colors.grey.shade500),
              onTap: () => logout(context), // Call logout with context
            ),
          ),
        ],
      ),
    );
  }
}
