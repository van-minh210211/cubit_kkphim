import 'package:flutter/material.dart';

class ListTileSearch extends StatelessWidget {

  final String? title;

  ListTileSearch({

    @required this.title,

  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title??"",
        style: TextStyle(
          color: Colors.red,
        ),
      ),

    );
  }
}
