import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class HadeithScreen extends StatelessWidget {
  const HadeithScreen({super.key});

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
                child:CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    height: 620,

                  ),
                  items: [
                    HadeithCard(),
                    HadeithCard(),
                    HadeithCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HadeithCard extends StatelessWidget {
  const HadeithCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthRatio(context, 320),
      height: heightRatio(context, 650),
      padding: EdgeInsetsGeometry.only(left:  9,right: 9, top:  12),
      decoration: BoxDecoration(
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
                'الحديث الأول',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: widthRatio(context, 20),
                ),
              ),
            ]
          ),
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(child: Image.asset('assets/Images/quranSura.png',alignment: AlignmentGeometry.center,)),
                    Image.asset('assets/Images/img_bottom_decoration.png',color: Color(0xff505050),alignment: AlignmentGeometry.bottomCenter,fit: BoxFit.fitWidth,),
                  ],
                ),
                Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    """ عن أمـيـر المؤمنـين أبي حـفص عمر بن الخطاب رضي الله عنه ، قال : سمعت رسول الله صلى الله عـليه وسلم يـقـول : ( إنـما الأعـمـال بالنيات وإنـمـا لكـل امـرئ ما نـوى . فمن كـانت هجرته إلى الله ورسولـه فهجرتـه إلى الله ورسـوله ومن كانت هجرته لـدنيا يصـيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه ).
رواه إمام المحد ثين أبـو عـبـد الله محمد بن إسماعـيل بن ابراهـيـم بن المغـيره بن بـرد زبه البخاري الجعـفي،[رقم:1] وابـو الحسـيـن مسلم بن الحجاج بن مـسلم القـشـيري الـنيسـابـوري [رقم :1907] رضي الله عنهما في صحيحيهما اللذين هما أصح الكتب المصنفه. 
""",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,height: 1.9),textAlign: TextAlign.right,
                  ),
                ),
              ),]
            ),
          ),
        ],
      ),
    );
  }
}
