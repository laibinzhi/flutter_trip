import 'package:flutter/material.dart';
import 'package:flutter_trip/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SearchBar(
            hideLeft: true,
            defaultText: '哈哈',
            hint: '123',
            leftButtonClick: () {
              Navigator.pop(context);
            },
            onChanged: _onTextChange,
          ),
        ],
      ),
    );
  }

  _onTextChange(text) {}
}
