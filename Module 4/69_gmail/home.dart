import 'package:flutter/material.dart';

import 'email_details.dart';

class Gmailsecreenex extends StatefulWidget
{
  const Gmailsecreenex({super.key});

  @override
  State<Gmailsecreenex> createState() => _GmailsecreenexState();
}

class _GmailsecreenexState extends State<Gmailsecreenex>
{
  int _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text("Inbox"),),


      drawer: Drawer
        (
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/img1.jpg'), // Replace with your image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'dhaval@gmail.com',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('Sent'),
              onTap: () {
                // Action for 'Sent' option
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Mail'),
              onTap: () {

              },
            ),
          ],
        ),
      ),

      body: _currentIndex == 0 ? _buildGmailScreen1() : _buildMeetScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Gmail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Meet',
          ),
        ],
      ),

    );
  }




}
class _buildGmailScreen1 extends StatelessWidget
{
  final List<Map<String, String>> emails = [
    {
      'subject': 'Welcome to Flutter!',
      'sender': 'flutter@example.com',
      'content': 'We are happy to have you on board with Flutter. Explore the awesome features!',
      'time': '10:00 AM'
    },
    {
      'subject': 'Meeting Reminder',
      'sender': 'meetings@example.com',
      'content': 'Reminder: You have a meeting scheduled at 2 PM today.',
      'time': '9:30 AM'
    },
    {
      'subject': 'Your package is on the way!',
      'sender': 'shop@example.com',
      'content': 'Your recent order has been shipped and is on its way to your address.',
      'time': 'Yesterday'
    },
  ];

  @override
  Widget build(BuildContext context)
  {
    SizedBox(height: 20,);
    return ListView.builder(
      itemCount: emails.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          child: ListTile(

            title: Text(emails[index]['subject']!),
            subtitle: Text(emails[index]['sender']!),
            leading: Icon(Icons.mail),
            trailing:
            Column(

              children:
              [
                Icon(Icons.star_border_outlined),
                Text(emails[index]['time']!),
              ],
            ),

            onTap: () {
              // Navigate to the email details screen with dummy data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmailDetailsScreen(
                    email: emails[index],
                  ),
                ),
              );
            },

          ),
        );

      },
    );

  }

}

class _buildMeetScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: ()
            {

            },
            child: Text('Join Meeting'),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: ()
            {

            },
            child: Text('New Meeting'),
          ),
        ],
      ),
    );
  }
}
