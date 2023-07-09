import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: Column(
        children: [
          Text('Movie Name : ${args["name"]}'),
          Hero(
            tag: 'image',
            child: Image.network(args["image"])),
          Text('Movie Info : ${args["info"]}'),
          Text('Rating: ${args["rating"]}'),
        ],
      ),
    );
  }
}
