import 'package:flutter/material.dart';

class NavigatorDrawerEx extends StatefulWidget {
  const NavigatorDrawerEx({super.key});

  @override
  State<NavigatorDrawerEx> createState() => _NavigatorDrawerEx();
}

class _NavigatorDrawerEx extends State<NavigatorDrawerEx>
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Gallery",),),
      body: Center(
        child: Column(
          children: [

            Text("Welcome to Gallery",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 30),),
            Text("Please Choice From Drawer",style: TextStyle(color: Colors.pink,fontSize: 20),),
          ],
        ),
      ),

      drawer: Drawer
        (
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Photos',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.photo,color: Colors.purple,),
              title: Text('Gallery'),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryPage()));
              },
              trailing: Icon(Icons.arrow_forward,color: Colors.purple),
            ),
            ListTile(
              leading: Icon(Icons.audiotrack,color: Colors.purple),
              title: Text('Audio'),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AudioPage()));

              },
              trailing: Icon(Icons.arrow_forward,color: Colors.purple),
            ),
            ListTile(
              leading: Icon(Icons.videocam,color: Colors.purple),
              title: Text('Video'),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoPage()));

              },
              trailing: Icon(Icons.arrow_forward,color: Colors.purple),
            ),
          ],
        ),
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
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
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
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
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
                  border: Border.all(color: Colors.purpleAccent, width: 2),
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
                    Icon(Icons.play_circle_filled,color: Colors.purpleAccent,size: 80,),

                  ],
                ));
          }),
    );
  }
}

class AudioPage extends StatelessWidget
{
  List<String> title = [
    'Ajab Si',
    'Main Rang Sharbaton Ka',
    'Agar Tum Saath Ho',
    'Tere Hawale',
    'Heer Ranjha',
    'O Saathi',
    'Mast Magan',
    'Soch na Sake',
    'Heer Raanjhana',
    'Chaand Ne Kaho',
    'Kaise Hua',
  ];
  List<String> subtitle = [
    'Om Shanti Om',
    'Phata Poster Nikhla Hero ',
    'Tamasha',
    'Pritam',
    'Bachchhan Paandey',
    'Baaghi 2',
    '2 States',
    'Airlift',
    'Bachchhan Paandey',
    'Chaal Jeevi Laiye!',
    'Kabir Singh',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text("Song"),),
      body: Container(
        child: ListView.builder(
          itemCount: title.length,
          itemBuilder: (context, index) {
            final song = title;
            final sub = subtitle;
            return Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                  leading: Icon(Icons.play_arrow,color: Colors.purple,),
                  title: Text(song[index],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  subtitle: Text('${sub[index]}',style: TextStyle(color: Colors.grey),),
                  trailing:Column
                    (
                      children:
                      [
                        Icon(Icons.arrow_forward,color: Colors.purple,),
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

