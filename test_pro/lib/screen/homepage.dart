import 'package:flutter/material.dart';
import 'package:test_pro/screen/register.dart';

class TestProHomePage extends StatefulWidget {
  const TestProHomePage({Key key}) : super(key: key);

  @override
  _TestProHomePageState createState() => _TestProHomePageState();
}

class _TestProHomePageState extends State<TestProHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Test Pro Home Page")),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_headerImages, _bodyItems],
        ),
      ),
    );
  }

  get _headerImages => Expanded(
      flex: 3,
      child: Column(
        children: [
          Expanded(child: Image.asset("assets/images/testpro_logo.jpg"))
        ],
      ));

  get _bodyItems => Expanded(
      flex: 5,
      child: Column(
        children: [
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          SizedBox(
            height: 35,
          ),
          _mailButton,
          SizedBox(
            height: 15,
          ),
          _socialIconsBody,
          SizedBox(
            height: 15,
          ),
          _withoutMailButton
        ],
      ));

  get _mailButton => Row(
        children: [
          Expanded(
              flex: 5,
              child: RaisedButton(
                color: Colors.grey[400],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white10)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Center(child: Text("Continue With E-Mail")),
                ),
              ))
        ],
      );

  get _socialIconsBody => Row(
        children: <Widget>[
          Expanded(
              flex: 5,
              child: RaisedButton(
                color: Colors.blue[400],
                child: Row(
                  children: [
                    Image.asset("assets/images/facebook_logo.png"),
                    Spacer(),
                    Text("Facebook"),
                    Spacer()
                  ],
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white10)),
                onPressed: () {},
              )),
          Spacer(),
          Expanded(
              flex: 5,
              child: RaisedButton(
                color: Colors.white,
                child: Row(
                  children: [
                    Image.asset("assets/images/google_logo.png"),
                    Spacer(),
                    Text("Google"),
                    Spacer()
                  ],
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white10)),
                onPressed: () {},
              )),
        ],
      );
  get _withoutMailButton => Row(
        children: [
          Expanded(
              flex: 5,
              child: RaisedButton(
                color: Colors.red,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white10)),
                onPressed: () {},
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Center(child: Text("Continue Without E-Mail")),
                ),
              ))
        ],
      );
}
