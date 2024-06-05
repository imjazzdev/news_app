import 'package:flutter/material.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({
    super.key,
    required this.title,
    required this.deskripsi,
    required this.publishedat,
    required this.urlImage,
    required this.content,
  });
  final String title, deskripsi, publishedat, urlImage, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            deskripsi,
            style: TextStyle(fontSize: 20),
          ),
          Text(publishedat,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Image.network(
            urlImage,
            errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                width: double.maxFinite,
                alignment: Alignment.center,
                color: Colors.grey.shade200,
                child: Icon(Icons.image)),
          ),
          Text(
            content,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ],
      )),
    );
  }
}
