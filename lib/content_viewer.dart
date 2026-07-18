import 'package:flutter/material.dart';
import 'dart:math';

import 'utils.dart';

class ContentViewer extends StatefulWidget {
  final int index;
  final bool sura;
  const ContentViewer({super.key, required this.index, required this.sura});

  @override
  State<ContentViewer> createState() => _ContentViewerState();
}

class _ContentViewerState extends State<ContentViewer> {
  List<String> contentList = [];
  VoidCallback f = () {};
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
    widget.sura ? loadSuraContent() : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        title: Text(
          widget.sura
              ? englishQuranSurahs[widget.index]
              : 'Hadith ${widget.index + 1}',
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
                  widget.sura
                      ? arabicAuranSuras[widget.index]
                      : hadithList[widget.index].title,
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
                child: widget.sura
                    ? ListView.separated(
                        itemCount: contentList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: BoxBorder.all(color: mainColor, width: 2),
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
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                      )
                    : Text(
                        hadithList[widget.index].content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
