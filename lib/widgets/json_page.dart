// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, unused_element, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsontask/model/countries_model.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  State<JsonPage> createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "JSON Data Load Example",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: FutureBuilder<List<Countries>>(
        future: getData(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else if (snapshot.hasData) {
            var ShowJsonData = snapshot.data as List<Countries>;
            return ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 1,
                  child: ListTile(
                    title: Text(ShowJsonData[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    subtitle: Text(ShowJsonData[index].code,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        )),
                    onTap: () {
                      final currentStatus = ShowJsonData[index];
                      Navigator.of(context).pop<Countries>(currentStatus);
                    },
                  ),
                ),
              );
            });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Countries>> getData(BuildContext context) async {
    final jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/countries.json");
    return countriesFromJson(jsonString);
  }
}



// FutureBuilder(
//           builder: (context, snapshot) {
//           var ShowJsonData= json.decode(snapshot.data.toString());
//           return ListView.builder(
//             itemCount: ShowJsonData.length!,
//             itemBuilder: (BuildContext context, int index)
//             {
              // return Card ( 
              //   elevation: 2,
              //   child: ListTile( 
              //   title: Text(ShowJsonData[index]['name'],style: TextStyle(
              //   fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black,)),
              //   subtitle: Text(ShowJsonData[index]['code'],style: TextStyle(
              //   fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey,)),
              // )
//               );
//             }
//             );

//         },
//         future: DefaultAssetBundle.of(context).loadString("assets/countries.json"),
//         )