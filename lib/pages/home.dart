import 'package:flutter/material.dart';
import 'package:flutter_listview/widgets/chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> _list = [
    Tab(
      text: "CHATS",
    ),
    Tab(
      text: "STATUS",
    ),
    Tab(
      text: "CALLS",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ListView"),
        bottom: TabBar(
          tabs: _list,
          controller: _controller,
          onTap: (index) {},
        ),
        elevation: 0,
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Chat(),
          Center(
            child: Text(_selectedIndex.toString()),
          ),
          Center(
            child: Text(_selectedIndex.toString()),
          ),
        ],
      ),
    );
  }
}
