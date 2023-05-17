import 'package:flutter/material.dart';
import 'package:futuratest/constants.dart';
import 'package:futuratest/screen/fullScreen.dart';
import 'package:provider/provider.dart';
import '../provider/apicall.dart';

class MainScreen extends StatelessWidget {
  static final routeName = '/MainScreen';
  MainScreen({super.key});
  TextEditingController searchText = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final apicall = Provider.of<ApiCall>(context);
    final List imageUrl = apicall.imageUrl;
    return Scaffold(
      appBar: AppBar(
        title: Text("Futura Labs"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchText,
                    decoration: kFieldStyle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  apicall.getData(searchText.text);
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (ctx, i) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GestureDetector(
                    onTap: () {
                      final String url = apicall.imageUrl[i];
                      print("passing url:${url.toString()}");
                      Navigator.of(context)
                          .pushNamed(FullScreen.routeName, arguments: url);
                    },
                    child: Image.network(apicall.imageUrl[i])),
              ),
              itemCount: apicall.imageUrl.length,
            ),
          )
        ],
      ),
    );
  }
}
