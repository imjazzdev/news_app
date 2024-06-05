import 'package:flutter/material.dart';
import 'package:news_app/pages/info.dart';
import 'package:news_app/pages/list_berita.dart';
import 'package:news_app/pages/search.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset('assets/logo.png'),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                ),
                title: const Text('Info'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(),
                      ));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ));
                },
                icon: Icon(Icons.search_rounded)),
          ],
        ),
        body: ListView(
          // padding: EdgeInsets.all(25),
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.85,
                    // color: Colors.grey,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/banner.jpg',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.85,
                    // color: Colors.grey,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/banner1.jpg',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.85,
                    // color: Colors.grey,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/banner2.jpg',
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Catagory',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ListBeritaPage(category: 'business'),
                          ));
                    },
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue.shade50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/bussiness.png'),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Business', style: TextStyle(fontSize: 22))
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ListBeritaPage(category: 'entertainment'),
                          ));
                    },
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue.shade50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/social-media.png'),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Entertaiment',
                                  style: TextStyle(fontSize: 22))
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ListBeritaPage(category: 'sports'),
                          ));
                    },
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue.shade50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/sports.png'),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Sport', style: TextStyle(fontSize: 22)),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
