import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_pro/screen/lenght.dart';

class Weight extends StatefulWidget {
  //const Weight({Key key}) : super(key: key);
  final mail;
  final password;
  final name;
  final gender;
  final age;
  Weight(this.mail, this.password, this.name, this.gender, this.age);
  @override
  _WeightState createState() => _WeightState(mail, password, name, gender, age);
}

class _WeightState extends State<Weight> {
  final mail;
  final password;
  final name;
  final gender;
  final age;
  _WeightState(this.mail, this.password, this.name, this.gender, this.age);
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
                    "How much is your weight?",
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker.integer(
                          initialValue: _currentValue,
                          minValue: 0,
                          maxValue: 200,
                          selectedTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 20),
                          onChanged: (newValue) =>
                              setState(() => _currentValue = newValue)),
                      Text("KG",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Lenght(mail, password, name,
                                  gender, age, _currentValue)));
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
