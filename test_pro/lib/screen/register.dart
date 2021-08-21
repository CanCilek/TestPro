import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:test_pro/screen/description_name.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var deger;
  bool _isHidden;
  bool _isHidden1;
  final mailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  @override
  void initState() {
    _isHidden = true;
    _isHidden1 = true;
    deger = signupWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page")),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              FlutterToggleTab(
                width: 90,
                borderRadius: 30,
                height: 50,
                selectedBackgroundColors: [Colors.red],
                initialIndex: 0,
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                unSelectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                labels: ["SignUp", "SignIn"],
                selectedLabelIndex: (index) {
                  setState(() {
                    if (index == 0) {
                      deger = signupWidget();
                    } else {
                      deger = signInWidget();
                    }
                  });
                },
              ),
              Container(child: deger)
            ],
          ),
        ),
      ),
    );
  }

  signupWidget() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/testpro_logo.jpg')),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: mailTEC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Email',
                  hintText: 'Enter Your Mail'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
              controller: passwordTEC,
              obscureText: _isHidden,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Create Password',
                  hintText: 'Enter secure password',
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
              obscureText: _isHidden,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Re-Write Password',
                  hintText: 'Enter secure password',
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            width: 300,
            child: Column(
              children: [
                RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        children: [
                      TextSpan(
                          text:
                              "Curabitur lobortis id lorem id bibendum. Ut id consectetur magna."),
                      TextSpan(
                        text: "Terms of Use ",
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: "augue enim, pulvinar "),
                      TextSpan(
                          text: "Privacy Notice",
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(text: " lacina at."),
                    ])),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  color: Colors.grey[500],
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.white10)),
                  onPressed: () {
                    print(mailTEC.text);
                    print(passwordTEC.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionName(
                                mailTEC.text, passwordTEC.text)));
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
              ],
            ),
          ),
          SizedBox(
            height: 130,
          ),
        ],
      ),
    );
  }

  signInWidget() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/testpro_logo.jpg')),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Email',
                  hintText: 'Enter Your Mail'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
              obscureText: _isHidden1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                  suffix: InkWell(
                    onTap: _togglePasswordView1,
                    child: Icon(
                        _isHidden1 ? Icons.visibility : Icons.visibility_off),
                  )),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  decoration: TextDecoration.underline),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            child: RaisedButton(
              color: Colors.grey[500],
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.white10)),
              onPressed: () {},
              child: Center(
                  child: Text(
                "Continue",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          SizedBox(
            height: 130,
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }
}
