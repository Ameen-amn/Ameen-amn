import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/apicall.dart';
import 'package:http/http.dart' as http;
import 'package:full_screen_image/full_screen_image.dart';

class FullScreen extends StatelessWidget {
  static const routeName = '/FullScreen';
  const FullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* final apicall = Provider.of<ApiCall>(context);
    final List imageUrl = apicall.imageUrl; */
    final image = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        body: FullScreenPage(
            child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(image.toString()),
    )));
  }
}
