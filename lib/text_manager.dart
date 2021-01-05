
import 'package:flutter/material.dart';
import './text_output.dart';

class TextManager extends StatefulWidget{

  String inputheight,inputweight;

  TextManager(String h,String w){
    this.inputheight=h;
    this.inputweight=w;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextManagerState();
  }
}

class _TextManagerState extends State<TextManager>{

  String getheight,getweight,val;
  int height,weight;
  double bmi;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        RaisedButton(
          onPressed: () {
            setState(() {
              getheight = widget.inputheight;
              height=int.parse(getheight);
              getweight = widget.inputweight;
              weight=int.parse(getweight);
              bmi=(weight/(height/100))/(height/100);
              if(bmi>=30){
                val='obesity';
              }else if(bmi>=25){
                val='over weight';
              }else if(bmi>=18.5){
                val='normal weight';
              }
              else{
                val='under weight';
              }
            });
          },
          child: Text('calculate'),
        ),
        TextOutput(getheight, getweight, val, bmi)
      ],
    );
  }
}