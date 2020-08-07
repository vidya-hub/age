import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var Age_cont = TextEditingController();
  var present_year = 2020;
  Widget out_wid = Text("");
  String d = "";
  String m = "";
  String y = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Age-Calculator",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Times new Roman",
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Icon(
              Icons.people,
              size: 90,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  controller: Age_cont,
                  decoration: InputDecoration(
                    hintText: "ENTER YOUR AGE IN YEARS",
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 130,
              height: 60,
              child: RaisedButton(
                // color: Color.fromRGBO(1, 44, 50, 0.8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.grey)),
                color: Colors.teal,
                onPressed: () {
                  setState(() {
                    d = Find(Age_cont.text).toString();
                    m = (int.parse(Age_cont.text) * 12).toString();
                    y = Age_cont.text;
                    out_wid = Text_Out(y: y, m: m, d: d);
                  });
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Times new Roman",
                      fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            out_wid,
          ],
        ),
      ),
    );
  }

  Find(age) {
    var sum = 0;
    for (var i in range(2020 - int.parse(age), 2020)) {
      print(i);
      if (i % 4 == 0) {
        sum = sum + 366;
      } else {
        sum = sum + 365;
      }
    }
    return sum;
  }
}

class Text_Out extends StatelessWidget {
  const Text_Out({
    Key key,
    @required this.y,
    @required this.m,
    @required this.d,
  }) : super(key: key);

  final String y;
  final String m;
  final String d;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RichText(
          text: TextSpan(
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 40),
            text: '$y',
            children: <TextSpan>[
              TextSpan(
                text: ' Years  ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 40),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 40),
            text: '$m',
            children: <TextSpan>[
              TextSpan(
                text: ' Months ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 40),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 40),
            text: '$d',
            children: <TextSpan>[
              TextSpan(
                text: ' Days',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 40),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
