import 'package:flutter/material.dart';


class BottomGalleryex extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomGalleryex>
{
  int _selectedIndex = 0;

  // Define a list of widgets that will be displayed on each tab.
  List<Widget> _widgetOptions = <Widget>[
    GalleryPage(),
    AudioPage(),
    VideoPage(),
  ];

  // Function to update the selected index of the bottom nav bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Bottom Navigation App'),
      ),*/
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Video',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class GalleryPage extends StatelessWidget
{
  List<String> gallery = [
    'assets/gallery/img.png',
    'assets/gallery/img_1.png',
    'assets/gallery/img_2.png',
    'assets/gallery/img_3.png',
    'assets/gallery/img_4.png',
    'assets/gallery/img_5.png',
    'assets/gallery/img_6.png',
    'assets/gallery/img_7.png',
    'assets/gallery/img_8.png',
    'assets/gallery/img_9.png',
    'assets/gallery/img_10.png',
    'assets/gallery/img_11.png',
    'assets/gallery/img_12.png',
    'assets/gallery/img_13.png',
    'assets/gallery/img_14.png',
    'assets/gallery/img_15.png',
    'assets/gallery/img_16.png',
    'assets/gallery/img_17.png',
    'assets/gallery/img_18.png',
    'assets/gallery/img_19.png',
    'assets/gallery/img_20.png',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,

        title: Text("Gallery",),),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of items per row
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: gallery.length,
          itemBuilder: (BuildContext context, int index) {
            final path = gallery;
            return Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.red, width: 2),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                '${path[index]}',
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}

class VideoPage extends StatelessWidget
{
  List<String> link = [
    'assets/gallery/img.png',
    'assets/gallery/img_1.png',
    'assets/gallery/img_2.png',
    'assets/gallery/img_3.png',
    'assets/gallery/img_4.png',
    'assets/gallery/img_5.png',
    'assets/gallery/img_6.png',
    'assets/gallery/img_7.png',
    'assets/gallery/img_8.png',
    'assets/gallery/img_9.png',
    'assets/gallery/img_10.png',
    'assets/gallery/img_11.png',
    'assets/gallery/img_12.png',
    'assets/gallery/img_13.png',
    'assets/gallery/img_14.png',
    'assets/gallery/img_15.png',
    'assets/gallery/img_16.png',
    'assets/gallery/img_17.png',
    'assets/gallery/img_18.png',
    'assets/gallery/img_19.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Videos"),),

      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: link.length,
          itemBuilder: (BuildContext context, int index) {
            final path = link;
            return Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.lightBlueAccent, width: 2),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      '${path[index]}',
                      fit: BoxFit.cover,
                      height: 182,
                      width: 182,
                    ),
                    Padding(padding: EdgeInsets.only(top: 100)),
                    Icon(Icons.play_circle_filled,color: Colors.blue,size: 80,),

                  ],
                ));
          }),
    );
  }
}

class AudioPage extends StatelessWidget
{

  final List<Map<String, String>> songs = [
    {
      'title':'Ajab Si',
      'subtitle':'Om Shanti Om',
    },
    {
      'title': 'Agar Tum Saath Ho',
      'subtitle':'Tamasha',
    },
    {
      'title': 'Main Rang Sharbaton Ka',
      'subtitle':'Phata Poster Nikhla Hero ',
    },
    {
      'title': 'Tere Hawale',
      'subtitle':'Pritam',
    },
    {
      'title':'Heer Ranjha',
      'subtitle':'Bachchhan Paandey',
    },
    {
      'title':'O Saathi',
      'subtitle':'Baaghi 2',
    },
    {
      'title':'Mast Magan',
      'subtitle':'2 States',
    },
    {
      'title':'Soch na Sake',
      'subtitle':'Airlift',
    },
    {
      'title':'Heer Raanjhana',
      'subtitle':'Bachchhan Paandey',
    },
    {
      'title':'Chaand Ne Kaho',
      'subtitle':'Chaal Jeevi Laiye!',
    },
    {
      'title':'Kaise Hua',
      'subtitle':'Kabir Singh',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Song"),),
      body: Container(
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                  leading: Icon(Icons.play_arrow,color: Colors.blueAccent,),
                  title: Text(songs[index]['title']!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  subtitle: Text(songs[index]['subtitle']!,style: TextStyle(color: Colors.grey),),
                  trailing:Column
                    (
                      children:
                      [
                        Icon(Icons.arrow_forward,color: Colors.blueAccent,),
                        SizedBox(height: 5,),
                        Icon(Icons.star_border_outlined,color: Colors.green,size: 15,),
                      ]
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
