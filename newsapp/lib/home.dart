// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? stringResponse;
Map? mapResponse;
Map? dataResponse;
List? listResponse;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=d394960d6d364a9eacb07e25ed5d5e76"));

    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!["articles"];
      });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Latest News"),
          backgroundColor: Colors.teal,
        ),
        body: Stack(children: [
          Container(
            child: Image.asset(
              "assets/border4.png",
              height: 3000,
              width: 2000,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Container(
              height: 680,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(listResponse![index]["urlToImage"],
                              height: 250, width: 380, fit: BoxFit.cover),
                          ListTile(
                            title: Text(
                              listResponse![index]["title"].toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                listResponse![index]["description"].toString()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: listResponse == null ? 0 : listResponse?.length,
              ),
            ),
          )
        ]));
  }
}


// ListView.builder(
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 8.0, 8.0, 10),
//                 child: Card(
//                   child: Column(
//                     children: [
//                       Image.network(listResponse![index]["urlToImage"],
//                           height: 250, width: 380, fit: BoxFit.cover),
//                       ListTile(
//                         title: Text(
//                           listResponse![index]["title"].toString(),
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                             listResponse![index]["description"].toString()),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             itemCount: listResponse == null ? 0 : listResponse?.length,
//           )