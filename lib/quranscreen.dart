import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'utils.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: widthRatio(context, 20),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Color(0xff151515), BlendMode.exclusion),
          opacity: .3,
          image: AssetImage('assets/Images/quran_bg.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: SafeArea(
        child: Column(
          spacing: 10,
          children: [
            Image.asset('assets/Images/img_header.png'),
            TextFormField(
              decoration: InputDecoration(

                prefixIcon: Image.asset(
                  'assets/Icons/ic_quran.png',
                  color: mainColor,
                ),

                hintText: 'Sura Name',
                hintStyle: TextStyle(color: textColor),
              ),
              style: TextStyle(color: textColor),
              cursorColor: mainColor,
            ),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'Most Recently',
                style: TextStyle(
                  color: textColor,
                  fontSize: widthRatio(context, 16),
                ),
              ),
            ),
            SizedBox(
              height: heightRatio(context, 170),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RecentlyCards(),
                  RecentlyCards(),
                  RecentlyCards(),
                  RecentlyCards(),
                ],
              ),
            ),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'Suras List',
                style: TextStyle(
                  color: textColor,
                  fontSize: widthRatio(context, 16),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.separated(
                itemCount: arabicAuranSuras.length,
                itemBuilder: (context, index) => SuraTile(index: index),
                separatorBuilder: (context, index) => Divider(
                  height: 20,
                  thickness: 1,
                  indent: widthRatio(context, 44),
                  endIndent: widthRatio(context, 44),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentlyCards extends StatelessWidget {
  const RecentlyCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.all(widthRatio(context, 5)),
      padding: EdgeInsetsGeometry.all(widthRatio(context, 7)),
      width: widthRatio(context, 283),
      height: heightRatio(context, 150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: mainColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widthRatio(context, 10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Al-Anbiya',
                    style: TextStyle(fontSize: widthRatio(context, 24)),
                  ),
                  Text(
                    'الأنبياء',
                    style: TextStyle(fontSize: widthRatio(context, 24)),
                  ),
                  Text(
                    '112 Verses',
                    style: TextStyle(fontSize: widthRatio(context, 14)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/Images/quranSura.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class SuraTile extends StatelessWidget {
  final int index;
  const SuraTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuraScreen(index: index)),
      ),
      leading: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Image.asset('assets/Icons/img_sur_number_frame.png'),
          Text(
            '${index+1}',
            style: TextStyle(
              color: textColor,
              fontSize: widthRatio(context, 20),
            ),
          ),
        ],
      ),
      title: Text(
        englishQuranSurahs[index],
        style: TextStyle(color: textColor, fontSize: widthRatio(context, 20)),
      ),
      subtitle: Text(
        AyaNumber[index],
        style: TextStyle(color: textColor, fontSize: widthRatio(context, 14)),
      ),
      trailing: Text(
        arabicAuranSuras[index],
        style: TextStyle(color: textColor, fontSize: widthRatio(context, 20)),
      ),
    );
  }
}

class SuraScreen extends StatelessWidget {
  final int index;
  const SuraScreen({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        title: Text(
          englishQuranSurahs[index],
          style: TextStyle(color: mainColor, fontSize: widthRatio(context, 20)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff202020),
      ),
      body: Container(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: widthRatio(context, 18),
          vertical: heightRatio(context, 8),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/img_bottom_decoration.png'),
            alignment: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Images/img_left_corner.png',
                  height: heightRatio(context, 93),
                ),
                Text(
                  arabicAuranSuras[index],
                  style: TextStyle(
                    color: mainColor,
                    fontSize: widthRatio(context, 20),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: Image.asset(
                    'assets/Images/img_left_corner.png',
                    height: heightRatio(context, 93),
                  ),
                ),
              ],
            ),
            Text(File('assets/Suras/Suras/${index+1}.txt').readAsStringSync(),textAlign: TextAlign.right,style: TextStyle(color: mainColor, fontSize: widthRatio(context, 20)),)
          ],
        ),
      ),
    );
  }
}
