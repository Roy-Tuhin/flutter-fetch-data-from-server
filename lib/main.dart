import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Http request"),
        ),
        body: Server(),
      ),
    ));
  }
}

class Server extends StatefulWidget {
  _ServerState createState() => _ServerState();
}

class _ServerState extends State<Server> {
  Future<List<dynamic>> fetchData() async {
    final response =
        await http.post("http://medbo.digitalicon.in/api/medboapi/alldoctor");
    // return json.decode(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    return map["Data"];
    // List<dynamic> data = map["Data"];
    // print(data[0]["DoctorId"]);
    // print(data[0]["EncDoctorId"]);    //   if we want to see result in console//
    // print(data[0]["DoctorName"]);
  }

  // String _docId(dynamic doc) {
  //   return doc['doctorId'];
  // }                                     // Same SHIT

  // String _encDid(dynamic doc) {
  //   return doc['encDoctorId'];
  // }

  Widget build(BuildContext context) {
    return (FutureBuilder<List<dynamic>>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return (ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return (Card(
                  child: Column(
                    children: [
                      Text("Doc Id:" + snapshot.data[index]['DoctorId']),
                      Text("Doc EncDoctorId:" +
                          snapshot.data[index]['EncDoctorId']),
                      Text("Doc Name:" + snapshot.data[index]['DoctorName']),
                      Text("Specialisation" +
                          snapshot.data[index]['Specialisation']),
                      // ListTile(
                      //   leading: CircleAvatar(
                      //     radius: 30,
                      //     backgroundImage:
                      //         NetworkImage(snapshot.data[index]['DoctorImage']),
                      //   ),
                      //   title: Text(snapshot.data[index]['DoctorId']),
                      //   subtitle: Text(snapshot.data[index]['EncDoctorId']),
                      // ),
                    ],
                  ),
                ));
              }));
        }
        return CircularProgressIndicator();
      },
    ));
  }
}
