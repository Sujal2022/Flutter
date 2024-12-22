import 'package:flutter/material.dart';
import 'package:module_6_assignment/services/auth/auth_service.dart';
import 'package:module_6_assignment/services/chat/chat_service.dart';
import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import 'chat_pages.dart';

class Homepage extends StatelessWidget {
  final String loggedInEmail;
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  Homepage({required this.loggedInEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Logged in as: $loggedInEmail",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: _buildUserList()),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error fetching users");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
          return const Center(child: Text("No users found"));
        }

        final users = snapshot.data as List<Map<String, dynamic>>;

        // Exclude the logged-in user
        final filteredUsers = users.where((user) => user["email"] != loggedInEmail).toList();
        print("Filtered users: $filteredUsers");

        return ListView(
          children: filteredUsers
              .map((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }



  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPages(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
