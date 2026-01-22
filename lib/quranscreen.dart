import 'dart:math';

import 'package:flutter/material.dart';
import 'utils.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<int> searchList = [];

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
            Column(
              children: [
                mostRecent.isEmpty
                    ? SizedBox()
                    : Column(
                  children: [
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mostRecent.length,
                        itemBuilder: (context, index) =>
                            RecentlyCards(index: mostRecent[index]),
                      ),
                    ),
                  ],
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
                    itemBuilder: (context, index) => SuraTile(
                      index: index,
                      f: () => setState(() {
                        if (mostRecent.length >= 10) {
                          mostRecent.removeLast();
                        }
                        if(mostRecent.contains(index)){
                          mostRecent.remove(index);
                        }
                        mostRecent.insert(0, index);
                      }),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: 20,
                      thickness: 1,
                      indent: widthRatio(context, 44),
                      endIndent: widthRatio(context, 44),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RecentlyCards extends StatelessWidget {
  final int index;
  const RecentlyCards({super.key, required this.index});

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
                    englishQuranSurahs[index],
                    style: TextStyle(fontSize: widthRatio(context, 24)),
                  ),
                  Text(
                    arabicAuranSuras[index],
                    style: TextStyle(fontSize: widthRatio(context, 24)),
                  ),
                  Text(
                    '${ayaNumber[index]} Verses',
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
  final VoidCallback f;
  const SuraTile({super.key, required this.index, required this.f});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuraScreen(index: index)),
        );
        f();
      },
      leading: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Image.asset('assets/Icons/img_sur_number_frame.png'),
          Text(
            '${index + 1}',
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
        ayaNumber[index],
        style: TextStyle(color: textColor, fontSize: widthRatio(context, 14)),
      ),
      trailing: Text(
        arabicAuranSuras[index],
        style: TextStyle(color: textColor, fontSize: widthRatio(context, 20)),
      ),
    );
  }
}

class SuraScreen extends StatefulWidget {
  final int index;
  const SuraScreen({super.key, required this.index});

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  late List<String> contentList = [];
  void loadSuraContent() async {
    if (contentList.isEmpty) {
      String suraContent = await DefaultAssetBundle.of(
        context,
      ).loadString('assets/Suras/Suras/${widget.index + 1}.txt');
      contentList = suraContent.split('\n');
      contentList.removeWhere((e) => e.trim().isEmpty);
      setState(() {});
    }
  }

  @override
  void initState() {
    loadSuraContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        title: Text(
          englishQuranSurahs[widget.index],
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
                  arabicAuranSuras[widget.index],
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: getWidth(context) * .225),
                child: ListView.builder(
                  itemCount: contentList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color(0xff202020),
                      ),
                      child: Text(
                        '[${index + 1}]${contentList[index]}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: mainColor,
                          fontSize: widthRatio(context, 20),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
