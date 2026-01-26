import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Color(0xff151515), BlendMode.exclusion),
          opacity: .3,
          image: AssetImage('assets/Images/hadith_bg.png'),
          fit: BoxFit.fitWidth,
          alignment: AlignmentGeometry.topCenter,
        ),
      ),
      child: Container(
        width: getWidth(context),
        height: getHeight(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff202020), Colors.transparent],
            begin: AlignmentGeometry.center,
            end: AlignmentGeometry.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Image.asset('assets/Images/img_header.png'),
              Expanded(
                child:CarouselSlider.builder(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    height: 620,
                  ),
                  itemCount: hadithList.length,
                  itemBuilder: (context,index,i)=>HadithCard(index: index,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HadithCard extends StatelessWidget {
  final int index;
  const HadithCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthRatio(context, 320),
      height: heightRatio(context, 650),
      padding: EdgeInsetsGeometry.only(left:  9,right: 9, top:  12),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/Images/HadithCardBackGround 1.png'),invertColors: false),
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Images/img_left_corner.png',
                  color: Colors.black,
                  height: heightRatio(context, 93),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: Image.asset(
                    'assets/Images/img_left_corner.png',
                    color: Colors.black,
                    height: heightRatio(context, 93),
                  ),
                ),
              ],
            ),
              Text(
                hadithList[index].title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: widthRatio(context, 20),
                ),
              ),
            ]
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                hadithList[index].content,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,height: 1.9),textAlign: TextAlign.right,
              ),
            ),
          ),
          Image.asset('assets/Images/img_bottom_decoration.png',color: Color(0xff505050),alignment: AlignmentGeometry.bottomCenter,fit: BoxFit.fitWidth,),
        ],
      ),
    );
  }
}
