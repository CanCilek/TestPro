import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
//import 'package:gender_selection/gender_selection.dart';
import 'package:test_pro/screen/weight.dart';

class GenderPage extends StatefulWidget {
  //const GenderPage({Key key}) : super(key: key);
  final mail;
  final password;
  final name;
  final age;
  GenderPage(this.mail, this.password, this.name, this.age);
  @override
  _GenderPageState createState() => _GenderPageState(mail, password, name, age);
}

class _GenderPageState extends State<GenderPage> {
  final mail;
  final password;
  final name;
  final age;
  var sex = "";
  _GenderPageState(this.mail, this.password, this.name, this.age);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Test Pro")),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "What is your sex ?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: GenderPickerWithImage(
                    femaleImage: NetworkImage(
                        "https://cdn2.iconfinder.com/data/icons/flat-pack-1/64/Female-256.png"),
                    maleImage: NetworkImage(
                        "https://cdn2.iconfinder.com/data/icons/flat-pack-1/64/Male-256.png"),
                    showOtherGender: false,
                    verticalAlignedText: false,
                    onChanged: (Gender gender) {
                      setState(() {
                        sex = gender.toString();
                      });
                    },
                    selectedGender: Gender.Male, //By Default
                    selectedGenderTextStyle: TextStyle(
                        color: Color(0xFFC41A3B), fontWeight: FontWeight.bold),
                    unSelectedGenderTextStyle: TextStyle(
                        color: Color(0xFF1B1F32), fontWeight: FontWeight.bold),
                    equallyAligned: true,
                    size: 100.0, // default size 40.0
                    animationDuration: Duration(seconds: 1),
                    isCircular: true, // by default true
                    opacityOfGradient: 0.5,
                    padding: EdgeInsets.all(8.0),
                  ),
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
                                  Weight(mail, password, name, sex, age)));
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
