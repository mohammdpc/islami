import 'package:flutter/cupertino.dart';

Color mainColor = Color(0xffE2BE7F);
Color secColor = Color(0xff121212);
Color textColor = Color(0xffffffff);
double widthRatio(BuildContext context,double num)=>MediaQuery.of(context).size.width*num/430;
double heightRatio(BuildContext context,double num)=>MediaQuery.of(context).size.height*num/932;
double getHeight(BuildContext context,)=>MediaQuery.of(context).size.height;
double getWidth(BuildContext context,)=>MediaQuery.of(context).size.width;
