import 'package:flutter/material.dart';
import 'package:futuratest/constants.dart';
import 'package:futuratest/screen/fullScreen.dart';
import 'package:provider/provider.dart';
import '../provider/apicall.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/MainScreen';
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController searchText = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  late ApiCall apicall;

  List<String> imageUrl = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    apicall = Provider.of<ApiCall>(context);
    imageUrl = apicall.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Futura Labs"),
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
                      final String url = imageUrl[i];

                      Navigator.of(context)
                          .pushNamed(FullScreen.routeName, arguments: url);
                    },
                    child: Image.network(imageUrl[i])),
              ),
              itemCount: imageUrl.length,
            ),
          )
        ],
      ),
    );
  }
}
