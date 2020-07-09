import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _numbers = [];
  int _lastIndex = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener(() {
      ScrollPosition scrollPosition = _scrollController.position;
      if (scrollPosition.pixels == scrollPosition.maxScrollExtent) _fetchData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists and Scroll'),
      ),
      body: Stack(
        children: [_createList(), _createLoading()],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getFirstPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbers.length,
        itemBuilder: (BuildContext context, int index) {
          final indexImage = _numbers[index];
          return FadeInImage(
              placeholder: AssetImage('resources/assets/img/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/300/?image=$indexImage'));
        },
      ),
    );
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    }
    return Container();
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    return Timer(Duration(milliseconds: 1500), () {
      _isLoading = false;
      _scrollController.animateTo(_scrollController.position.pixels + 100,
          curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
      _addImages();
    });
  }

  Future<Null> _getFirstPage() async {
    return Future.delayed(Duration(seconds: 2), () {
      _numbers.clear();
      _lastIndex++;
      _addImages();
    });
  }

  void _addImages() {
    for (var i = 0; i < 10; i++) {
      _lastIndex++;
      _numbers.add(_lastIndex);
    }
    setState(() {});
  }
}
