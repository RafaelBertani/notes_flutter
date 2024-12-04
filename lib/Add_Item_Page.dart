import 'package:flutter/material.dart';
import 'Item.dart';
import 'main.dart';

class Add_Item_Page extends StatefulWidget {
  Add_Item_Page({super.key, required this.content});
  List<Widget> content;

  @override
  State<Add_Item_Page> createState() => _Add_Item_PageState();
}

class _Add_Item_PageState extends State<Add_Item_Page> {
  void add_new_item(Item new_item, SizedBox box) {
    setState(() {
      if (widget.content.isEmpty) {
        widget.content.add(box);
      }
      widget.content.add(new_item);
      widget.content.add(box);
    });
  }

  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double safeAreaWidth = MediaQuery.of(context).viewInsets.right +
        MediaQuery.of(context).viewInsets.left;
    double usableScreenWidth = screenWidth - safeAreaWidth;
    double screenHeight = MediaQuery.of(context).size.height;
    double safeAreaHeight = MediaQuery.of(context).viewInsets.top +
        MediaQuery.of(context).viewInsets.bottom;
    double usableScreenHeight = screenHeight - safeAreaHeight;

    SizedBox box = SizedBox(
      height: usableScreenHeight * 0.02,
    );

    @override
    void dispose() {
      textController1.dispose();
      textController2.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0000FF),
        title: const Center(
          child: Text('Add new item'),
        ),
        //automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xFF444499),
      body: Stack(
        children: [
          const Positioned(
            left: 10,
            top: 10,
            width: 50,
            height: 20,
            child: Text("Title:"),
          ),
          Positioned(
            left: 100,
            top: 10,
            width: usableScreenWidth - 110,
            height: 20,
            child: TextField(
              controller: textController1,
              onSubmitted: (value) => {
                textController1.text = value,
              },
              onChanged: (value) => {
                textController1.text = value,
              },
              maxLines: 1, //or null
              //decoration: const InputDecoration.collapsed(hintText: "..."),
            ),
          ),
          const Positioned(
            left: 10,
            top: 60,
            width: 90,
            height: 20,
            child: Text("Description:"),
          ),
          Positioned(
            left: 100,
            top: 50,
            width: usableScreenWidth - 110,
            height: 80,
            child: TextField(
              controller: textController2,
              onSubmitted: (value) => {
                textController2.text = value,
              },
              onChanged: (value) => {
                textController2.text = value,
              },
              maxLines: 3, //or null
            ),
          ),
          Positioned(
            left: 125,
            top: 150,
            width: 150,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  add_new_item(
                      Item(
                        // content: content,
                        width: usableScreenWidth,
                        height: usableScreenHeight,
                        name_item1: textController1.text,
                        name_item2: textController2.text,
                      ),
                      box);

                  Navigator.pop(context);
                });
              },
              child: const Text("Create"),
            ),
          ),
        ],
      ),
    );
  }
}
