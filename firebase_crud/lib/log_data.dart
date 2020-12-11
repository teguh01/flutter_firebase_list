import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class LogData extends StatefulWidget {
  @override
  _LogDataState createState() => _LogDataState();
}

class _LogDataState extends State<LogData> {
  Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
      .reference()
      .child('DHT')
      .child('data_log')
      .orderByChild('hari');
  }

  Widget _logDataSensor({Map dataSensor}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Hari :",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                dataSensor['hari'],
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.timer,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Jam :",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                dataSensor['jam'],
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Tanggal :",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                dataSensor['tanggal'],
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.beenhere,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "PH :",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                dataSensor['ph'],
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.group_work,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Salinitas :",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                dataSensor['salinitas_air'],
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.graphic_eq,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Ketinggian :",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                dataSensor['ketinggian_air'],
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index){
            Map dataSensor = snapshot.value;
            return _logDataSensor(dataSensor: dataSensor);
          },
        ),
      ),
    );
  }
}
