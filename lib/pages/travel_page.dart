import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/travel_tab_dao.dart';
import 'package:flutter_trip/model/travel_tab_model.dart';
import 'package:flutter_trip/pages/travel_tab_page.dart';

class TravelPage extends StatefulWidget {
  TravelPage({Key key}) : super(key: key);

  @override
  _TravelPageState createState() {
    return _TravelPageState();
  }
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  TabController _controller;
  List<TravelTab> tabs = [];
  TravelTabModel travelTabModel;

  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    TravelTabDao.fetch().then(((TravelTabModel model) {
      _controller = TabController(length: model.tabs.length, vsync: this);
      setState(() {
        tabs = model.tabs;
        travelTabModel = model;
      });
    })).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 30),
            child: TabBar(
              tabs: tabs.map<Tab>((TravelTab tab) {
                return Tab(
                  text: tab.labelName,
                );
              }).toList(),
              labelColor: Colors.black,
              labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xff2fcfbb),
                  ),
                  insets: EdgeInsets.only(bottom: 10)),
              isScrollable: true,
              controller: _controller,
            ),
          ),
          Flexible(
            child: TabBarView(
              children: tabs.map((TravelTab tab) {
                return TravelTabPage(
                  travelUrl: travelTabModel.url,
                  groupChannelCode: tab.groupChannelCode,
                );
              }).toList(),
              controller: _controller,
            ),
          )
        ],
      ),
    );
  }
}
