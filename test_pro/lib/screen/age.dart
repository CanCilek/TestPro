import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_pro/screen/gender.dart';

class Age extends StatefulWidget {
  //const Age({Key key}) : super(key: key);
  final mail;
  final password;
  final name;
  Age(this.mail, this.password, this.name);
  @override
  _AgeState createState() => _AgeState(mail, password, name);
}

class _AgeState extends State<Age> {
  final mail;
  final password;
  final name;
  _AgeState(this.mail, this.password, this.name);
  int _currentValue = 0;
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
                    "How old are you ?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                NumberPicker.integer(
                    initialValue: _currentValue,
                    minValue: 0,
                    maxValue: 100,
                    selectedTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
                    onChanged: (newValue) =>
                        setState(() => _currentValue = newValue)),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GenderPage(mail, password, name,_currentValue)));
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
