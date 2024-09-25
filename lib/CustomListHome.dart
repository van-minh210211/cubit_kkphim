
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class Customlisthome extends StatefulWidget {
  final String img;
  final String name;
  final String slug;
   Customlisthome({required this.img,required this.name,required this.slug,super.key});
  @override
  State<Customlisthome> createState() => _CustomlisthomeState();
}
class _CustomlisthomeState extends State<Customlisthome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        children: <Widget>[
          CachedNetworkImage(imageUrl: widget.img),
          Text(widget.name),
          Text(widget.slug)
        ],
      ),
    );
  }
}
