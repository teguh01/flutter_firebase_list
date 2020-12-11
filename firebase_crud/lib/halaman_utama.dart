import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'monitoring.dart' as monitoring;
import 'petunjuk.dart' as petunjuk;
import 'log_data.dart' as log_data;

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("Firebase CRUD"),
        ),

      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new monitoring.Monitoring(),
          new petunjuk.Petunjuk(),
          new log_data.LogData(),
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.amber,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.desktop_windows),text: "Monitoring",),
            new Tab(icon: new Icon(Icons.book), text: "Petunjuk",),
            new Tab(icon: new Icon(Icons.label), text: "Log Data",),
          ],
        ),
      ),
    );
  }
}