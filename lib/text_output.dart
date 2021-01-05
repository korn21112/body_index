import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget{
   String getweight,getheight,val;
   double bmi;

  TextOutput(String height,String weight,String getval,double getbmi){
    this.getheight=height;
    this.getweight=weight;
    this.val=getval;
    this.bmi=getbmi;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: [
          Container(height: 20,),
        Text(getweight!=null&&getheight!=null?'bmi = '+'$bmi':''),
    Container(height: 20,),
    Text(getweight!=null&&getheight!=null?'$val':''),
    ],
    );
  }
}