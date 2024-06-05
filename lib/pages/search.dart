import 'package:flutter/material.dart';
import 'package:news_app/components/item_catagory.dart';
import 'package:news_app/pages/list_berita.dart';
import 'package:news_app/utils/const.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future searchData(String param) async {
    List<String> result = list_catagory
        .where((element) => element.toLowerCase().contains(param.toLowerCase()))
        .toList();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search by catagory')

          // flexibleSpace:
          ),
      body: TypeAheadField<String>(
        suggestionsCallback: (search) async {
          return await searchData(search);
        },
        builder: (context, controller, focusNode) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
                controller: controller,
                focusNode: focusNode,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                )),
          );
        },
        itemBuilder: (context, data) {
          return ListTile(
            title: Text(data.toString()),
          );
        },
        onSelected: (data) {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    ListBeritaPage(category: data.toString())),
          );
        },
      ),
    );
  }
}
