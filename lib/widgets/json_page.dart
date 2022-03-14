// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';

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
        body: FutureBuilder(builder: (context, snapshot) {
          var ShowJsonData= json.decode(snapshot.data.toString());
          return ListView.builder(
            itemCount: ShowJsonData.length,
            itemBuilder: (BuildContext context, int index)
            {
              return ListTile( 
                title: Text(ShowJsonData[index]['name'],style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black,)),
                subtitle: Text(ShowJsonData[index]['code'],style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey,)),
              );
            }
            );

        },
        future: DefaultAssetBundle.of(context).loadString("assets/countries.json"),
        )
        
        );
  }
}
