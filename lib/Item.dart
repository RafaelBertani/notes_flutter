import 'package:flutter/material.dart';
import 'package:notes_flutter/main.dart';
import 'package:notes_flutter/Add_Item_Page.dart';

class Item extends StatefulWidget {
  Item({
    super.key,
    // required this.content,
    required this.width,
    required this.height,
    required this.name_item1,
    required this.name_item2,
  });
  // List<Widget> content;
  final double width;
  final double height;
  final String name_item1;
  final String name_item2;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      //item
      width: widget.width * 0.9,
      height: widget.height * 0.2,
      color: const Color(0xFF0000FF),
      child: Stack(
        children: [
          Positioned(
              //title
              width: widget.width * 0.88,
              height: widget.height * 0.04,
              left: widget.width * 0.01,
              top: widget.height * 0.01,
              child: Center(
                  child: Text(widget.name_item1,
                      style: const TextStyle(fontSize: 22)))),
          Positioned(
              //bin
              top: widget.height * 0.001,
              right: widget.width * 0.01,
              child: IconButton(
                onPressed: () => {
                  setState(() {
                    //remove this item
                    //widget.content.remove(this.widget);
                  }),
                },
                icon: const Icon(Icons.delete, color: Color(0xFFFF0000)),
              )),
          Positioned(
              //description
              width: widget.width * 0.88,
              height: widget.height * 0.1,
              left: widget.width * 0.01,
              top: widget.height * 0.06,
              child: Text(widget.name_item2,
                  style: const TextStyle(fontSize: 13))),
        ],
      ),
    ));
  }
}