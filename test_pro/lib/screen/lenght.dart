import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_pro/model/testpro_model.dart';
import 'package:test_pro/screen/homepage.dart';
import 'package:http/http.dart' as http;

class Lenght extends StatefulWidget {
  //const Lenght({Key key}) : super(key: key);
  final mail;
  final password;
  final name;
  final gender;
  final age;
  final weight;
  Lenght(
      this.mail, this.password, this.name, this.gender, this.age, this.weight);
  @override
  _LenghtState createState() =>
      _LenghtState(mail, password, name, gender, age, weight);
}

class _LenghtState extends State<Lenght> {
  final mail;
  final password;
  final name;
  final gender;
  final age;
  final weight;
  _LenghtState(
      this.mail, this.password, this.name, this.gender, this.age, this.weight);
  double selectedDoubleValue = 1.0;

  Future _postInfo() async {
    final _testPro = new TestPro();
    _testPro.mail = mail;
    _testPro.password = password;
    _testPro.age = age;
    _testPro.name = name;
    _testPro.gender = gender;
    _testPro.weight = weight;
    _testPro.lenght = selectedDoubleValue;

    final response = await http.post(
        "https://test-pro-f02a5-default-rtdb.firebaseio.com/test.json",
        body: json.encode(_testPro.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Test Pro")),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "How much is your lenght?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  height: 150,
                  width: 250,
                  child: Row(
                    children: [
                      NumberPicker.decimal(
                          minValue: 1,
                          maxValue: 2,
                          decimalPlaces: 2,
                          initialValue: selectedDoubleValue,
                          selectedTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 20),
                          onChanged: (newValue) =>
                              setState(() => selectedDoubleValue = newValue)),
                      Text("CM",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 100,
                  margin: EdgeInsets.only(top: 25),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.white10)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            content: new Text("Registration Completed"),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () async {
                                  await _postInfo();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TestProHomePage()));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
