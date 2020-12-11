import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'sensor.dart';

class Monitoring extends StatefulWidget {
  @override
  _MonitoringState createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {

  String json = 'Json';

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('DHT');
  DatabaseReference keadaanSehat = FirebaseDatabase.instance.reference().
    child('DHT').
    child('Json');
  DatabaseReference waktu = FirebaseDatabase.instance.reference().
    child('DHT').
    child('data_log');

  //create database pakai set({'keadaan': 'Sehat'})
  //delete database pakai remove()

  void dataLogSensor(DHT _dht){
    waktu.push().set({
      'hari': _dht.hari,
      'jam': _dht.jam,
      'tanggal': _dht.tanggal,
      'ph': _dht.ph.toString(),
      'salinitas_air': _dht.salinitasAir.toString(),
      'ketinggian_air': _dht.ketinggianAir.toString(),
    });
  }

  void sehat(){
    keadaanSehat.update({'keadaan': 'Sehat'});
  }

  void tidakSehat(){
    keadaanSehat.update({'keadaan': 'Tidak Sehat'});
  }

  void keadaanTambak(DHT _dht)async{
    if(_dht.ph >= 20 && _dht.ph <= 30 && 
       _dht.salinitasAir >= 20 &&  _dht.salinitasAir <= 30 && 
       _dht.ketinggianAir >= 20 && _dht.ketinggianAir <= 30){ 
      sehat();   
    }
    else{
      tidakSehat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold(){
    return Scaffold(
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snapshot){
          if(snapshot.hasData && 
             !snapshot.hasError && 
             snapshot.data.snapshot.value != null){
            var _dht = DHT.fromJson(snapshot.data.snapshot.value[json]);
            keadaanTambak(_dht);
            return tampilData(_dht);
          }         
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }

  Widget tampilData(DHT _dht){
    return Center(
      child: ListView(
        padding: new EdgeInsets.all(10.0),
        children: <Widget>[
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Hari = ${_dht.hari}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Jam = ${_dht.jam}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Tanggal = ${_dht.tanggal}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("pH = ${_dht.ph}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("pH = ${_dht.salinitasAir}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("pH = ${_dht.ketinggianAir}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Keadaan = ${_dht.keadaan}"),
                )
              ],
            ),
          ),
          RaisedButton(
            onPressed: (){
              dataLogSensor(_dht);
            },
          ),
        ],
      ),
    );
  }
}