// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, unused_import, unused_element

import 'package:flutter/material.dart';
import 'package:jsontask/model/countries_model.dart';
import 'package:jsontask/widgets/json_page.dart';
import '../model/countries_model.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  Countries? data = Countries(code: '', name: '');
  String lastSelected = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // Padding(
      //   padding: const EdgeInsets.only(top: 150, left: 80, right: 80),
      //   child: 
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              Text(
                "Current Selected Item",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data!.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),


              
              SizedBox(
                height: 20,
              ),
              Text(
                "Last Selected Item",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                lastSelected,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),




              SizedBox(
                height: 60,
                width: 200,
                child: RaisedButton(
                  onPressed: () async {
                    lastSelected = data!.name.toString();

                    data = await Navigator.push<Countries>(
                      context,
                      MaterialPageRoute(builder: (ctx) => const JsonPage()),
                    );
                    setState(() {});
                  },
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Color(0xffEAEAEA)),
                  ),
                  textColor: Colors.white,
                  child: Text(
                    "Select New Item",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  elevation: 0,
                ),
              )
            ],
          ),
      ),
      // ),
    );
  }
}
