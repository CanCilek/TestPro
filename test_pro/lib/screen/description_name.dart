import 'package:flutter/material.dart';
import 'package:test_pro/screen/age.dart';

class DescriptionName extends StatefulWidget {
  final mail;
  final password;
  // const DescriptionName({Key key}) : super(key: key);
  DescriptionName(this.mail, this.password);

  @override
  _DescriptionNameState createState() => _DescriptionNameState(mail, password);
}

class _DescriptionNameState extends State<DescriptionName> {
  var mail;
  var password;
  _DescriptionNameState(this.mail, this.password);
  TextEditingController _nameTEC;

  @override
  @override
  void initState() {
    super.initState();
    _nameTEC = new TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Test Pro")),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Your Name ?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _nameTEC,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Name',
                        hintText: 'Enter Your Name'),
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
                                  Age(mail, password, _nameTEC.text)));
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
