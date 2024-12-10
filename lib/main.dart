import 'package:flutter/material.dart';
import 'Add_Item_Page.dart';

void main() {
  runApp(const MyApp());
}

List<Widget> content = [];

class VerticalScrollView extends StatefulWidget {
  VerticalScrollView({
    super.key,
    required this.cont,
  });
  List<Widget> cont;

  @override
  State<VerticalScrollView> createState() => _VerticalScrollViewState();
}

class _VerticalScrollViewState extends State<VerticalScrollView> {
  @override
  Widget build(BuildContext context) {
    content = widget.cont;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003399),
        title: const Center(child: Text('Notes')),
      ),
      backgroundColor: const Color(0xFF444499),
      body: SingleChildScrollView(
        child: Column(
          children: content,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final value = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Add_Item_Page(
                      content: content,
                    )),
          );
          setState(() {
            content = widget.cont;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: VerticalScrollView(
        cont: [],
      ),
    );
  }
}
