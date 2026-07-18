import 'package:flutter/material.dart';

import 'utils.dart';
import 'content_viewer.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<int> searchList = [];

  void addToMostRecent(int index) {
    if (mostRecent.length >= 10) {
      mostRecent.removeLast();
    }
    if (mostRecent.contains(index)) {
      mostRecent.remove(index);
    }
    mostRecent.insert(0, index);
    setState(() {});
  }

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

              onChanged: (v) {
                searchList.clear();
                if (v.isNotEmpty) {
                  if (RegExp(r'[A-Z]').hasMatch(v.toUpperCase())) {
                    String t = '';
                    for (int i = 0; i < englishQuranSurahs.length; i++) {
                      t = englishQuranSurahs[i].toUpperCase();
                      if (t.contains(v.toUpperCase())) {
                        searchList.add(i);
                      }
                    }
                  } else {
                    for (int i = 0; i < arabicAuranSuras.length; i++) {
                      if (arabicAuranSuras[i].contains(v)) {
                        searchList.add(i);
                      }
                    }
                  }
                  if (searchList.isEmpty) {
                    searchList.add(-1);
                  }
                }
                setState(() {});
              },
              style: TextStyle(color: textColor),
              cursorColor: mainColor,
            ),
            searchList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: searchList.isEmpty ? 1 : searchList.length,
                      itemBuilder: (context, index) {
                        return searchList[0] == -1
                            ? Text('Not Found')
                            : SuraTile(
                                index: searchList[index],
                                f: () {
                                  addToMostRecent(searchList[index]);
                                  debugPrint(index.toString());
                                },
                              );
                      },
                    ),
                  )
                : Expanded(
                    child: Column(
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
                                          RecentlyCards(
                                            index: mostRecent[index],
                                          ),
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
                              f: () => addToMostRecent(index),
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
                    ),
                  ),
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
    return InkResponse(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContentViewer(index: index, sura: true),
        ),
      ),
      child: Container(
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
          MaterialPageRoute(
            builder: (context) => ContentViewer(index: index, sura: true),
          ),
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
