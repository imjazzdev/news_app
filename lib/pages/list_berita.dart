import 'package:flutter/material.dart';
import 'package:news_app/pages/detail_news.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ListBeritaPage extends StatefulWidget {
  const ListBeritaPage({super.key, required this.category});

  final String category;

  @override
  State<ListBeritaPage> createState() => _ListBeritaPageState();
}

class _ListBeritaPageState extends State<ListBeritaPage> {
  getNews() {
    Provider.of<NewsProvider>(context, listen: false)
        .getTopNews(widget.category);
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return RefreshIndicator(
        onRefresh: () async {
          return await getNews();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.category.toUpperCase()),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                news.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          ...news.resNews!.articles!.map((e) => NewsItem(
                                urlArticle: e.url ?? '',
                                title: e.title ?? '',
                                imgSrc: e.urlToImage ?? '',
                              ))
                        ],
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem(
      {super.key,
      required this.urlArticle,
      required this.imgSrc,
      required this.title});

  final String urlArticle;
  final String imgSrc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
      ),
      child: GestureDetector(
        onTap: () async {
          print(urlArticle);
          await launchUrl(Uri.parse(urlArticle));
        },
        child: Container(
          height: 90,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Image.network(
                    imgSrc,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.grey,
                    ),
                    // loadingBuilder: (context, child, loadingProgress) =>
                    //     SizedBox(
                    //         height: 40,
                    //         width: 40,
                    //         child: CircularProgressIndicator()),
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
