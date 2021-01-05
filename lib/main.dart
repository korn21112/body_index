import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './text_output.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  TextEditingController inputcontrollerheight = new TextEditingController();
  TextEditingController inputcontrollerweight = new TextEditingController();

  String getheight, getweight, val;
  int height, weight;
  double bmi;

  OutlineInputBorder _outlineInputBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: Colors.deepPurpleAccent),
      gapPadding: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Body Mass Index',
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(height: 20,),
                TextFormField(
                  controller: inputcontrollerheight,
                  decoration: InputDecoration(
                    hintText: "enter your height(cm)",
                    labelText: 'Height',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: _outlineInputBorder(),
                    focusedBorder: _outlineInputBorder(),
                  ),
                ),
                Container(height: 20,),
                TextFormField(
                  controller: inputcontrollerweight,
                  decoration: InputDecoration(
                    hintText: "enter your weight(kg)",
                    labelText: 'Weight',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: _outlineInputBorder(),
                    focusedBorder: _outlineInputBorder(),
                  ),
                ),
                Container(height: 20,),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      getheight = inputcontrollerheight.text;
                      height = int.parse(getheight);
                      getweight = inputcontrollerweight.text;
                      weight = int.parse(getweight);
                      bmi = (weight / (height / 100)) / (height / 100);
                      if (bmi >= 30) {
                        val = 'obesity';
                      } else if (bmi >= 25) {
                        val = 'over weight';
                      } else if (bmi >= 18.5) {
                        val = 'normal weight';
                      } else {
                        val = 'under weight';
                      }
                    });
                  },
                  color: Colors.deepPurple,

                  child: Text(
                    'calculate',
                    style: TextStyle(color: Colors.white),),
                ),
                TextOutput(getheight, getweight, val, bmi)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
