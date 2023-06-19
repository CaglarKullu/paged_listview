import 'package:flutter/material.dart';
import 'package:paged_listview/paged_listview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> itemList = const [
    Text(
      "data",
      style: TextStyle(color: Colors.black),
    ),
    Text(
      "data",
      style: TextStyle(color: Colors.black),
    ),
    Text(
      "data",
      style: TextStyle(color: Colors.black),
    ),
    Text(
      "data",
      style: TextStyle(color: Colors.black),
    ),
    Text(
      "data",
      style: TextStyle(color: Colors.black),
    ),
    Text(
      "data",
      style: TextStyle(color: Colors.black),
    ),
  ];
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListViewPagination.custom(
                    controller: _controller,
                    itemsPerPage: 5,
                    widgetList: itemList,
                  ),
                ),
                TextButton(
                    onPressed: () => _controller.nextPage(
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.bounceIn),
                    child: const Text("next")),
                TextButton(
                    onPressed: () => _controller.previousPage(
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.bounceIn),
                    child: const Text("pre")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
